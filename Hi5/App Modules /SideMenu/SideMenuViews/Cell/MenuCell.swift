//
//  MenuCell.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/17/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    
    //MARK: - Outlets
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var plusBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
