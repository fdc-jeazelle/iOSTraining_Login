//
//  ProductDetailsViewController.swift
//  iOSTraining_Login
//
//  Created by FDC.JEAZELLE-NC-WEB on 7/17/24.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    var productIndexPath: IndexPath?
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!

    
    @IBOutlet weak var prodDetailsImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
   
    
    @IBAction func likeBtn(_ sender: Any) {
        print("here")
        guard let indexPath = productIndexPath else {
            
            print("indexpath is nil")
            return
        }
        let userinfo: [String: IndexPath] = ["indexPath" : indexPath]
        let name = Notification.Name(rawValue: likeNotificationKey)
        NotificationCenter.default.post(name: name, object: nil, userInfo: userinfo)
    }
    
    @IBAction func dislikeBtn(_ sender: Any) {
        guard let indexPath = productIndexPath else {return}
        let userinfo: [String: IndexPath] = ["indexPath" : indexPath]
        let name = Notification.Name(rawValue: dislikeNotificationKey)
        NotificationCenter.default.post(name: name, object: nil, userInfo: userinfo)
    }
    var product: Product1?
//    var product: Product? {
//        didSet{
//            displayData()
//        }
//    }
    
    private let viewModel = ProductsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

       
        displayData()
        // Do any additional setup after loading the view.
    }

    func displayData(){
        print("here")
        guard let product = product else { return }
        
        viewModel.fetchProducts { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success( let productList):
                    print("list: ", productList)
                case .failure(let error):
                    print("failed attempt")
                }
            }
        }
        
        
        titleLbl.text = product.title
        descriptionLbl.text = product.description
        
        if let imageUrlString = product.images.first, let imageUrl = URL(string: imageUrlString) {
           loadImage(from: imageUrl) { image in
               DispatchQueue.main.async {
                   self.prodDetailsImg.image = image
               }
           }
       } else {
           self.prodDetailsImg.image = nil  // Placeholder or default image
       }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
           let task = URLSession.shared.dataTask(with: url) { data, response, error in
               if let error = error {
                   print("Failed to load image: \(error.localizedDescription)")
                   completion(nil)
                   return
               }
               guard let data = data, let image = UIImage(data: data) else {
                   completion(nil)
                   return
               }
               completion(image)
           }
           task.resume()
       }

}
