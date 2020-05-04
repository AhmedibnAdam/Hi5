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
    @IBOutlet weak var points: UILabel!
    
    
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
        bestFor.text = filteredPublicEventData?.bestFor
        noOfPlayerSlider.value = Float(((filteredPublicEventData?.joinedCount!) ?? 1) )
        self.sliderLableP.text = "\((filteredPublicEventData?.joinedCount!) ?? 1)"
        
        let trackRect = noOfPlayerSlider.trackRect(forBounds: noOfPlayerSlider.frame)
        let thumbRect = noOfPlayerSlider.thumbRect(forBounds: noOfPlayerSlider.bounds, trackRect: trackRect, value: noOfPlayerSlider.value )
        
        self.sliderLableP.center = CGPoint(x: thumbRect.midX, y: self.sliderLableP.center.y)
        cost.text = "\(String(describing: filteredPublicEventData?.cost ?? 0))"
        if filteredPublicEventData?.cost == 0 {
            currancy.isHidden = true
        }
        else{
            currancy.isHidden = false
        }
       
        day.text = filteredPublicEventData?.day
        date.text = filteredPublicEventData?.date
        starttime.text = filteredPublicEventData?.startTime
        endTime.text = filteredPublicEventData?.endTime
        age.text = (filteredPublicEventData?.groupName ?? "") + " \(filteredPublicEventData?.age! ?? 0)"
        points.text = "\(filteredPublicEventData?.points! ?? 0)"
        
    }
    

    func setupCellView() {
        noOfPlayerSlider.thumbTintColor = UIColor.orange
        
        self.sliderLableP.text = "\(String(describing: filteredPublicEventData?.joinedCount))"

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
