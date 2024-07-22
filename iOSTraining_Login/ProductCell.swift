//
//  ProductCell.swift
//  iOSTraining_Login
//
//  Created by FDC.JEAZELLE-NC-WEB on 7/17/24.
//

import UIKit
import Kingfisher

let likeNotificationKey = "likeThis"
let dislikeNotificationKey = "dislikeThis"

class ProductCell: UICollectionViewCell {
    let liked = Notification.Name(rawValue: likeNotificationKey)
    let disliked = Notification.Name(rawValue: dislikeNotificationKey)
    
    @IBOutlet weak var productLbl: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    
    @IBOutlet weak var isLike: UIButton!
    
//    var product: Product? {
//        didSet{
//            displayData()
//        }
//    }
    var product: Product?
    var indexPath: IndexPath?
  
   
    private let viewModel = ProductsViewModel()
    override func awakeFromNib() {
        
//        productLbl.text = product?.name
//        productImg.image = product?.image
        super.awakeFromNib()
        productLbl.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        createObservers()
        // Initialization code
        
//        let url = URL(string: "https://hips.hearstapps.com/hmg-prod/images/peaky-blinders-season-5-finale-tommy-shelby-cillian-murphy-1569158755.jpg?crop=0.498xw:1.00xh;0.252xw,0&resize=1200:*")
//        productImg.kf.setImage(with: url)
        
//        viewModel.fetchProducts{[weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success( let productList):
//                    
//                    if let firstProduct = productList.products.first {
//                        if let imageUrlString = firstProduct.images.first, let imageUrl = URL(string: imageUrlString) {
//                            self?.loadImage(from: imageUrl)
//                        }
//
//                    }
//                case .failure(let error):
//                    print("failed attempt")
//                }
//            }
//        }
        
    }
    // Method to load an image from a URL
        private func loadImage(from url: URL) {
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                // Ensure data is received and convert it to an image
                guard let data = data, let image = UIImage(data: data) else {
                    return
                }
                // Update the image view with the downloaded image on the main thread
                DispatchQueue.main.async {
                    self?.productImg.image = image
                }
            }
            // Start the data task
            task.resume()
        }
    func createObservers(){
        //like
        
        NotificationCenter.default.addObserver(self, selector: #selector(ProductCell.updateLikeStat(notification:)), name: liked, object: nil)
        //dislike
        NotificationCenter.default.addObserver(self, selector: #selector(ProductCell.updateLikeStat(notification:)), name: disliked, object: nil)
    }
    
    @objc func updateLikeStat(notification: NSNotification){
        guard let userInfo = notification.userInfo,
                      let notificationIndexPath = userInfo["indexPath"] as? IndexPath,
                      let currentIndexPath = self.indexPath,
                      notificationIndexPath == currentIndexPath else { return }
        
        let isLiked = notification.name == liked
        let color = isLiked ? UIColor.systemRed : UIColor.systemGray2
        isLike.backgroundColor = color
        
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    func displayData(){
        guard let product = product else {
            return
        }
        
//        productLbl.text = product.name
//        productImg.image = UIImage(named: product.image)
    }
}
