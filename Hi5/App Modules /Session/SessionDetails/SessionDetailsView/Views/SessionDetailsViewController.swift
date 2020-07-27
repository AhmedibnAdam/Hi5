//
//  SessionDetailsViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/5/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
import GoogleMaps
import Kingfisher


protocol ISessionDetailsViewController: class {
    var router: ISessionDetailsRouter? { get set }
    func showAlert(title: String, msg: String)
    func showResponse(response: SessionDetailsModel.SessionDetailsResponse)
    func showResponseFromContacts(response: SessionDetailsModel.FieldContactsResponse)
}

class SessionDetailsViewController: UIViewController {

    var interactor: ISessionDetailsInteractor?
    var router: ISessionDetailsRouter?
    var sessionData: SessionDetailsModel.SessionDetailsResponse?
    //MARK: - Properties
    var payment: String?
    var id: Int?
    var sessionId: Int?
    var services: [SessionDetailsModel.Service] = []
    var fieldContacts: [SessionDetailsModel.FieldContact] = []
    var lat: Double?
    var long: Double?
var locationManager: CLLocationManager!
 var currentLocation: CLLocation?
 var zoomLevel: Float = 15.0
    
    //MARK: - Outlets
    @IBOutlet weak var fieldContactsContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var fieldName: UILabel!

    @IBOutlet weak var fieldImg: UIImageView!

    @IBOutlet weak var paymentLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var contactBtn: UIButton!
    @IBOutlet weak var googleMapView: GMSMapView!
    @IBOutlet weak var mapHeight: NSLayoutConstraint!
    @IBOutlet weak var containerScrollView: UIScrollView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
     //MARK: - New Outlets
    
    @IBOutlet weak var bestFor: UILabel!
    
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var genderStatusIcon: UIImageView!
    
    @IBOutlet weak var privacy: UILabel!
    @IBOutlet weak var privcyStatus: UILabel!
    @IBOutlet weak var privacyStatusIcon: UIImageView!
    
    @IBOutlet weak var reasonOne: UILabel!
    
    @IBOutlet weak var reasonTow: UILabel!
    
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
       
        registerTableViewCell()
        initView()
        configer()
//        setLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let sessionId = sessionId , let payment = payment else {return}
        containerScrollView.isHidden = true
        self.interactor?.sessionDetails(view: self, fieldId: sessionId, payment: payment)
    }
    //MARK: - Actions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func contactBtnPressed(_ sender: UIButton) {
        if (contactBtn.titleLabel?.text == "Contact") {
            guard let id = id else {return}
            self.interactor?.fieldContacts(view: self, id: id)
        } else {
            router?.navigateToCheckOutSessionDetails(session: sessionData!)
        }
    }
    

    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        fieldContactsContainerView.isHidden = true
    }
    
}

//MARK: - Extensions
extension SessionDetailsViewController: ISessionDetailsViewController {
    func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    func showResponseFromContacts(response: SessionDetailsModel.FieldContactsResponse){
        guard let fieldContacts = response.fieldContacts else {return}
        self.fieldContacts = fieldContacts
        fieldContactsContainerView.isHidden = false
        tableView.reloadData()
    }
    func showResponse(response: SessionDetailsModel.SessionDetailsResponse) {
        guard let field = response.field else {return}
        containerScrollView.isHidden = false
        indicator.hidesWhenStopped = true
        indicator.stopAnimating()
//        indicator.isHidden = true
        if (field.payment == "contact owner"){
            contactBtn.setTitle("Contact", for: .normal)
        } else {
            contactBtn.setTitle("Booking Now", for: .normal)
        }
        sessionData = response
        fieldName.text = field.name

        costLbl.text = "$\(String(format: "%.2f", field.cost ?? 0))"
        paymentLbl.text = "payment method: \(String(describing: field.payment ?? ""))"
       
        setLocation()
        if let fieldImg = field.image {
            let url = URL(string: fieldImg)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url!) {
                    DispatchQueue.main.async {
                        self.fieldImg.image = UIImage(data: data)
                    }
                }
            }
        }
        
        
         //MARK: - new
        
        bestFor.text = "\(String(describing: field.fieldType!))  (\(String(describing: field.bestFor!)))"
        
        date.text =  field.date
        guard let start = field.startTime else {
            return
        }
        guard let end = field.endTime else {
            return
        }
        startTime.text = "Start: " + start
        endTime.text = "End: " + end
        
        if field.overnight == true {
           endTime.text = "End: " + end + " (overnight)"
        }
        gender.text = field.gender
        status.text = field.genderMatch
        if field.genderMatch != "Not Applied"{
            genderStatusIcon.image = UIImage(named: "correct")
             reasonOne.isHidden = true
        }
        else {
            reasonOne.isHidden = false
            reasonOne.text = "Gender is not matching but you can book this session."
        }
        
        privacy.text = field.visibility
        if field.membership?.status == "not member"{
            privcyStatus.text = "Notapplied"
            reasonTow.isHidden = false
            reasonTow.text = "Membership is required to book this session."
        }
        else {
            reasonOne.isHidden = true
        }

    }
}

//MARK: - Extension Initialization
extension SessionDetailsViewController {
    func initView(){

    }
    
    func configer(){
        router = SessionDetailsRouter(view: self)
    }
    func setLocation(){
        let camera = GMSCameraPosition.camera(withLatitude: self.lat ?? 24.86, longitude: self.long ?? 46.20, zoom: 6)
        self.googleMapView.isMyLocationEnabled = true

          self.googleMapView.camera = camera

          let marker = GMSMarker()
          marker.position = CLLocationCoordinate2DMake(self.lat ?? 24.86,  self.long ?? 46.20)
      
        if self.lat == nil {
//            self.googleMapView.isHidden = true
//            mapHeight.constant = 0
        }
        else{
//            self.googleMapView.isHidden = false
//                       mapHeight.constant = 200
        }
          marker.map = googleMapView
    }
}

//MARK: - collectionViewMethods
extension SessionDetailsViewController {
    
 
}

extension SessionDetailsViewController: UITableViewDelegate , UITableViewDataSource {
    func registerTableViewCell() {
        let cell = UINib(nibName: "FieldContractsCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "FieldContractsCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fieldContact = fieldContacts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FieldContractsCell") as! FieldContractsCell
        cell.nameLbl.text = fieldContact.name
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fieldContact = fieldContacts[indexPath.row]
        guard let number = URL(string: "tel://" + (fieldContact.phone ?? "")) else { return }
        UIApplication.shared.open(number)
    }
    
}


