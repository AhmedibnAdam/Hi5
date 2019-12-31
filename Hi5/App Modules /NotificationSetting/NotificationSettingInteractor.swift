//
//  NotificationSettingInteractor.swift
//  Hi5
//
//  Created by Adam on 12/31/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol INotificationSettingInteractor: class {
	var parameters: [String: Any]? { get set }
}

class NotificationSettingInteractor: INotificationSettingInteractor {
    var presenter: INotificationSettingPresenter?
    var manager: INotificationSettingManager?
    var parameters: [String: Any]?

    init(presenter: INotificationSettingPresenter, manager: INotificationSettingManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
