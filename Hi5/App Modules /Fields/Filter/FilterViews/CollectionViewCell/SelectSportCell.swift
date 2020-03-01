//
//  SelectSportCell.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/25/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class SelectSportCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var sportNameLbl: UILabel!
    @IBOutlet weak var sportImg: UIImageView!
    
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                sportNameLbl.textColor = .orange
            } else {
                sportNameLbl.textColor = .darkGray
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
