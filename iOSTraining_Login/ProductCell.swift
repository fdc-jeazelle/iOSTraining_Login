//
//  ProductCell.swift
//  iOSTraining_Login
//
//  Created by FDC.JEAZELLE-NC-WEB on 7/17/24.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productLbl: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    
    var product: Product? {
        didSet{
            displayData()
        }
    }
    override func awakeFromNib() {
        
//        productLbl.text = product?.name
//        productImg.image = product?.image
        super.awakeFromNib()
        productLbl.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        // Initialization code
        
    }
    func displayData(){
        guard let product = product else {
            return
        }
        
        productLbl.text = product.name
        productImg.image = UIImage(named: product.image)
    }
}
