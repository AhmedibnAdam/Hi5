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
}

class DateOfBirthViewController: UIViewController {
	var interactor: IDateOfBirthInteractor?
	var router: IDateOfBirthRouter?
    
    var date: String?
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(dismissView))
    }()
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    //MARK:- Outlets
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var theMonthAndDayLbl: UILabel!
    @IBOutlet weak var theYearLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
		setupNavigationBar()
        initView()
        configure()
    }
    //MARK:- Actions
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let somedateString = dateFormatter.string(from: sender.date)
        date = somedateString
        print(somedateString)
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        saveBtnAction()
    }
    @IBAction func theMonthAbdDateBtnTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let onlyFriendsAction = UIAlertAction(title: "Only friends", style: .destructive) { (actionSheet) in
            self.theMonthAndDayLbl.text = "Only friends"
        }
        let publicAction = UIAlertAction(title: "Public", style: .destructive) { (actionSheet) in
            self.theMonthAndDayLbl.text = "Public"
        }
        let onlyMeAction = UIAlertAction(title: "Only me", style: .destructive) { (actionSheet) in
            self.theMonthAndDayLbl.text = "Only me"
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
        let onlyFriendsAction = UIAlertAction(title: "Only friends", style: .destructive) { (actionSheet) in
            self.theYearLbl.text = "Only friends"
        }
        let publicAction = UIAlertAction(title: "Public", style: .destructive) { (actionSheet) in
            self.theYearLbl.text = "Public"
        }
        let onlyMeAction = UIAlertAction(title: "Only me", style: .destructive) { (actionSheet) in
            self.theYearLbl.text = "Only me"
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
}

extension DateOfBirthViewController {
    func setupNavigationBar() {
        navigationItem.title = "Date Of Birth"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    func initView() {
        // MARK : - Button  raduis
        self.saveBtn = CreateCornerRauis.ButtonRaduis(button: self.saveBtn, number: 5)
    }
    
    func configure() {
        router = DateOfBirthRouter(view: self)
    }
}

extension DateOfBirthViewController {
    func saveBtnAction() {
        
    }
}
