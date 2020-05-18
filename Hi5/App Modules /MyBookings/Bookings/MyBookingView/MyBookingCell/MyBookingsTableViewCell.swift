//
//  MyBookingsTableViewCell.swift
//  Hi5
//
//  Created by Adam on 3/18/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class MyBookingsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var wholeCellView: UIView!
    @IBOutlet weak var ballImageView: UIImageView!

    @IBOutlet weak var fieldImage: UIImageView!
    @IBOutlet weak var fieldName: UILabel!
    @IBOutlet weak var partnerName: UILabel!
    @IBOutlet weak var gender: UIImageView!
    @IBOutlet weak var partnerImage: UIImageView!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var starttime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    
    @IBOutlet weak var pastCost: UILabel!
    @IBOutlet weak var before: UILabel!
    @IBOutlet weak var beforeCenterView: UIView!
    @IBOutlet weak var currancy: UILabel!

    
    @IBOutlet weak var bestFor: UILabel!
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var paymentType: UILabel!
    @IBOutlet weak var bookingStatus: UILabel!
    @IBOutlet weak var bookingStatusImage: UIImageView!
    
    @IBOutlet weak var point: UILabel!
    
    var bookingData: MyBookingsModel.MyBookingSessionsField?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCellView()
        showData()
    }
    
    func showData(){
        
    }

    func setupCellView() {
  
 
    }
}
