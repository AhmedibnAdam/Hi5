//
//  ServicesCell.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/23/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class ServicesCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var containerImgView: UIView!
    @IBOutlet weak var serviceimg: UIImageView!
    @IBOutlet weak var serviceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
        // Initialization code
    }
    
    func initView() {
    
    }

}
