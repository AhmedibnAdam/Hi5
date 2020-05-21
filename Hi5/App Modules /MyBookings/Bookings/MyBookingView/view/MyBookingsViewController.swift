//
//  MyBookingsViewController.swift
//  Hi5
//
//  Created by Adam on 3/18/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyBookingsViewController: class {
    var router: IMyBookingsRouter? { get set }
    func showAlert(title: String, msg: String)
    func showUpCommingBooking(response: MyBookingsModel.MyBookingSessions)
    func showPastBooking(response: MyBookingsModel.PastBookingResponse)
    func showCancledBooking(response: MyBookingsModel.CanceledBookingResponse)
}

class MyBookingsViewController: UIViewController {
    
    
    var interactor: IMyBookingsInteractor?
    var router: IMyBookingsRouter?
    var types = ["Comming","Past","Canceled"]
    var upCommingBooking: MyBookingsModel.MyBookingSessions?
    var pastBooking: MyBookingsModel.PastBookingResponse?
    var canceledBooking: MyBookingsModel.CanceledBookingResponse?
    var fieldsTabType = 0  // Comming = 0 / Past = 1 / Canceled = 2
    var firstTimeIn = 0
    var bookingCellCount = 0
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtntapped))
    }()
    
    @objc func backBtntapped() {
        router?.navigateToTabBar()
    }
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noBookingImage: UIImageView!
    @IBOutlet weak var noBookingLabel: UILabel!
    
    
    //MARK: - viewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        registerCollectionCell()
        registerTableCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        interactor?.getUpCommingBookings(view: self)
    }
    
}

extension MyBookingsViewController: IMyBookingsViewController {
    
    func showAlert(title: String, msg: String) {
        print(title + "-" + msg)
    }
    
    func showUpCommingBooking(response: MyBookingsModel.MyBookingSessions) {
        let upCommingBooking = response
        self.upCommingBooking = upCommingBooking
        fieldsTabType = 0
        bookingCellCount = upCommingBooking.fields?.count ?? 0
        self.tableView.reloadData()
        print(response)
    }
    
    func showPastBooking(response: MyBookingsModel.PastBookingResponse) {
        let pastBooking = response
        self.pastBooking = pastBooking
        fieldsTabType = 1
        bookingCellCount = pastBooking.fields?.count ?? 0
        self.tableView.reloadData()
        print(response)
    }
    func showCancledBooking(response: MyBookingsModel.CanceledBookingResponse) {
        let canceledBooking = response
        self.canceledBooking = canceledBooking
        fieldsTabType = 2
        bookingCellCount = canceledBooking.fields?.count ?? 0
        self.tableView.reloadData()
        print(response)
    }
    
}

extension MyBookingsViewController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func registerCollectionCell() {
        let cell = UINib(nibName: "TypeCollectionViewCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "typeCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return types.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = types[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "typeCell", for: indexPath) as! TypeCollectionViewCell
        if firstTimeIn ==  0 {
            if indexPath.row == 0{
                cell.typeLbl.textColor = .orange
                cell.hightLightVieww.isHidden = false
                firstTimeIn += 1
            }
        }
        cell.typeLbl.text = type
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TypeCollectionViewCell
        cell.typeLbl.textColor = .lightGray
        cell.hightLightVieww.isHidden = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let firstCellIndexPath = IndexPath(item: 0, section: 0)
        let firstCell = collectionView.cellForItem(at: firstCellIndexPath) as!TypeCollectionViewCell
        firstCell.typeLbl.textColor = .lightGray
        firstCell.hightLightVieww.isHidden = true
        let cell = collectionView.cellForItem(at: indexPath) as! TypeCollectionViewCell
        cell.typeLbl.textColor = .orange
        cell.hightLightVieww.isHidden = false
        if (indexPath.row == 0) {
             self.interactor?.getUpCommingBookings(view: self)
        } else if (indexPath.row == 1){
            self.interactor?.getPastBookings(view: self)
        } else if (indexPath.row == 2){
            self.interactor?.getCancelBookings(view: self)
        }
    }
}

extension MyBookingsViewController: UITableViewDelegate , UITableViewDataSource {
    func registerTableCell() {
        let cell = UINib(nibName: "MyBookingsTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "MyBookingsTableViewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.bookingCellCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyBookingsTableViewCell") as! MyBookingsTableViewCell
        
        if self.fieldsTabType == 0 {
            let bookingData = self.upCommingBooking?.fields?[indexPath.row]
            cell.fieldName.text = bookingData?.partnerName
            if let image = bookingData?.image {
                let url = URL(string: image)
                cell.ballImageView.kf.setImage(with: url)
                cell.fieldImage.kf.setImage(with: url)
            }
            
            if let image = bookingData?.partnerImage {
                let url = URL(string: image)
                cell.partnerImage.kf.setImage(with: url)
                
            }
            cell.partnerName.text = bookingData?.name
            
            cell.location.text = bookingData?.address
            cell.pastCost.text = "\( bookingData?.oldPrice! ?? 0)"
            cell.cost.text = "\(bookingData?.newPrice! ?? 0)"
            cell.point.text = "\( bookingData?.points! ?? 0)"
            
            cell.bestFor.text = bookingData?.bestFor
            cell.day.text = bookingData?.day
            cell.date.text = bookingData?.date
            cell.starttime.text = bookingData?.startTime
            cell.endTime.text = bookingData?.endTime
            
            if bookingData?.newPrice == bookingData?.oldPrice {
                cell.pastCost.isHidden = true
                cell.before.isHidden = true
                cell.beforeCenterView.isHidden = true
                cell.currancy.isHidden = true
            }
            else{
                cell.pastCost.isHidden = false
                cell.before.isHidden = false
                cell.beforeCenterView.isHidden = false
                cell.currancy.isHidden = false
            }
            
            return cell
        }
        else if self.fieldsTabType == 1 {
            let bookingData = self.pastBooking?.fields?[indexPath.row]
            cell.fieldName.text = bookingData?.partnerName
            if let image = bookingData?.image {
                let url = URL(string: image)
                cell.ballImageView.kf.setImage(with: url)
                cell.fieldImage.kf.setImage(with: url)
            }
            
            if let image = bookingData?.partnerImage {
                let url = URL(string: image)
                cell.partnerImage.kf.setImage(with: url)
                
            }
            cell.partnerName.text = bookingData?.name
            cell.location.text = bookingData?.address
            cell.pastCost.text = "\( bookingData?.oldPrice! ?? 0)"
            cell.cost.text = "\(bookingData?.newPrice! ?? 0)"
            cell.point.text = "\( bookingData?.points! ?? 0)"
            cell.bestFor.text = bookingData?.bestFor
            cell.day.text = bookingData?.day
            cell.date.text = bookingData?.date
            cell.starttime.text = bookingData?.startTime
            cell.endTime.text = bookingData?.endTime
            
            if bookingData?.newPrice == bookingData?.oldPrice {
                cell.pastCost.isHidden = true
                cell.before.isHidden = true
                cell.beforeCenterView.isHidden = true
                cell.currancy.isHidden = true
            }
            else{
                cell.pastCost.isHidden = false
                cell.before.isHidden = false
                cell.beforeCenterView.isHidden = false
                cell.currancy.isHidden = false
            }
            return cell
        }
        else {
            let bookingData = self.canceledBooking?.fields?[indexPath.row]
            cell.fieldName.text = bookingData?.partnerName
            if let image = bookingData?.image {
                let url = URL(string: image)
                cell.ballImageView.kf.setImage(with: url)
                cell.fieldImage.kf.setImage(with: url)
            }
            
            if let image = bookingData?.partnerImage {
                let url = URL(string: image)
                cell.partnerImage.kf.setImage(with: url)
                
            }
            cell.partnerName.text = bookingData?.name
            cell.location.text = bookingData?.address
            cell.pastCost.text = "\( bookingData?.oldPrice! ?? 0)"
            cell.cost.text = "\(bookingData?.newPrice! ?? 0)"
            cell.point.text = "\( bookingData?.points! ?? 0)"
            cell.bestFor.text = bookingData?.bestFor
            cell.day.text = bookingData?.day
            cell.date.text = bookingData?.date
            cell.starttime.text = bookingData?.startTime
            cell.endTime.text = bookingData?.endTime
            
            if bookingData?.newPrice == bookingData?.oldPrice {
                cell.pastCost.isHidden = true
                cell.before.isHidden = true
                cell.beforeCenterView.isHidden = true
                cell.currancy.isHidden = true
            }
            else{
                cell.pastCost.isHidden = false
                cell.before.isHidden = false
                cell.beforeCenterView.isHidden = false
                cell.currancy.isHidden = false
            }
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if self.fieldsTabType == 0 {
                router?.navigateToDetails(id: (self.upCommingBooking?.fields?[indexPath.row].bookedSessionID)!, type: 0)
            }
                else if self.fieldsTabType == 1 {
                router?.navigateToDetails(id: (self.pastBooking?.fields?[indexPath.row].bookedSessionID)!, type: 1)
                }
                else{
                router?.navigateToDetails(id: (self.canceledBooking?.fields?[indexPath.row].bookedSessionID)! , type: 2)

                }
    }
}

extension MyBookingsViewController {
    
    func setupNavigationBar() {
        navigationItem.title = "My Booking"
        let button = UIButton(type: .system)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 5)
        button.sizeToFit()
        button.tintColor = .black
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
}

