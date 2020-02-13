//
//  TabBarViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/19/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
import SWRevealViewController

protocol ITabBarViewController: class {
	var router: ITabBarRouter? { get set }
}

class TabBarViewController: UITabBarController{
	var interactor: ITabBarInteractor?
	var router: ITabBarRouter?
    
    
    lazy var buttonSlideBar: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "menu"), style: .done, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
    }()
    
    @objc func sideMenu() {
        //router?.navigateToSideMenu()
    }
    
    lazy var social: UIViewController = {
        let vc = SocialConfiguration.setup()
         vc.tabBarItem.title = "social"
         vc.tabBarItem.image = UIImage(named: "social")
        return vc
    }()
    
    lazy var events: UIViewController = {
        let vc = SechadualeConfiguration.setup()
         vc.tabBarItem.title = "events"
         vc.tabBarItem.image = UIImage(named: "event")
        return vc
    }()
    
    lazy var notification: UIViewController = {
        let vc = NotificationSettingConfiguration.setup()
         vc.tabBarItem.title = "notification"
         vc.tabBarItem.image = UIImage(named: "notification")
        return vc
    }()
    //MARK:- View life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
		setViewControllers([social,events,notification], animated: true)
        NotificationCenter.default.addObserver(self, selector: #selector(TabBarViewController.methodOfReceivedNotification(notification:)), name: Notification.Name("NotificationIdentifier"), object: nil)
        
        if (self.revealViewController() != nil) {
            
            // enable navigation item to open and close Drawer
//            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            
            // enable to slide to open Drawer
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
//            self.navigationItem.leftBarButtonItem?.target = revealViewController()
//            self.navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
            
            
//            buttonSlideBar.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        }
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
//        guard let userInfo = notification.userInfo,
//            let name = userInfo["Renish"] as? String
//            else { return }
//        labelTest.text = name
    }
}
//MARK:- Extensions
extension TabBarViewController: ITabBarViewController {
	
}

extension TabBarViewController: UITabBarControllerDelegate {
	
}

extension TabBarViewController {
    func setupNavigationBar() {
        //navigationItem.title = "Edit Profile"
        navigationItem.setLeftBarButton(buttonSlideBar, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}
