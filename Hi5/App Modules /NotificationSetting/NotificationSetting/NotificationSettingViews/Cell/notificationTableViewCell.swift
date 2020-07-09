//
//  notificationTableViewCell.swift
//  Hi5
//
//  Created by Adam on 12/31/19.
//  Copyright © 2019 FudexApp. All rights reserved.
//

import UIKit

class notificationTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var msg: UILabel!
    @IBOutlet weak var time: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = (img.frame.size.height) / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
