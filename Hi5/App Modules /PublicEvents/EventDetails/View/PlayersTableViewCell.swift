//
//  PlayersTableViewCell.swift
//  Hi5
//
//  Created by Adam on 4/15/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class PlayersTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
