//
//  PublicEventContainerviewController.swift
//  Hi5
//
//  Created by Adam on 3/11/20.
//  Copyright © 2020 FudexApp. All rights reserved.
//

import Foundation
import UIKit

protocol PublicEventControllerDelegate {
    func handleMenuToggle()
}

class PublicEventContainerController: UIViewController {
    
    
    // @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var menuController: UIViewController!
    var centerController: UIViewController!
    var isExpanded = false
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePublicEventControllerController()
        
    }
    
    //MARK: - Handlers
    
    func configurePublicEventControllerController() {
        
        
        let PublicEventController = PublicEventsViewController()
        let router = PublicEventsRouter(view: PublicEventController)
        let presenter = PublicEventsPresenter(view: PublicEventController)
        let manager = PublicEventsManager()
        let interactor = PublicEventsInteractor(presenter: presenter, manager: manager)
        PublicEventController.interactor = interactor
        PublicEventController.router = router
        PublicEventController.delegate = self
        centerController = UINavigationController(rootViewController: PublicEventController)
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

extension PublicEventContainerController: PublicEventControllerDelegate {
    func handleMenuToggle() {
        if !isExpanded {
            configureMenuController()
        }
       
        
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded)
        
    }
}

