//
//  PublicEventsViewController.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPublicEventsViewController: class {
	var router: IPublicEventsRouter? { get set }
}

class PublicEventsViewController: UIViewController {
    //MARK:- Variables
	var interactor: IPublicEventsInteractor?
	var router: IPublicEventsRouter?
    let cellID = "cellID"
    let headerID = "headerID"
    var headerHeight: CGFloat = 300
    let headerViewMaxHeight: CGFloat = 300
    let headerViewMinHeight: CGFloat = 101
    //MARK:-OUTLETS
    
    @IBOutlet weak var collectionViewTopConstraint: NSLayoutConstraint!
    //MARK:-viewLifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionCell()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        navigationItem.rightBarButtonItem?.image = UIImage(named: "notification", in: nil, with: nil)
    }
    //MARK:-Outlets
@IBOutlet weak var collectionView: UICollectionView!
}
//MARK:-Extensions
extension PublicEventsViewController: IPublicEventsViewController {
	// do someting...
}

extension PublicEventsViewController {
	// do someting...
    func registerCollectionCell() {
            let cell = UINib(nibName: "publicEventsCell", bundle: nil)
        let header = UINib(nibName: "publicEventsHeader", bundle: nil)
        collectionView.register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
            collectionView.register(cell, forCellWithReuseIdentifier: cellID)
    }
}

extension PublicEventsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! publicEventsCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
           let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! publicEventsHeader
        header.headerImage.image = UIImage(named: "stadium", in: nil, with: nil)
//        header.backgroundColor = .red
           return header
       }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
           return CGSize(width: view.frame.width , height: headerHeight)
       }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 400)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

         let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        if scrollView.contentOffset.y > 199 {
                self.headerHeight = 101
            layout?.sectionHeadersPinToVisibleBounds = true
            collectionView.reloadData()
        } else if scrollView.contentOffset.y < 199 {
                self.headerHeight = 300
            layout?.sectionHeadersPinToVisibleBounds = false
            collectionView.reloadData()

        }
    }
}
