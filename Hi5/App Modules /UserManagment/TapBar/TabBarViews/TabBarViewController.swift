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

protocol ITabBarViewController: class {
	var router: ITabBarRouter? { get set }
}

protocol HomeControllerDelegate {
    func handleMenuToggle()
}

class TabBarViewController: UITabBarController {
	var interactor: ITabBarInteractor?
	var router: ITabBarRouter?
    
   //MARK: - Properties
    var menuController: UIViewController!
    var isExpande = false
    lazy var social: UINavigationController = {
        let vc = SocialViewController()
         vc.delegate = self
         vc.tabBarItem.title = "social"
         vc.tabBarItem.image = UIImage(named: "social")
        let nav = UINavigationController(rootViewController: vc)
        return nav
    }()
    
    lazy var events: UINavigationController = {
        let vc = SechaduleConfiguration.setup()
         vc.tabBarItem.title = "events"
         vc.tabBarItem.image = UIImage(named: "event")
        let nav = UINavigationController(rootViewController: vc)
        return nav
    }()
    
    lazy var notification: UINavigationController = {
        let vc = NotificationSettingConfiguration.setup()
         vc.tabBarItem.title = "notification"
         vc.tabBarItem.image = UIImage(named: "notification")
        let nav = UINavigationController(rootViewController: vc)
        return nav
    }()
    //MARK:- View life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
		setViewControllers([social,events,notification], animated: true)
    }
}

//MARK:- Extensions
extension TabBarViewController: ITabBarViewController {
	
}

extension TabBarViewController: UITabBarControllerDelegate {
	
}

extension TabBarViewController {
    func configureMenuController() {
        if menuController == nil {
            menuController = SideMenuConfiguration.setup()
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("Done.....")
        }
   }
    
    func showMenuController(shouldExpand: Bool) {
        if shouldExpand {
            // show menu
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.view.frame.origin.x = self.view.frame.width - 80
            }, completion: nil)
        } else {
            // hide menu
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.view.frame.origin.x = 0
            }, completion: nil)
        }
    }
}

extension TabBarViewController: HomeControllerDelegate {
    func handleMenuToggle() {
            if !isExpande {
                configureMenuController()
            }
    
            isExpande = !isExpande
            showMenuController(shouldExpand: isExpande)
    }
}
