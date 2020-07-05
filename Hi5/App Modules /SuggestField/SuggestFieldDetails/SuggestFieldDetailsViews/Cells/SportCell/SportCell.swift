//
//  SportCell.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/25/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class SportCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var sportImg: UIImageView!
    @IBOutlet weak var sportTitle: UILabel!
    
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                sportTitle.textColor = .orange
            } else {
                sportTitle.textColor = .black
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
