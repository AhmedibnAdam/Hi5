//
//  FieldsTableViewCell.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/12/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

protocol FavouriteTableViewCellDelegate: class{
    func addFavouriteDidTap(_ button: UIButton , cell: UITableViewCell , id: Int)
    func removeFavouriteDidTap(_ button: UIButton , cell: UITableViewCell , id: Int)
}

protocol ShowDetailsTableViewCellDelegate: class {
    func showDetailsDidTap(_ button: UIButton , cell: UITableViewCell , field: FieldsModel.Field)
}
class FieldsTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var favouriteBtn: UIButton!
    @IBOutlet weak var companyName: UILabel!
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
    
    //MARK: - Properties
    weak var delegate: FavouriteTableViewCellDelegate?
    weak var showDetailsDelegate: ShowDetailsTableViewCellDelegate?
    var fieldId: Int?
    var field: FieldsModel.Field?
    
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
        if let field = field {
             showDetailsDelegate?.showDetailsDidTap(sender, cell: self, field: field)
        }
    }
    
    @IBAction func favouriteBtnTapped(_ sender: UIButton) {
        if (favouriteBtn.currentImage == UIImage(named: "nonstar")){
            favouriteBtn.setImage(UIImage(named: "star"), for: .normal)
            if let id = fieldId {
                delegate?.addFavouriteDidTap(sender, cell: self , id: id)
            }
        } else {
            favouriteBtn.setImage(UIImage(named: "nonstar"), for: .normal)
            if let id = fieldId {
               delegate?.removeFavouriteDidTap(sender, cell: self , id: id)
            }
        }
    }
    func initView() {
        self.companyImg = CreateCornerRauis.imageViewRaduis(view: self.companyImg, number: (self.companyImg.frame.size.height / 2))
        self.nameView = CreateCornerRauis.viewRaduis(view: self.nameView, number: 15)
        self.containerView = CreateCornerRauis.viewRaduis(view: self.containerView, number: 5)
        self.showDetailsBtn = CreateCornerRauis.ButtonRaduis(button: self.showDetailsBtn, number: 5)
    }
}
