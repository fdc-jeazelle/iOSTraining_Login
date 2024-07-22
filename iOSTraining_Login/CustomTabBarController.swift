//
//  CustomTabBarController.swift
//  iOSTraining_Login
//
//  Created by FDC.JEAZELLE-NC-WEB on 7/18/24.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
       
        // Do any additional setup after loading the view.
    }
    
    private func setupViewControllers(){
        let teacherListVC = setupTab(for: TeacherListViewController(), with: .systemBackground,title: "Teachers", imageName: "person.circle.fill", tag: 0)
        let productListVC = setupTab(for: ProductsViewController(), with: .systemBackground, title: "Products", imageName: "bag.fill", tag: 0)
        let homeVC = setupTab(for: VideoListViewController(),with: .systemBackground, title: "Home", imageName: "house.fill", tag: 0)
        let settingsVC = setupTab(for: SettingsViewController(),with: .systemBackground, title: "Settings", imageName: "gear", tag: 0)
        
        
        viewControllers = [homeVC, teacherListVC, productListVC,settingsVC] //contains an array of view controllers to display
    }
    
     func setupTab(for viewController: UIViewController, with color: UIColor, title: String, imageName: String, tag: Int) -> UIViewController{
        viewController.view.backgroundColor = color
        viewController.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: imageName), tag: tag)
        
        return viewController
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
