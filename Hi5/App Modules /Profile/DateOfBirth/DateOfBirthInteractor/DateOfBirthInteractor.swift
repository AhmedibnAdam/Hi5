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
    func doDateOfBirthEditProfile(view : UIViewController , year: String , yearFlag: String , month: String , monthFlag: String , day: String , dayFlag: String)
}

class DateOfBirthInteractor: IDateOfBirthInteractor {
    var presenter: IDateOfBirthPresenter?
    var manager: IDateOfBirthManager?
    var parameters: [String: Any]?

    init(presenter: IDateOfBirthPresenter, manager: IDateOfBirthManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func doDateOfBirthEditProfile(view: UIViewController, year: String, yearFlag: String, month: String, monthFlag: String, day: String, dayFlag: String) {
        manager?.dateOfBirthEditProfileFromApi(year: year, yearFlag: yearFlag, month: month, monthFlag: monthFlag, day: day, dayFlag: dayFlag, complition: { (error, success) in
            if(success == true) {
                self.presenter?.hideIndicator()
                self.presenter?.navigateToEditProfile()
            } else {
                self.presenter?.hideIndicator()
                self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
            }
        })
    }
}
