//
//  FieldCell.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/27/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class FieldCell: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var fieldImg: UIImageView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var partnerImg: UIImageView!
    @IBOutlet weak var partnerNamelbl: UILabel!
    @IBOutlet weak var visibilityLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var paymentLbl: UILabel!
    @IBOutlet weak var bestForLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var sportTypeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var fieldLocationLbl: UILabel!
    @IBOutlet weak var fieldNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func initView() {
        self.nameView = CreateCornerRauis.viewRaduis(view: self.nameView, number: 15)
    }
    
}
