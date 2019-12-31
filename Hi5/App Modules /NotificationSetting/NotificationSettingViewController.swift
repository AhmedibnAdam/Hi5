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

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension NotificationSettingViewController: INotificationSettingViewController {
	// do someting...
}

extension NotificationSettingViewController {
	// do someting...
}

extension NotificationSettingViewController {
	// do someting...
}
