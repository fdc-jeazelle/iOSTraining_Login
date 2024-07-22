//
//  SettingsViewController.swift
//  iOSTraining_Login
//
//  Created by FDC.JEAZELLE-NC-WEB on 7/18/24.
//

import UIKit

struct Settings {
    let title: String
    let status: Bool
    
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsView: UITableView!
    
    var settings: [Settings] = [
        Settings(title: "Dark Mode", status: false),
        Settings(title: "Notifications", status: false),
        Settings(title: "Location Services", status: true),
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        let nib = UINib(nibName: "SettingsTableViewCell", bundle: nil)
        self.settingsView.register(nib, forCellReuseIdentifier: "SettingsCell")
        
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

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as? SettingsTableViewCell {
//            cell.accessoryType = .disclosureIndicator
            cell.titleLbl.text = settings[indexPath.row].title
            cell.switchOutlet.isOn = settings[indexPath.row].status
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            // Return the desired height for each row
            return 60.0
        }
    
    
}
