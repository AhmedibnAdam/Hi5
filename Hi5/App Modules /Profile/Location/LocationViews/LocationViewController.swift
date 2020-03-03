//
//  LocationViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/26/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILocationViewController: class {
	var router: ILocationRouter? { get set }
    func showAlert(title: String, msg: String)
    func navigateToEditProfile()
    func hideIndicator()
}

class LocationViewController: UIViewController{
    
	var interactor: ILocationInteractor?
	var router: ILocationRouter?
    
    var words: [String] = []
    var country = ""
    var city = ""
    var state = ""
    var countryFlag = "public"
    var stateFlag = "public"
    var cityFlag = "public"
    //weak var delegate: DataEnteredDelegate?
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(dismissView))
    }()
    
    @objc func dismissView() {
        router?.navigateToEditProfile()
    }
    //MARK:- outlets
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    
    //MARK:- View Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let place = defaults.string(forKey: "place")
        locationBtn.setTitle(place, for: .normal)
    }
    //MARK:- Actions
    @IBAction func locationBtn(_ sender: UIButton) {
        router?.navigateToSearchLocation()
    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        saveBtnAction()
    }

    @IBAction func countryBtnTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let onlyFriendsAction = UIAlertAction(title: "Only friends", style: .destructive) { (actionSheet) in
            self.countryLbl.text = "Only friends"
            self.countryFlag = "Only friends"
        }
        let publicAction = UIAlertAction(title: "Public", style: .destructive) { (actionSheet) in
            self.countryLbl.text = "Public"
            self.countryFlag = "Public"
        }
        let onlyMeAction = UIAlertAction(title: "Only me", style: .destructive) { (actionSheet) in
            self.countryLbl.text = "Only me"
            self.countryFlag = "Only me"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(onlyFriendsAction)
        alert.addAction(publicAction)
        alert.addAction(onlyMeAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func stateBtnTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let onlyFriendsAction = UIAlertAction(title: "Only friends", style: .destructive) { (actionSheet) in
            self.stateLbl.text = "Only friends"
            self.stateFlag = "Only friends"
        }
        let publicAction = UIAlertAction(title: "Public", style: .destructive) { (actionSheet) in
            self.stateLbl.text = "Public"
            self.stateFlag = "Public"
        }
        let onlyMeAction = UIAlertAction(title: "Only me", style: .destructive) { (actionSheet) in
            self.stateLbl.text = "Only me"
            self.stateFlag = "Only me"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(onlyFriendsAction)
        alert.addAction(publicAction)
        alert.addAction(onlyMeAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func cityBtnTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let onlyFriendsAction = UIAlertAction(title: "Only friends", style: .destructive) { (actionSheet) in
            self.cityLbl.text = "Only friends"
            self.cityFlag = "Only friends"
        }
        let publicAction = UIAlertAction(title: "Public", style: .destructive) { (actionSheet) in
            self.cityLbl.text = "Public"
            self.cityFlag = "Public"
        }
        let onlyMeAction = UIAlertAction(title: "Only me", style: .destructive) { (actionSheet) in
            self.cityLbl.text = "Only me"
            self.cityFlag = "Only me"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(onlyFriendsAction)
        alert.addAction(publicAction)
        alert.addAction(onlyMeAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK:- extensions
extension LocationViewController: ILocationViewController {
     func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    func navigateToEditProfile() {
        router?.navigateToEditProfile()
    }
    func hideIndicator() {
        loadingIndicator.isHidden = true
    }
}

extension LocationViewController {
    func setupNavigationBar() {
        navigationItem.title = "Location"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    func configure() {
        router = LocationRouter(view: self)
    }
    func showIndicator() {
        loadingIndicator.isHidden = false
    }
}

extension LocationViewController {
    func saveBtnAction() {
        showIndicator()
        guard let location = locationBtn.titleLabel?.text else {
            hideIndicator()
            return showAlert(title: "Notification", msg: "Please select your location")
        }
        location.enumerateSubstrings(in: location.startIndex..<location.endIndex, options: .byWords) { substring, _, _, _ in
            if let substring = substring {
                self.words.append(substring)
            }
        }
        if words.count == 1 {
            self.country = words[0]
            self.city = ""
            self.state = ""
        } else if words.count == 2{
            self.country = words[0]
            self.city = words[1]
            self.state = ""
        } else {
            self.country = words[0]
            self.city = words[1]
            self.state = words[2]
        }
        interactor?.doLocationEditProfile(view: self, country: country, countryFlag: countryLbl.text ?? countryFlag, city: city, cityFlag: cityLbl.text ?? cityFlag, state: state, stateFlag: stateLbl.text ?? stateFlag)
        saveDataInUserDefaults()
    }
    func saveDataInUserDefaults() {
        let defaults = UserDefaults.standard
        defaults.set(locationBtn.titleLabel?.text, forKey: "location")
        defaults.set(countryFlag, forKey: "countryFlag")
        defaults.set(cityFlag, forKey: "cityFlag")
        defaults.set(stateFlag, forKey: "stateFlag")
    }
}

