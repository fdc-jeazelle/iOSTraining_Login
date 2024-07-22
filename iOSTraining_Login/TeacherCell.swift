//
//  TeacherCell.swift
//  iOSTraining_Login
//
//  Created by FDC.JEAZELLE-NC-WEB on 7/16/24.
//

import UIKit

class TeacherCell: UITableViewCell {

    @IBOutlet weak var tableImage: UIImageView!
    
    @IBOutlet weak var teacherName: UILabel!
    
    @IBOutlet weak var countryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
