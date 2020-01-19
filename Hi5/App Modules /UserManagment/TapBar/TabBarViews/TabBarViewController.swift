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

class TabBarViewController: UITabBarController{
	var interactor: ITabBarInteractor?
	var router: ITabBarRouter?
    
    
    lazy var social: SocialViewController = {
        let vc = SocialViewController()
         vc.tabBarItem.title = "social"
//         vc.tabBarItem.image = #imageLiteral(resourceName: "SM")
        return vc
    }()
    
    lazy var events: SechadualeViewController = {
        let vc = SechadualeViewController()
         vc.tabBarItem.title = "events"
//         vc.tabBarItem.image = #imageLiteral(resourceName: "NO")
        return vc
    }()
    
    lazy var notification: NotificationSettingViewController = {
        let vc = NotificationSettingViewController()
         vc.tabBarItem.title = "notification"
//         vc.tabBarItem.image = #imageLiteral(resourceName: "GA")
        return vc
    }()
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
		setViewControllers([social,events,notification], animated: true)
       // self.select = 0
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
           print("Should select viewController: \(viewController.title ?? "") ?")
           return true
       }
}

extension TabBarViewController: ITabBarViewController {
	// do someting...
}

extension TabBarViewController: UITabBarControllerDelegate {
	// do someting...
}

extension TabBarViewController {
	// do someting...
}
