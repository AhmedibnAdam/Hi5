//
//  DateOfBirthViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/21/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IDateOfBirthViewController: class {
	var router: IDateOfBirthRouter? { get set }
    func showAlert(title: String, msg: String)
    func hideIndicator()
    func navigateToEditProfile()
}

class DateOfBirthViewController: UIViewController {
	var interactor: IDateOfBirthInteractor?
	var router: IDateOfBirthRouter?
    
    var words: [String] = []
    var dateOfBirth: String = "01 Jan 2020"
    var day = "01"
    var month = "Jan"
    var year = "2020"
    var yearFlag: String = "public"
    var monthFlag: String = "public"
    var dayFlag: String = "public"
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(dismissView))
    }()
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    //MARK:- Outlets
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var theMonthAndDayLbl: UILabel!
    @IBOutlet weak var theYearLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
		setupNavigationBar()
        configure()
       let calendar = Calendar(identifier: .gregorian)
        var comps = DateComponents()
        comps.year = -13
        let maxDate = calendar.date(byAdding: comps, to: Date())

        datePicker.maximumDate = maxDate

      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let yearLblFlag = defaults.string(forKey: "yearFlag")
        let monthLblFlag = defaults.string(forKey: "monthFlag")
        theYearLbl.text = yearLblFlag
        theMonthAndDayLbl.text = monthLblFlag
    }
    //MARK:- Actions
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let somedateString = dateFormatter.string(from: sender.date)
        dateOfBirth = somedateString
        print(somedateString)
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        saveBtnAction()
    }
    @IBAction func theMonthAbdDateBtnTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let onlyFriendsAction = UIAlertAction(title: "only friends", style: .destructive) { (actionSheet) in
            self.theMonthAndDayLbl.text = "only friends"
            self.monthFlag = "only friends"
            self.dayFlag = "only friends"
        }
        let publicAction = UIAlertAction(title: "public", style: .destructive) { (actionSheet) in
            self.theMonthAndDayLbl.text = "public"
            self.monthFlag = "public"
            self.dayFlag = "public"
        }
        let onlyMeAction = UIAlertAction(title: "only me", style: .destructive) { (actionSheet) in
            self.theMonthAndDayLbl.text = "only me"
            self.monthFlag = "only me"
            self.dayFlag = "only me"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(onlyFriendsAction)
        alert.addAction(publicAction)
        alert.addAction(onlyMeAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func yearBtnTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let onlyFriendsAction = UIAlertAction(title: "only friends", style: .destructive) { (actionSheet) in
            self.theYearLbl.text = "only friends"
            self.yearFlag = "only friends"
        }
        let publicAction = UIAlertAction(title: "public", style: .destructive) { (actionSheet) in
            self.theYearLbl.text = "public"
            self.yearFlag = "public"
        }
        let onlyMeAction = UIAlertAction(title: "only me", style: .destructive) { (actionSheet) in
            self.theYearLbl.text = "only me"
            self.yearFlag = "only me"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(onlyFriendsAction)
        alert.addAction(publicAction)
        alert.addAction(onlyMeAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

//MARK:- Extensions
extension DateOfBirthViewController: IDateOfBirthViewController {
     func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    func hideIndicator() {
        loadingIndicator.isHidden = true
    }
    func navigateToEditProfile() {
        router?.navigateToEditProfile()
    }
}

extension DateOfBirthViewController {
    func setupNavigationBar() {
        navigationItem.title = "Date Of Birth"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    func configure() {
        router = DateOfBirthRouter(view: self)
    }
    func showIndicator() {
        loadingIndicator.isHidden = false
    }
    
}

extension DateOfBirthViewController {
    func saveBtnAction() {
        showIndicator()
        dateOfBirth.enumerateSubstrings(in: dateOfBirth.startIndex..<dateOfBirth.endIndex, options: .byWords) { substring, _, _, _ in
            if let substring = substring {
                self.words.append(substring)
            }
        }
        day = words[0]
        month = words[1]
        year = words[2]
        interactor?.doDateOfBirthEditProfile(view: self, year: year, yearFlag: yearFlag, month: month, monthFlag: monthFlag, day: day, dayFlag: dayFlag)
        saveDataInUserDefaults()
    }
    
    func saveDataInUserDefaults() {
        let defaults = UserDefaults.standard
        defaults.set(dateOfBirth, forKey: "DateOfBirth")
        defaults.set(day, forKey: "day")
        defaults.set(month, forKey: "month")
        defaults.set(year, forKey: "year")
        defaults.set(yearFlag, forKey: "yearFlag")
        defaults.set(monthFlag, forKey: "monthFlag")
        defaults.set(dayFlag, forKey: "dayFlag")
    }
}
