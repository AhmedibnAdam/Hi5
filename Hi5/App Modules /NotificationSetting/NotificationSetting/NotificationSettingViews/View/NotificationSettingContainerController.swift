//
//  ContainerController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/16/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import UIKit

protocol NotificationSettingControllerDelegate {
    func handleMenuToggle()
}

class NotificationSettingContainerController: UIViewController {
    
    //MARK: - Properties
    var menuController: UIViewController!
    var centerController: UIViewController!
    var isExpanded = false
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNotificationSettingControllerController()
    }
    
    //MARK: - Handlers
    
    func configureNotificationSettingControllerController() {
        let notificationSettingController = NotificationSettingViewController()
        notificationSettingController.delegate = self
        centerController = UINavigationController(rootViewController: notificationSettingController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuController == nil {
            menuController = SideMenuViewController()
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func showMenuController(shouldExpand: Bool) {
        if shouldExpand {
            // show menu
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
                self.tabBarController?.tabBar.isHidden = true
            }, completion: nil)
        } else {
            //hide menu
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
                self.tabBarController?.tabBar.isHidden = false
            }, completion: nil)
        }
    }
}

extension NotificationSettingContainerController: NotificationSettingControllerDelegate {
    func handleMenuToggle() {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded)
    }
}
