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
    func showDetailsDidTap(_ button: UIButton , cell: UITableViewCell , field: FieldsModel.NearByfieldsResponseField)
}
class FieldsTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var favouriteBtn: UIButton!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var partner: UILabel!
    
    @IBOutlet weak var map: UIButton!
 
    @IBOutlet weak var showDetailsBtn: UIButton!
    @IBOutlet weak var visabilityButton: UIButton!
    @IBOutlet weak var fieldImg: UIImageView!
    @IBOutlet weak var companyImg: UIImageView!
  
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var star: UIButton!
    @IBOutlet weak var comment: UIButton!
    
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var recomendedLbl: UILabel!
    @IBOutlet weak var typeIcon: UIImageView!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var paymentLbl: UILabel!
    @IBOutlet weak var genderIcon: UIImageView!
    @IBOutlet weak var distance: UILabel!
    
    //MARK: - Properties
    weak var delegate: FavouriteTableViewCellDelegate?
    weak var showDetailsDelegate: ShowDetailsTableViewCellDelegate?
    var fieldId: Int?
    var field: FieldsModel.NearByfieldsResponseField?
    
    //MARK: - View Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
        if (favouriteBtn.currentImage == UIImage(named: "fav")){
            favouriteBtn.setImage(UIImage(named: "favFill"), for: .normal)
            if let id = fieldId {
                delegate?.addFavouriteDidTap(sender, cell: self , id: id)
            }
        } else {
            favouriteBtn.setImage(UIImage(named: "fav"), for: .normal)
            if let id = fieldId {
               delegate?.removeFavouriteDidTap(sender, cell: self , id: id)
            }
        }
    }
}
