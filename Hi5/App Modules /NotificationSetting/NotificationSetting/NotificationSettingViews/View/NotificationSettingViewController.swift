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

protocol INotificationSettingViewController: class {
	var router: INotificationSettingRouter? { get set }
}

class NotificationSettingViewController: UIViewController {
	var interactor: INotificationSettingInteractor?
	var router: INotificationSettingRouter?
    
    @IBOutlet weak var table: UITableView!
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
//        table.isHidden = false
    }
}


  //MARK: -Extensions
extension NotificationSettingViewController: INotificationSettingViewController {
	// do someting...
}

extension NotificationSettingViewController {
    
}

extension NotificationSettingViewController {
  func setupNavigationBar() {
      navigationItem.title = "Notification"
      navigationItem.setLeftBarButton(buttonSlideBar, animated: true)
      navigationItem.leftBarButtonItem?.tintColor = .black
  }
}
