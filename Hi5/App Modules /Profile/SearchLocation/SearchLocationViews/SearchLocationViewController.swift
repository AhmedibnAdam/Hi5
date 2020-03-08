//
//  SearchLocationViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
import GooglePlaces

protocol ISearchLocationViewController: class {
	var router: ISearchLocationRouter? { get set }
    func showAlert(title: String, msg: String)
}

class SearchLocationViewController: UIViewController , UISearchBarDelegate {
	var interactor: ISearchLocationInteractor?
	var router: ISearchLocationRouter?
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(dismissView))
    }()
    
    lazy var checkMarkBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "checkMark"), style: .done, target: self, action: #selector(checkMarkBtnTapped))
    }()
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func checkMarkBtnTapped() {
        router?.navigateToLocation()
    }
    //MARK:- Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK:- View life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setupNavigationBar()
        initView()
        configure()
    }
    override func viewWillAppear(_ animated: Bool) {
        getPlace()
    }
    //MARK: - Search Bar
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self

        // Specify the place data types to return.
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
          UInt(GMSPlaceField.placeID.rawValue))!
        autocompleteController.placeFields = fields

        // Specify a filter.
        let filter = GMSAutocompleteFilter()
        filter.type = .address
        autocompleteController.autocompleteFilter = filter

        // Display the autocomplete view controller.
        present(autocompleteController, animated: true, completion: nil)
    }
    
    func getPlace() {
        let defaults = UserDefaults.standard
        let places = defaults.string(forKey: "location")
        searchBar.text = places
    }
   //MARK:- Actions
    
    
}
//MARK:- Extensions
extension SearchLocationViewController: ISearchLocationViewController {
     func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
}

extension SearchLocationViewController {
    func setupNavigationBar() {
        navigationItem.title = "Search Your Location"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.setRightBarButton(checkMarkBtn, animated: true)
        navigationItem.rightBarButtonItem?.tintColor = .black
//        navigationItem.rightBarButtonItem?.isEnabled = false
//        navigationItem.rightBarButtonItem?.tintColor = UIColor.clear
    }
    func initView() {

    }
    
    func configure() {
        router = SearchLocationRouter(view: self)
    }
}

extension SearchLocationViewController: GMSAutocompleteViewControllerDelegate {
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        if let place = place.name {
            let defaults = UserDefaults.standard
            defaults.set(place, forKey: "location")
        }
        getPlace()
      dismiss(animated: true, completion: nil)
    }

    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
      // TODO: handle the error.
      print("Error: ", error.localizedDescription)
    }

    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
      dismiss(animated: true, completion: nil)
    }

    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
      UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
      UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
