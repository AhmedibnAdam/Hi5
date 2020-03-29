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
    @IBOutlet weak var fieldName: UILabel!
    @IBOutlet weak var partnerName: UILabel!

    @IBOutlet weak var partnerImg: UIImageView!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var paymentLbl: UILabel!
    @IBOutlet weak var bestForLbl: UILabel!
    @IBOutlet weak var fieldLocationLbl: UILabel!
    @IBOutlet weak var fieldNameLbl: UILabel!
    @IBOutlet weak var ballImageView: UIImageView!
    @IBOutlet weak var gender: UIImageView!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var starttime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var pastCost: UILabel!
    @IBOutlet weak var before: UILabel!
    @IBOutlet weak var beforeCenterView: UIView!
    @IBOutlet weak var currancy: UILabel!
    @IBOutlet weak var bookingStatus: UILabel!
    @IBOutlet weak var bookingStatusImage: UIImageView!
    @IBOutlet weak var point: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func initView() {
     //   self.nameView = CreateCornerRauis.viewRaduis(view: self.nameView, number: 15)
    }
    
}
