//
//  DateOfBirthInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/21/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IDateOfBirthInteractor: class {
	var parameters: [String: Any]? { get set }
}

class DateOfBirthInteractor: IDateOfBirthInteractor {
    var presenter: IDateOfBirthPresenter?
    var manager: IDateOfBirthManager?
    var parameters: [String: Any]?

    init(presenter: IDateOfBirthPresenter, manager: IDateOfBirthManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
