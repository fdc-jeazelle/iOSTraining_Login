//
//  SettingsTableViewCell.swift
//  iOSTraining_Login
//
//  Created by FDC.JEAZELLE-NC-WEB on 7/18/24.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var switchOutlet: UISwitch!
   
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
