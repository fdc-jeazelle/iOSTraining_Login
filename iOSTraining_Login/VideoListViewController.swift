//
//  VideoListViewController.swift
//  iOSTraining_Login
//
//  Created by FDC.JEAZELLE-NC-WEB on 7/21/24.
//

import UIKit


class VideoListViewController: UIViewController{
    
    @IBOutlet weak var videoListView: UITableView!
    
    // Create an instance of the ProductsViewModel to fetch data
    private let viewModel = ProductsViewModel()
    // An array to store the products to be displayed in the table view
    private var videos: [Product1] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoListView.delegate = self
        videoListView.dataSource = self
        let nib = UINib(nibName: "VideoList", bundle: nil)
        self.videoListView.register(nib, forCellReuseIdentifier: "VideoList")
        // Do any additional setup after loading the view.
        
        fetchData()
    }
        
    
    func fetchData(){
        // Call the fetchProducts function in the view model
        viewModel.fetchProducts{[weak self] result in
            DispatchQueue.main.async{
                switch result {
                case .success(let products):
                    //update local values of videos with the fetched array from productviewmodel
                    self?.videos = products
                    self?.videoListView.reloadData()
                  print("success videolist")
//                    print(self?.videos)
                    
                case .failure(let error):
                    print("FAILED: " , error)
                }
            }
        }
    }

}

extension VideoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(videos)
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "VideoList", for: indexPath) as? VideoList {
            let video = videos[indexPath.row]
            cell.titleLbl.text = video.title
//            cell.imageDisplay.image =
            if let imageUrlString = video.images.first, let imageUrl = URL(string: imageUrlString) {
                   // Load the image asynchronously
                   URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                       // Ensure there are no errors and data is received
                       if let error = error {
                           print("Error loading image: \(error.localizedDescription)")
                           return
                       }
                       guard let data = data, let image = UIImage(data: data) else {
                           print("Failed to load image data")
                           return
                       }
                       // Update the image view on the main thread
                       DispatchQueue.main.async {
                           cell.imageDisplay.image = image
                           // Optionally, you might want to set the frame or constraints of the imageView here
                       }
                   }.resume()
               }
//            print( viewModel.productList_container)
//            let videos = viewModel.productList_container.products[indexPath.row]
//            print(videos)
//            cell.titleLbl.text = "test"
            
//            cell.indexPath = indexPath
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
