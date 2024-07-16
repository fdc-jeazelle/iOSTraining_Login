//
//  AdsBannerCell.swift
//  iOSTraining_Login
//
//  Created by FDC.JEAZELLE-NC-WEB on 7/16/24.
//

import UIKit

class AdsBannerCell: UITableViewCell {

    @IBOutlet weak var adDesc: UILabel!
    @IBOutlet weak var adTitle: UILabel!
    @IBOutlet weak var adImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
