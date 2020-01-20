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
    
    
    lazy var social: UIViewController = {
        let vc = SocialConfiguration.setup()
         vc.tabBarItem.title = "social"
        return vc
    }()
    
    lazy var events: UIViewController = {
        let vc = SechadualeConfiguration.setup()
         vc.tabBarItem.title = "events"
        return vc
    }()
    
    lazy var notification: UIViewController = {
        let vc = NotificationSettingConfiguration.setup()
         vc.tabBarItem.title = "notification"
        return vc
    }()
    
	override func viewDidLoad() {
        super.viewDidLoad()
		setViewControllers([social,events,notification], animated: true)
    }
}

extension TabBarViewController: ITabBarViewController {
	
}

extension TabBarViewController: UITabBarControllerDelegate {
	
}

extension TabBarViewController {
	
}
