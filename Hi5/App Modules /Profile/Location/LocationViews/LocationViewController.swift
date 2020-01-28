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
}

protocol DataEnteredDelegate: class {
    func userDidEnterInformation(countryFlag: String , stateFlag: String , cityFlag: String)
}

class LocationViewController: UIViewController{
    
	var interactor: ILocationInteractor?
	var router: ILocationRouter?
    
    var countryFlag = "Public"
    var stateFlag = "Public"
    var cityFlag = "Public"
    weak var delegate: DataEnteredDelegate?
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(dismissView))
    }()
    
    @objc func dismissView() {
        router?.navigateToEditProfile()
    }
    //MARK:- outlets
    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    
    //MARK:- View Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        initView()
        configure()
    }
    //MARK:- Actions
    @IBAction func locationBtn(_ sender: UIButton) {
        router?.navigateToSearchLocation()
    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        delegate?.userDidEnterInformation(countryFlag: countryFlag , stateFlag: stateFlag , cityFlag: cityFlag)
        router?.navigateToEditProfile()
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
}

extension LocationViewController {
    func setupNavigationBar() {
        navigationItem.title = "Location"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    func initView() {
        // MARK : - Button  raduis
        self.saveBtn = CreateCornerRauis.ButtonRaduis(button: self.saveBtn, number: 5)
    }
    func configure() {
        router = LocationRouter(view: self)
    }
}

extension LocationViewController {
	
}

