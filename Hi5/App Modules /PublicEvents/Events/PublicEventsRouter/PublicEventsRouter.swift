//
//  PublicEventsRouter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPublicEventsRouter: class {
	// do someting...
    func navugateToDetails(event_id: String)
}

class PublicEventsRouter: IPublicEventsRouter {
  
    
	weak var view: PublicEventsViewController?
	
	init(view: PublicEventsViewController?) {
		self.view = view
	}
    
    func navugateToDetails(event_id: String) {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.publicEvents(event_id: event_id), completion: nil)
    }
    
}
