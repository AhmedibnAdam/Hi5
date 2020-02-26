//
//  publicEventsCell.swift
//  Hi5
//
//  Created by AHMED on 2/24/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class publicEventsCell: UICollectionViewCell {
    
    @IBOutlet weak var wholeCellView: UIView!
    @IBOutlet weak var ballImageView: UIImageView!
    @IBOutlet weak var noOfPlayersLabel: UILabel!
    @IBOutlet weak var noOfPlayerSlider: UISlider!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCellView()
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        noOfPlayersLabel.text = "\(Int(noOfPlayerSlider.value))"
    }
    func setupCellView() {
        wholeCellView.layer.cornerRadius = 10
        ballImageView.layer.cornerRadius = 5
        wholeCellView.layer.shadowColor = UIColor.black.cgColor
        wholeCellView.layer.shadowOpacity = 0.5
        wholeCellView.layer.shadowOffset = CGSize(width: 2.0 , height: 2.0)
    }
}
