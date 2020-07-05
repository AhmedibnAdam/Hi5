//
//  PhotoFieldCell.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/25/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

protocol PhotoCellDelegate: class{
    func didTap(_ button: UIButton , cell: UICollectionViewCell)
}

class PhotoFieldCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var fieldImg: UIImageView!
    
    //MARK: - Properties
    weak var delegate: PhotoCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    //MARK: - Actions
    @IBAction func removePhotoBtnTapped(_ sender: UIButton) {
        delegate?.didTap(sender, cell: self)
    }
}
