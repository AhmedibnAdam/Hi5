//
//  ShowDetailsViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
import GoogleMaps

protocol IShowDetailsViewController: class {
	var router: IShowDetailsRouter? { get set }
    func showAlert(title: String, msg: String)
    func showDetailsResponse(response: ShowDetailsModel.FieldDetails)
}

class ShowDetailsViewController: UIViewController   {
    //MARK: - Properties
	var interactor: IShowDetailsInteractor?
	var router: IShowDetailsRouter?
    var fieldRes:   ShowDetailsModel.FieldDetails?
    var field: ShowDetailsModel.FieldDetails?
    var services : [ShowDetailsModel.FieldDetailsService]?
    var field_id: String?
    var lat , long :String?
    var parameters: [String: Any]?
    //MARK: - Outlets
    @IBOutlet weak var statusStackView: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var fieldImg: UIImageView!
    @IBOutlet weak var fieldName: UILabel!
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var fieldAddressLbl: UILabel!
    @IBOutlet weak var sportTypeLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var paymentLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyImg: UIImageView!
    @IBOutlet weak var requestMemberShipBtn: UIButton!
    @IBOutlet weak var expireDateLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var availableLbl: UILabel!
    @IBOutlet weak var bestForLbl: UILabel!
    @IBOutlet weak var gendersLbl: UILabel!
    @IBOutlet weak var fieldSizeLbl: UILabel!
    @IBOutlet weak var fieldTypeLbl: UILabel!
    @IBOutlet weak var fieldDescriptionLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var showLocation: UIButton!
    @IBOutlet weak var checkAvailabilityBtn: UIButton!
    @IBOutlet weak var googleMapView: GMSMapView!
    @IBOutlet weak var memberShipView: UIView!
    @IBOutlet weak var policyView: UIView!
    @IBOutlet weak var policy1: UILabel!
    @IBOutlet weak var policy2: UILabel!
    @IBOutlet weak var policy3: UILabel!
    @IBOutlet weak var youstatus: UILabel!
    
    //MARK: - View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        configer()
      
    }
    
    
    func setLocation(){
        let camera = GMSCameraPosition.camera(withLatitude: Double( self.lat!)!,longitude: Double(  self.long!)!, zoom: 10)
        self.googleMapView.isMyLocationEnabled = true

          self.googleMapView.camera = camera

          let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake( Double( self.lat!)!,Double(  self.long!)!)
      
          marker.map = googleMapView
    }
    override func viewWillAppear(_ animated: Bool) {
        if let id = field_id{
            self.interactor?.showDetails(view: self, fieldId: id)
            self.view.dropShadow()
        } else {
            showAlert(title: "Error", msg: "SomeThing Wrong")
        }
    }
    //MARK: - Actions
    @IBAction func showComment(_ sender: UIButton) {
        router?.navigateToAllComments(id: self.fieldRes?.field?.id ?? 0)
    }
    @IBAction func requestMemberShipBtnTapped(_ sender: UIButton) {
        if (sender.currentTitle == "Request membership") {
            sender.setTitle("Cancel Request", for: .normal)
            sender.setTitleColor(.lightGray, for: .normal)
            self.statusLbl.text = "pending"
            self.statusLbl.textColor = .lightGray
            if let id = field?.field?.id {
                self.interactor?.requestMemberShip(view: self, fieldId: id)
            }
            
        } else {
            sender.setTitle("Request membership", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            self.statusLbl.text = "not a member"
            self.statusLbl.textColor = .black
            if let id = field?.field?.id {
                self.interactor?.cancelRequestMemberShip(view: self, fieldId: id)
            }
        }
    }
    
    @IBAction func checkAvailabilityBtnTapped(_ sender: UIButton) {
        let fieldId = fieldRes?.field?.id
        let fieldName = fieldRes?.field?.name
        router?.navigateToSessionResult(param: parameters! ,fieldId: fieldId ?? 1 , fieldName: fieldName ?? "HighFive")
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        router?.navigateToFields()
    }
    
    @IBAction func showLocation(_ sender: Any) {
        if (UIApplication.shared.canOpenURL(NSURL(string:"comgooglemaps://")! as URL)) {
            UIApplication.shared.openURL(NSURL(string:
                "comgooglemaps://?saddr=&daddr=\( lat ?? "0.0")),\( long ?? "0.0"))&directionsmode=driving")! as URL)

            } else {
                NSLog("Can't use comgooglemaps://");
            }
        }
    
    
}


//MARK: - Extensions
extension ShowDetailsViewController: IShowDetailsViewController {
    func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
        if msg == "sorry this record not found in DB"{
            router?.navigateToFields()
        }
    }
    //MARK:  showDetailsResponse
    func showDetailsResponse(response: ShowDetailsModel.FieldDetails) {
        guard let field = response.field else {return}
        self.field = response
        fieldName.text = field.name
        self.fieldRes = response
        self.lat = field.latitude
        self.long = field.longitude
        setLocation()
        commentLbl.text = (String(format: "%01d", field.comments ?? 0))
        rateLbl.text = (String(format: "%01d", field.rating ?? 0))  
        fieldAddressLbl.text = field.address
        fieldDescriptionLbl.text = field.fieldDescription
        sportTypeLbl.text = field.sportType
        fieldTypeLbl.text = field.fieldType
        fieldSizeLbl.text = field.fieldSize
        gendersLbl.text = field.gender
        bestForLbl.text = field.recommendedFor
        youstatus.text = field.membership?.status
        if field.bookingFrequencyTime == 0 {
           policy1.text = "You can book session at any time "
        }
        else {
            policy1.text = "You can book \(field.bookingFrequencyTime ?? 0) session every \( field.bookingFrequencyPer ?? "at any time" )"
        }
        policy2.text = "free cancelation until \(field.freeCancellationTimeFrame ?? 0)  hour before session starting time "
        policy3.text = "you can book a session in \( field.receivingBookingTimeFrame ?? 0 ) hours ahead of starting time "
        if (field.visibility == "public") {
            availableLbl.text = field.visibility
            self.statusStackView.isHidden = true
            self.containerView.isHidden = true
            self.requestMemberShipBtn.isHidden = true
            self.memberShipView.isHidden = true
            self.policyView.isHidden = true
        } else {
            availableLbl.text = field.visibility
            statusLbl.text = field.membership?.status
            self.statusStackView.isHidden = false
            //self.containerView.isHidden = false
            if (field.membership?.status == "not member") {
                self.requestMemberShipBtn.isHidden = false
                self.memberShipView.isHidden = false
                self.policyView.isHidden = false
                self.containerView.isHidden = true
            } else if (field.membership?.status == "member") {
                self.requestMemberShipBtn.isHidden = true
                self.memberShipView.isHidden = false
                self.policyView.isHidden = false
                self.containerView.isHidden = false
                self.expireDateLbl.text = field.membership?.expireAt
            } else if (field.membership?.status == "pending") {
                self.containerView.isHidden = true
                self.requestMemberShipBtn.isHidden = false
                self.memberShipView.isHidden = false
                self.policyView.isHidden = false
                self.statusLbl.textColor = .lightGray
                self.requestMemberShipBtn.setTitle("Cancel Request", for: .normal)
                self.requestMemberShipBtn.setTitleColor(.lightGray, for: .normal)
            }
        }
        availableLbl.text = field.visibility
        companyName.text = field.partnerName
        if let fieldImg = field.fieldImage {
            let url = URL(string: fieldImg)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url!) {
                    DispatchQueue.main.async {
                        self.fieldImg.image = UIImage(data: data)
                    }
                }
            }
        }
        if let partnerImg = field.partnerImage {
            let url = URL(string: partnerImg)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url!) {
                    DispatchQueue.main.async {
                        self.companyImg.image = UIImage(data: data)
                    }
                }
            }
        }
        costLbl.text = "Started from: $\(String(describing: field.cost ?? 0)) / hour"
        paymentLbl.text = "payment: \(field.payment ?? "")"
        if let services = field.services {
            self.services = services
        
            self.collectionView.reloadData()
        }
    }
}

//MARK: - CollectionViewMethods
extension ShowDetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func registerCollectionCell() {
        let cell = UINib(nibName: "ServicesCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "ServicesCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services?.count ?? 0 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCell", for: indexPath) as! ServicesCell
        cell.serviceLbl.text = services?[indexPath.row].name
        if let serviceImg = services?[indexPath.row].image {
               let url = URL(string: serviceImg)
               DispatchQueue.global().async {
                   if let data = try? Data(contentsOf: url!) {
                       DispatchQueue.main.async {
                           cell.serviceimg.image = UIImage(data: data)
                       }
                   }
               }
           }
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width / 4
            let height = collectionView.frame.height
            return CGSize(width: width, height: height)
    }
}

extension ShowDetailsViewController {
    func initView(){
        registerCollectionCell()
    }
    
    func configer(){
        router = ShowDetailsRouter(view: self)
    }
}
