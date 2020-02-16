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
    lazy var social: UIViewController = {
        let vc = ContainerController()
         vc.tabBarItem.title = "social"
         vc.tabBarItem.image = UIImage(named: "social")
        //let nav = UINavigationController(rootViewController: vc)
        return vc
    }()
    
    lazy var events: UINavigationController = {
        let vc = SechaduleViewController()
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

}

extension TabBarViewController {

}
