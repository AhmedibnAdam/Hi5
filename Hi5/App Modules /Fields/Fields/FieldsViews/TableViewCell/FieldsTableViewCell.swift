//
//  FieldsTableViewCell.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/12/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class FieldsTableViewCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var visibilitylbl: UILabel!
    @IBOutlet weak var fieldImg: UIImageView!
    @IBOutlet weak var companyImg: UIImageView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var showDetailsBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var recomendedLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var sportTypeLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var paymentLbl: UILabel!
    
    //MARK: - View Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - Actions
    @IBAction func showDetailsBtnTapped(_ sender: UIButton) {
        print("showDetailsTapped....")
    }
    
    func initView() {
        self.companyImg = CreateCornerRauis.imageViewRaduis(view: self.companyImg, number: (self.companyImg.frame.size.height / 2))
        self.nameView = CreateCornerRauis.viewRaduis(view: self.nameView, number: 15)
        self.containerView = CreateCornerRauis.viewRaduis(view: self.containerView, number: 5)
        self.showDetailsBtn = CreateCornerRauis.ButtonRaduis(button: self.showDetailsBtn, number: 5)
    }
    
}
