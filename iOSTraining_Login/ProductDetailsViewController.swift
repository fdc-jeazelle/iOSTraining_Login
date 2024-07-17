//
//  ProductDetailsViewController.swift
//  iOSTraining_Login
//
//  Created by FDC.JEAZELLE-NC-WEB on 7/17/24.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
   
    @IBAction func closebtn(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBOutlet weak var prodDetailsImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    var product: Product?
//    var product: Product? {
//        didSet{
//            displayData()
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()

     
        displayData()
        // Do any additional setup after loading the view.
    }

    func displayData(){
        
        guard let product = product else {return}
        
        titleLbl.text = product.name
        subtitleLbl.text = product.subtitle
        descriptionLbl.text = product.description
        prodDetailsImg.image = UIImage(named: product.image)
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
