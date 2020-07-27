//
//  NotificationSettingViewController.swift
//  Hi5
//
//  Created by Adam on 12/31/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
import Kingfisher

protocol INotificationSettingViewController: class {
	var router: INotificationSettingRouter? { get set }
     func showNotifications(response: NotificationSettingModel.NotificationsModel?)
}

class NotificationSettingViewController: UIViewController {
	var interactor: INotificationSettingInteractor?
	var router: INotificationSettingRouter?
    
    var notifications: NotificationSettingModel.NotificationsModel?
    var listOfNotifications: [NotificationSettingModel.Datum]? = []
    //For Pagination
   var isDataLoading:Bool=false
    var pageNo: Int = 1
    var limit: Int = 8
    var offset: Int = 0 //pageNo*limit
    var didEndReached :Bool = false
    @IBOutlet weak var centerIndecator: UIActivityIndicatorView!
    var dates: [String] = [String]()
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var moreIndicator: UIActivityIndicatorView!
    //MARK: - Properties
    
    var delegate: NotificationSettingControllerDelegate?
    lazy var buttonSlideBar: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "menu"), style: .done, target: self, action: #selector(sideMenu))
    }()
    
    @objc func sideMenu() {
        delegate?.handleMenuToggle()
    }
    //MARK: - View Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        registerTableCell()
        table.estimatedRowHeight = 300.0
        table.rowHeight = UITableView.automaticDimension
    }
    override func viewWillAppear(_ animated: Bool) {
       getNotificattions()
        centerIndecator.startAnimating()
        moreIndicator.stopAnimating()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        listOfNotifications?.removeAll()
    }
    
    
    func getNotificattions(){
        interactor?.getNotifications(page: pageNo)
    }
}


  //MARK: -Extensions
extension NotificationSettingViewController: INotificationSettingViewController {
    func showNotifications(response: NotificationSettingModel.NotificationsModel?) {
        guard let data = response?.data else{
            return
        }
//        self.notifications = data
        for noti in data{
            listOfNotifications?.append(noti)
            dates.append(noti.date!)
        }
        let unique = Array(Set(dates))
        dates = unique
        table.reloadData()
        centerIndecator.stopAnimating()
        moreIndicator.stopAnimating()
        self.view.layoutIfNeeded()
    }
    
    
    
	
}

extension NotificationSettingViewController: UITableViewDelegate, UITableViewDataSource {
 
    
      func registerTableCell() {
          let cell = UINib(nibName: "notificationTableViewCell", bundle: nil)
          table.register(cell, forCellReuseIdentifier: "notificationTableViewCell")
        table.register(MyHeaderView.self,
        forHeaderFooterViewReuseIdentifier: "header")
      }
    
    func numberOfSections(in tableView: UITableView) -> Int {
          return dates.count
      }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(
        withIdentifier: "header")
         let title = dates[section] 
        view?.textLabel?.isHidden = false
        view?.textLabel?.text = title
        return view
    }
      
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfNotifications?.count ?? 0 + offset
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "notificationTableViewCell", for: indexPath) as! notificationTableViewCell
        cell.msg.preferredMaxLayoutWidth = tableView.bounds.width
        cell.title.preferredMaxLayoutWidth = tableView.bounds.width
        let notify = self.listOfNotifications?[indexPath.row]
        cell.time.text = notify?.time
        cell.title.text = notify?.title
        cell.msg.text = notify?.message
        let url = notify?.image
        cell.img.kf.setImage(with: URL(string: url!))
        
         let d = dates[indexPath.section]
        if notify?.date != d {
                  cell.isHidden = true
              }
         return cell
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let d = dates[indexPath.section]
        
        if  let notify = listOfNotifications?[indexPath.row]{
            if notify.date != d {
                return 0
            }
        }
        
        return 90
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

        print("scrollViewWillBeginDragging")
        isDataLoading = false
    }
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
          return UITableView.automaticDimension
         }


    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating")
    }
    //Pagination
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

            print("scrollViewDidEndDragging")
            if ((table.contentOffset.y + table.frame.size.height) >= table.contentSize.height)
            {
//                if !isDataLoading{
//                    if (self.notifications?.onFirstPage == false) {
                    isDataLoading = true
                    self.pageNo = self.pageNo + 1
                    self.limit = self.limit + 8
                moreIndicator.startAnimating()
                    getNotificattions()
//                    }

//                }
            }


    }
}

extension NotificationSettingViewController {
  func setupNavigationBar() {
      navigationItem.title = "Notification"
      navigationItem.setLeftBarButton(buttonSlideBar, animated: true)
      navigationItem.leftBarButtonItem?.tintColor = .black
  }
}
