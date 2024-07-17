//
//  TeacherListViewController.swift
//  iOSTraining_Login
//
//  Created by FDC.JEAZELLE-NC-WEB on 7/16/24.
//

import UIKit
struct Teacher {
    let name: String
    let country:  String
    let age: Int
    let ratings: Int
    let address: String
    let image: UIImage
}



class TeacherListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var teachers: [Teacher] = [
        Teacher(name:"John Doe", country: "United Kingdom", age: 22, ratings: 4, address: "Sample Address, United Kingdom", image: UIImage(named: "john.png") ?? UIImage()),
        Teacher(name:"Jane Austen", country: "France",  age: 25, ratings: 4, address: "Sample Address, France", image: UIImage(named: "jane.png") ?? UIImage()),
        Teacher(name:"Angelina Jolie", country: "Ethopia",  age: 26, ratings: 4, address: "Sample Address, Ethopia",  image: UIImage(named: "angelina.png") ?? UIImage()),
        Teacher(name:"Johnny Depp", country: "Indonesia",  age: 22, ratings: 4, address: "Sample Address, Indonesia",  image: UIImage(named: "depp.png") ?? UIImage()),
        Teacher(name:"Penny Lane", country: "Turkey", age: 30, ratings: 5, address: "Sample Address, Turkey",  image: UIImage(named: "penny.png") ?? UIImage())
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TeacherCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "TeacherCell")
        // Do any additional setup after loading the view.
    }

   
    
}

extension TeacherListViewController: UITableViewDelegate, UITableViewDataSource {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teachers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell", for: indexPath) as? TeacherCell {
//            cell.accessoryType = .disclosureIndicator
            cell.tableImage.image = teachers[indexPath.row].image
            cell.teacherName.text = teachers[indexPath.row].name
            cell.countryName.text = teachers[indexPath.row].country
            return cell
        }
        return UITableViewCell()
    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "AdsBannerCell", for: indexPath) as? TeacherCell {
////            cell.accessoryType = .disclosureIndicator
//            cell.adImage.image = teachers[indexPath.row].image
//            cell.adDesc.text = teachers[indexPath.row].name
//            cell.adTitle.text = teachers[indexPath.row].country
//            return cell
//        }
//        return UITableViewCell()
//    }
 
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Confirmation", message: "Are you sure you want to delete?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
//                print("delete this row \(indexPath.row)")
                self.teachers.remove(at: indexPath.row)
                tableView.reloadData()
                
            }))
            self.present(alert, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let detailObj = TeacherDetailsViewController(nibName: "TeacherDetailsViewController", bundle: nil)
            detailObj.teacher = teachers[indexPath.row]
            self.navigationController?.pushViewController(detailObj, animated: true) //with back button
        
        
    }
}
