//
//  SocialHeaderCell.swift
//  Hi5
//
//  Created by AHMED on 2/24/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class SocialHeaderCell: UICollectionViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lineView.isHidden = true
    }

}
