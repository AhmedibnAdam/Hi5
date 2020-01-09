//
//  EmailVerficationPresenter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IEmailVerficationPresenter: class {
	// do someting...
}

class EmailVerficationPresenter: IEmailVerficationPresenter {	
	weak var view: IEmailVerficationViewController?
	
	init(view: IEmailVerficationViewController?) {
		self.view = view
	}
}
