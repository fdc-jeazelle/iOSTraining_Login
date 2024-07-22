//
//  TeacherDetailsViewController.swift
//  iOSTraining_Login
//
//  Created by FDC.JEAZELLE-NC-WEB on 7/16/24.
//

import UIKit


protocol TeacherDetailsViewControllerDelegate {
    func didReportTeacher(name:String)
    func didAddToFavorite()
}
//
extension TeacherDetailsViewControllerDelegate { //add this code to make didAddToFavorite() function optional
    func didAddToFavorite(){
    } //optional function
}
class TeacherDetailsViewController: UIViewController {
    var delegate: TeacherDetailsViewControllerDelegate?
    
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
        
        let reportBarButtonItem = UIBarButtonItem(title: "Report", style: .plain, target: self, action: #selector(didTapReport))
        
        self.navigationItem.rightBarButtonItem = reportBarButtonItem
        // Do any additional setup after loading the view.
    }
    
    @objc private func didTapReport(){
        self.delegate?.didReportTeacher(name: namelbl.text!) //call function:didReportTeacher() trigger to use in Teacher List View Controller for notification purposes
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
