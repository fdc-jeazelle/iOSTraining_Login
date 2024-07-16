//
//  TeacherDetailsViewController.swift
//  iOSTraining_Login
//
//  Created by FDC.JEAZELLE-NC-WEB on 7/16/24.
//

import UIKit

class TeacherDetailsViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var ratingslbl: UILabel!
    @IBOutlet weak var addresslbl: UILabel!
    @IBOutlet weak var agelbl: UILabel!
    
    var teacher: Teacher? //fetch teacher array from teacherlistviewcontoller
//    var nameTeacher: String?
//    var ratingsTeacher:Int?
//    var addressTeacher:String?
//    var ageTeacher:Int?
//    
    override func viewDidLoad() {
        
        namelbl.text = teacher?.name
        let ageString: String = "\(teacher?.age ?? 0)" // Specify type for clarity
        agelbl.text = ageString
        let ratingString: String = "\(teacher?.ratings ?? 0)" // Specify type for clarity
        ratingslbl.text = ratingString
        addresslbl.text = teacher?.address
        imageview.image = teacher?.image
        
        super.viewDidLoad()
        
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
