//
//  WalletTransActionsTableViewCell.swift
//  Hi5
//
//  Created by Adam on 4/17/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class WalletTransActionsTableViewCell: UITableViewCell {

    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var date: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
