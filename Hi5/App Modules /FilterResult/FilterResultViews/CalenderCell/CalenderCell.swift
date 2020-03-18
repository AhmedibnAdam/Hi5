//
//  CalenderCell.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/26/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class CalenderCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                containerView.backgroundColor = .white
                nameLbl.textColor = .orange
                dateLbl.textColor = .orange
            } else {
                containerView.backgroundColor = .clear
                nameLbl.textColor = .white
                dateLbl.textColor = .white
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      //  self.containerView = CreateCornerRauis.viewRaduis(view: self.containerView, number: 3)
    }

}
