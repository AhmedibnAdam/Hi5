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
    //MARK:-Outlets
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK:-viewLifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        headerImage.layer.cornerRadius = 10
        registerCollectionCell()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
//MARK:-Extensions
extension publicEventsHeader {
    func registerCollectionCell() {
               let cell = UINib(nibName: "CalendarCell", bundle: nil)
        let header = UINib(nibName:"CalendarHeader",bundle:nil)
        collectionView.register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
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
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 10)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! CalendarHeader
        header.calenderDateHeader.text = "June 2019"
        header.backgroundColor = .orange
        return header
    }
}
