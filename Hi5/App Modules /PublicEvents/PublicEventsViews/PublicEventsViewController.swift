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
    let cellAID = "cellAID"
    let cellBID = "cellBID"
    let headerID = "headerID"
    let maxHeaderHeight: CGFloat = 300
    let minHeaderHeight: CGFloat = 82
    var previousScrollOffset: CGFloat = 0
    var previousScrollViewHeight: CGFloat = 0
    let weekDays = ["Sat","Sun","Mon","Tue","Wed","Thu","Fri","Sat","Sun","Mon","Tue","Wed","Thu","Fri"]
    let Days = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14"]
    var dayIsSelected = Array(repeating: false, count: 14)
    //MARK:-OUTLETS
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var subCollectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!
    //MARK:-viewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionCell()
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        subCollectionView.delegate = self
        subCollectionView.dataSource = self
        mainCollectionView.showsVerticalScrollIndicator = false
        subCollectionView.showsHorizontalScrollIndicator = false
        navigationItem.rightBarButtonItem?.image = UIImage(named: "notification", in: nil, with: nil)
        imageView.layer.cornerRadius = 5
    }
}
//MARK:-Extensions
extension PublicEventsViewController: IPublicEventsViewController {
    // do someting...
}
extension PublicEventsViewController {
    // do someting...
    func registerCollectionCell() {
        let cellA = UINib(nibName: "publicEventsCell", bundle: nil)
        let cellB = UINib(nibName: "dateCell", bundle: nil)
        mainCollectionView.register(cellA, forCellWithReuseIdentifier: cellAID)
        subCollectionView.register(cellB, forCellWithReuseIdentifier: cellBID)
    }
    func canAnimateHeader(_ scrollView:UIScrollView) -> Bool {
        let scrollViewMaxHeight = scrollView.frame.height + self.headerViewHeight.constant - minHeaderHeight
        return scrollView.contentSize.height > scrollViewMaxHeight
    }
    func setScrollPosition() {
        self.mainCollectionView.contentOffset = CGPoint(x:1, y: 1)
        // there is something went unexplainable here, when do we I change the x and y to 0 the scroll became a little intermittent
    }
    func handleDaySelection(cell: dateCell, indexPath:IndexPath) {
        if dayIsSelected[indexPath.row] {
            dayIsSelected[indexPath.row] = false
            cell.containerView.isHidden = dayIsSelected[indexPath.row]
            cell.dayLabel.font = UIFont.boldSystemFont(ofSize: 18)
            cell.weekDayLabel.font = UIFont.boldSystemFont(ofSize: 12)
            cell.weekDayLabel.textColor = .orange
            cell.dayLabel.textColor = .orange
        }else {
            dayIsSelected[indexPath.row] = true
            cell.containerView.isHidden = dayIsSelected[indexPath.row]
            cell.dayLabel.font = UIFont.systemFont(ofSize: 10)
            cell.weekDayLabel.font = UIFont.systemFont(ofSize: 10)
            cell.weekDayLabel.textColor = .black
            cell.dayLabel.textColor = .black
        }
    }
    
}
extension PublicEventsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainCollectionView {
            return 4
        }else {
            return Days.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainCollectionView {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: cellAID, for: indexPath) as! publicEventsCell
            return cellA
        }else {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: cellBID, for: indexPath) as! dateCell
            cellB.backgroundColor = .red
            cellB.weekDay = weekDays[indexPath.row]
            cellB.Day = Days[indexPath.row]
            return cellB
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainCollectionView {
            return CGSize(width: view.frame.width, height: 400)
        }else {
            return CGSize(width:50,height: 100)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == subCollectionView {
            let cellB = subCollectionView.cellForItem(at: indexPath) as! dateCell
            handleDaySelection(cell: cellB,indexPath: indexPath)
        }
    }
}
extension PublicEventsViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollDiff = (scrollView.contentOffset.y - previousScrollOffset)
        let isScrollingDown = scrollDiff > 0
        let isScrollingUp = scrollDiff < 0
        if canAnimateHeader(scrollView) {
            var newHeight = headerViewHeight.constant
            if isScrollingDown {
                newHeight = max(minHeaderHeight, headerViewHeight.constant - abs(scrollDiff))
            } else if isScrollingUp {
                newHeight = min(maxHeaderHeight, headerViewHeight.constant + abs(scrollDiff))
            }
            if newHeight != headerViewHeight.constant {
                headerViewHeight.constant = newHeight
                setScrollPosition()
                previousScrollOffset = scrollView.contentOffset.y
            }
        }
    }
}
