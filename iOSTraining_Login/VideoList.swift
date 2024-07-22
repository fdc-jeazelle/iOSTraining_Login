//
//  VideoList.swift
//  iOSTraining_Login
//
//  Created by FDC.JEAZELLE-NC-WEB on 7/21/24.
//

import UIKit

class VideoList: UITableViewCell {

    @IBOutlet weak var imageDisplay: UIImageView!
    
    @IBAction func editData(_ sender: Any) {
    }
    
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
