//
//  ProductsViewController.swift
//  iOSTraining_Login
//
//  Created by FDC.JEAZELLE-NC-WEB on 7/17/24.
//

import UIKit
struct Product {
    let name: String
    let image: String
    let subtitle: String
    let description: String
}


class ProductsViewController: UIViewController {
    
    @IBOutlet weak var productView: UICollectionView!
    
    
    var products: [Product] = [
        Product(name:"Jake", image: "jake.png", subtitle: "The Adventurous Soul", description: "Jake is always on the lookout for his next big adventure. With a heart full of wanderlust, he thrives on exploring new places and meeting new people. His curiosity often leads him into thrilling escapades, making him a natural storyteller."),
        Product(name:"Jane", image: "jane.png", subtitle: "The Thoughtful Intellectual", description: "Jane is known for her sharp intellect and thoughtful nature. She spends her days buried in books and her nights engaging in deep conversations. Her love for knowledge and her empathetic personality make her a trusted friend and a wise advisor." ),
        Product(name:"Penny", image: "penny.png", subtitle: "The Free-Spirited Artist", description: "Penny lives life with a brush in one hand and a sketchpad in the other. Her artistic talents are matched only by her free spirit, which drives her to see the world in vibrant colors. She inspires those around her with her creativity and zest for life."),
        Product(name:"John", image: "john.png", subtitle: "The Reliable Protector", description: "John is the epitome of reliability and strength. With a steady hand and a compassionate heart, he is always there to support and protect his loved ones. His presence is a comforting anchor in the stormiest of seas."),
        Product(name:"ice king", image: "iceking.png", subtitle: "The Enigmatic Ruler", description: "Ice King reigns over his icy domain with a mysterious aura. His cold exterior conceals a complex mind filled with ancient wisdom and a hidden longing for connection. His enigmatic nature makes him a figure of intrigue and respect."),
        Product(name:"Angelina", image: "angelina.png", subtitle: "The Charismatic Leader", description: "Angelina exudes charisma and confidence, naturally drawing people to her. Her leadership skills and magnetic personality make her an inspiring figure who can rally others towards a common goal. She leads with grace and unwavering determination."),
        Product(name:"Depp", image: "depp.png", subtitle: "The Charming Maverick", description: "Depp is a charming maverick with a flair for the unconventional. He navigates life with a mischievous grin and a rebellious spirit, always ready to challenge the status quo. His unpredictable nature keeps everyone guessing and entertained."),
        Product(name:"Bea", image: "pfp.png",subtitle: "The Compassionate Healer", description: "Bea's nurturing spirit and healing hands have a magical touch. Whether tending to physical wounds or offering emotional support, she brings comfort and care to those in need. Her kindness and empathy make her a beloved figure in her community."),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productView.dataSource = self
        productView.delegate = self
        let nib = UINib(nibName: "ProductCell", bundle: nil)
        self.productView.register(nib, forCellWithReuseIdentifier: "ProductCell")
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
            cell.product = products[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let itemWidth = (collectionView.bounds.width-20)/3
////        print(UIDevice())
//        return CGSize(width: itemWidth, height: itemWidth)
        let numberOfColumns: Int
        let deviceWidth = view.frame.width
        
        if deviceWidth > 600 {
            numberOfColumns = 4 // iPad or larger device
        } else {
            numberOfColumns = 2 //iPhone or smaller
        }
        let spacing: CGFloat = 10
        let totalSpacing = (CGFloat(numberOfColumns - 1) * spacing)
        let itemWidth = (deviceWidth - totalSpacing) / CGFloat(numberOfColumns)
        return CGSize(width: itemWidth, height: itemWidth)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 10
    }
//    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let prodDetail = ProductDetailsViewController()
        prodDetail.product = products[indexPath.row]
        prodDetail.modalPresentationStyle = .overFullScreen
        self.present(prodDetail, animated: true)
    }
    
}
