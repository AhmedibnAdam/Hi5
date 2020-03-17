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
    @IBOutlet weak var sliderLableP: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCellView()
    }
    
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
//        noOfPlayersLabel.text = "\(Int(noOfPlayerSlider.value))"
//        noOfPlayerSlider.setThumbImage(UIImage(named: "\(Int(noOfPlayerSlider.value))"), for: .normal)

        let trackRect = sender.trackRect(forBounds: sender.frame)
        let thumbRect = sender.thumbRect(forBounds: sender.bounds, trackRect: trackRect, value: sender.value)
        self.sliderLableP.text =  "\(Int(noOfPlayerSlider.value))"
        self.sliderLableP.center = CGPoint(x: thumbRect.midX, y: self.sliderLableP.center.y)
    }
    func setupCellView() {
        noOfPlayerSlider.thumbTintColor = UIColor.orange
        
        self.sliderLableP.text = "1"
        let trackRect = noOfPlayerSlider.trackRect(forBounds: noOfPlayerSlider.frame)
        let thumbRect = noOfPlayerSlider.thumbRect(forBounds: noOfPlayerSlider.bounds, trackRect: trackRect, value: noOfPlayerSlider.value)
        self.sliderLableP.text =  "\(Int(noOfPlayerSlider.value))"
        self.sliderLableP.center = CGPoint(x: thumbRect.midX, y: self.sliderLableP.center.y)
        wholeCellView.layer.cornerRadius = 10
        ballImageView.layer.cornerRadius = 5
        wholeCellView.layer.shadowColor = UIColor.black.cgColor
        wholeCellView.layer.shadowOpacity = 0.5
        wholeCellView.layer.shadowOffset = CGSize(width: 2.0 , height: 2.0)
    }
}
