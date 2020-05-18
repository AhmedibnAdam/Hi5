//
//  CommentTableViewCell.swift
//  Hi5
//
//  Created by Adam on 5/17/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit
import Cosmos

class CommentTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var profileImage: UIButton!
    @IBOutlet weak var name: UIButton!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var date: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
