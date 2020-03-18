//
//  SocialHeader.swift
//  Hi5
//
//  Created by AHMED on 2/23/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class SocialHeader: UICollectionViewCell {
    let cellID = "cellID"
    var types = ["User chats","Booking chats","Group chats"]
    @IBOutlet weak var userCaption: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var typeTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .white
        userProfileImage.backgroundColor = .red
        userProfileImage.layer.cornerRadius = userProfileImage.frame.width / 2
        registerCollectionCell()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        print("Registered")
        
    }
}
extension SocialHeader:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func registerCollectionCell() {
        let cell = UINib(nibName: "SocialHeaderCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier:cellID)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let type = types[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SocialHeaderCell
        cell.typeLabel.text = type
        if indexPath.row == 0 {
            cell.lineView.isHidden = false
        }else {
            cell.lineView.isHidden = true
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let firstCellIndexPath = IndexPath(item: 0, section: 0)
        let firstCell = collectionView.cellForItem(at: firstCellIndexPath) as! SocialHeaderCell
        firstCell.lineView.isHidden = true
        let cell = collectionView.cellForItem(at: indexPath) as! SocialHeaderCell
                   cell.typeLabel.textColor = .orange
        cell.lineView.isHidden = false
        typeTitleLabel.text = types[indexPath.row]
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
           let cell = collectionView.cellForItem(at: indexPath) as! SocialHeaderCell
           cell.typeLabel.textColor = .lightGray
        cell.lineView.isHidden = true
       }
}

