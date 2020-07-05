//
//  FieldTypeCell.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/27/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

protocol fieldTypeCellDelegate: class{
    func didTap(_ button: UIButton , cell: UICollectionViewCell , selected: Bool)
}

class FieldTypeCell: UICollectionViewCell {

    @IBOutlet weak var floorTypeBtn: UIButton!
    var select: Bool = false
    var delegate: fieldTypeCellDelegate?
    override var isSelected: Bool {
        didSet {
            if isSelected {
                floorTypeBtn.setTitleColor(.orange, for: .normal)
                floorTypeBtn.borderColor = .orange
            } else {
                floorTypeBtn.setTitleColor(.darkGray, for: .normal)
                floorTypeBtn.borderColor = .lightGray
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func floorTypeBtnTapped(_ sender: UIButton) {
        if (sender.titleLabel?.textColor == UIColor.darkGray) {
            sender.setTitleColor(.orange, for: .normal)
            sender.borderColor = .orange
            select = true
        } else {
            sender.setTitleColor(.darkGray, for: .normal)
            sender.borderColor = .lightGray
            select = false
        }
        delegate?.didTap(sender, cell: self, selected: select)
    }
    
}
