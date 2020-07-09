//
//  NotificationSettingPresenter.swift
//  Hi5
//
//  Created by Adam on 12/31/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol INotificationSettingPresenter: class {
	 func showNotifications(response: NotificationSettingModel.NotificationsModel?)
}

class NotificationSettingPresenter: INotificationSettingPresenter {	
	weak var view: INotificationSettingViewController?
	
	init(view: INotificationSettingViewController?) {
		self.view = view
	}
    
    func showNotifications(response: NotificationSettingModel.NotificationsModel?) {
          view?.showNotifications(response: response)
    }
    
}
