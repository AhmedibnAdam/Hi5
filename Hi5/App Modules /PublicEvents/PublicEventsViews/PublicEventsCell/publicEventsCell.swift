//
//  publicEventsCell.swift
//  Hi5
//
//  Created by AHMED on 2/24/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit
import Kingfisher

class publicEventsCell: UICollectionViewCell {
    
    @IBOutlet weak var wholeCellView: UIView!
    @IBOutlet weak var ballImageView: UIImageView!
    @IBOutlet weak var noOfPlayersLabel: UILabel!
    @IBOutlet weak var noOfPlayerSlider: UISlider!
    @IBOutlet weak var sliderLableP: UILabel!
    @IBOutlet weak var fieldName: UILabel!
    @IBOutlet weak var partnerName: UILabel!
    @IBOutlet weak var gender: UIImageView!
    @IBOutlet weak var partnerImage: UIImageView!
    @IBOutlet weak var playerNumbers: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var starttime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var bestFor: UILabel!
    @IBOutlet weak var currancy: UILabel!
    
    
    var filteredPublicEventData: PublicEventsModel.PublicEvent?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCellView()
        showData()
    }
    
    func showData(){
        //        "id": "47",
        fieldName.text = filteredPublicEventData?.partnerName
        if let image = filteredPublicEventData?.fieldImage {
            let url = URL(string: image)
            ballImageView.kf.setImage(with: url)
            
        }
        
        if let image = filteredPublicEventData?.partnerImage {
            let url = URL(string: image)
            partnerImage.kf.setImage(with: url)
            
        }
        partnerName.text = filteredPublicEventData?.fieldName
        playerNumbers.text = "\(filteredPublicEventData?.playersNumber ?? 1) Players"
        bestFor.text = "\(String(describing: filteredPublicEventData?.joinedNumber ?? 1)) x \(String(describing: filteredPublicEventData?.joinedNumber ?? 1))"
        noOfPlayerSlider.value = Float((filteredPublicEventData?.joinedNumber ?? 1))
        self.sliderLableP.text = "\(String(describing: filteredPublicEventData?.joinedNumber ?? 1))"
        
        let trackRect = noOfPlayerSlider.trackRect(forBounds: noOfPlayerSlider.frame)
        let thumbRect = noOfPlayerSlider.thumbRect(forBounds: noOfPlayerSlider.bounds, trackRect: trackRect, value: noOfPlayerSlider.value)
        
        self.sliderLableP.center = CGPoint(x: thumbRect.midX, y: self.sliderLableP.center.y)
        cost.text = filteredPublicEventData?.cost
        if filteredPublicEventData?.cost == "free" || filteredPublicEventData?.cost == "Free"{
            currancy.isHidden = true
        }
        else{
            currancy.isHidden = false
        }
        let splitArray = filteredPublicEventData?.date?.split(separator: " ").map(String.init)
        day.text = splitArray?[0]
        date.text = filteredPublicEventData?.dateFormat
        let splitTimeArray = filteredPublicEventData?.time?.split(separator: "-").map(String.init)
        starttime.text = splitTimeArray?[0]
        endTime.text = splitTimeArray?[1]
        age.text = filteredPublicEventData?.age
        //               "time": "06:00 - 07:00",
        //               "sport_type": "Archery",
        //               "status": "coming",
        
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
        
        self.sliderLableP.text = "\(String(describing: filteredPublicEventData?.joinedNumber ?? 1))"
        
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
