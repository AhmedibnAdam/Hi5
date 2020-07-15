//
//  TermsPresenter.swift
//  Hi5
//
//  Created by Adam on 7/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol ITermsPresenter: class {
	// do someting...
}

class TermsPresenter: ITermsPresenter {	
	weak var view: ITermsViewController?
	
	init(view: ITermsViewController?) {
		self.view = view
	}
}
