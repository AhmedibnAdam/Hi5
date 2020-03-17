//
//  dateCell.swift
//  Hi5
//
//  Created by AHMED on 2/27/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class dateCell: UICollectionViewCell {
    var weekDay:String? {
        didSet{
            weekDayLabel.text = weekDay
        }
    }
    var Day:String? {
        didSet{
            dayLabel.text = Day
        }
    }
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var weekDayLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.isHidden = true
        containerView.layer.cornerRadius = 5
    }
    

}
