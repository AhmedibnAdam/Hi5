//
//  publicEventsHeader.swift
//  Hi5
//
//  Created by AHMED on 2/24/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import UIKit

class publicEventsHeader: UICollectionViewCell {
    //MARK:-Variables
    let cellID = "cellID"
    let headerID = "headerID"
    let weekDays = ["Sat","Sun","Mon","Tue","Wed","Thu","Fri","Sat","Sun","Mon","Tue","Wed","Thu","Fri"]
    let Days = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14"]
     var dayIsSelected = Array(repeating: false, count: 14)
    //MARK:-Outlets
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var containerView: UIView!
    
    //MARK:-viewLifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        headerImage.layer.cornerRadius = 10
        registerCollectionCell()
        collectionView.showsHorizontalScrollIndicator = false

        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
        containerView.backgroundColor = .orange
    }
}
//MARK:-Extensions
extension publicEventsHeader {
    func registerCollectionCell() {
               let cell = UINib(nibName: "CalendarCell", bundle: nil)
//        let header = UINib(nibName:"CalendarHeader",bundle:nil)
//        collectionView.register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
               collectionView.register(cell, forCellWithReuseIdentifier: cellID)
       }
}
extension publicEventsHeader:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        14
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CalendarCell
        cell.stackviewView.backgroundColor = .orange
        cell.weekDay = weekDays[indexPath.row]
        cell.Day = Days[indexPath.row]
        cell.backgroundColor = .orange
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 100)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: 40)
//    }
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! CalendarHeader
//        header.calenderDateHeader.text = "June 2019"
//        header.backgroundColor = .orange
//        return header
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CalendarCell
        if dayIsSelected[indexPath.row] {
            dayIsSelected[indexPath.row] = false
            cell.containerView.isHidden = dayIsSelected[indexPath.row]
            cell.weekDayLabel.textColor = .orange
            cell.dayLabel.textColor = .orange
        }else {
            dayIsSelected[indexPath.row] = true
            cell.containerView.isHidden = dayIsSelected[indexPath.row]
            cell.weekDayLabel.textColor = .black
            cell.dayLabel.textColor = .black
        }
    }
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath) as! CalendarCell
//        if dayIsSelected[indexPath.row] {
//            dayIsSelected[indexPath.row] = false
//            cell.containerView.isHidden = dayIsSelected[indexPath.row]
//        }else {
//            dayIsSelected[indexPath.row] = true
//            cell.containerView.isHidden = dayIsSelected[indexPath.row]
//        }
//    }
}
