//
//  NotificationSettingRouter.swift
//  Hi5
//
//  Created by Adam on 12/31/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol INotificationSettingRouter: class {
	// do someting...
}

class NotificationSettingRouter: INotificationSettingRouter {	
	weak var view: NotificationSettingViewController?
	
	init(view: NotificationSettingViewController?) {
		self.view = view
	}
}
