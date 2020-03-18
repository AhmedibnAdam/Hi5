//
//  SocialCell.swift
//  Hi5
//
//  Created by AHMED on 2/23/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class SocialCell: UICollectionViewCell {

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var testLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        userProfileImage.backgroundColor = .red
        userProfileImage.layer.cornerRadius = userProfileImage.frame.width / 2
    }

}
