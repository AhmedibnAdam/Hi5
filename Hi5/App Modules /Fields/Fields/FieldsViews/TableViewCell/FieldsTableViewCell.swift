//
//  FieldsTableViewCell.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/12/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class FieldsTableViewCell: UITableViewCell {

    @IBOutlet weak var showDetailsBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
        //self.separatorStyle = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func initView() {
        self.containerView = CreateCornerRauis.viewRaduis(view: self.containerView, number: 5)
        self.showDetailsBtn = CreateCornerRauis.ButtonRaduis(button: self.showDetailsBtn, number: 5)
    }
    
}
