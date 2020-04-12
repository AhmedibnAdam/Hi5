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

protocol ISessionDetailsViewController: class {
	var router: ISessionDetailsRouter? { get set }
    func showAlert(title: String, msg: String)
    func showResponse(response: SessionDetailsModel.SessionDetailsResponse)
    func showResponseFromContacts(response: SessionDetailsModel.FieldContactsResponse)
}

class SessionDetailsViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

	var interactor: ISessionDetailsInteractor?
	var router: ISessionDetailsRouter?
    
    //MARK: - Properties
    var payment: String?
    var id: Int?
    var sessionId: Int?
    var services: [SessionDetailsModel.Service] = []
    var fieldContacts: [SessionDetailsModel.FieldContact] = []
//    var name: [String] = []
//    var phoneNumber: [String] = []
    
    //MARK: - Outlets
    @IBOutlet weak var fieldContactsContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var fieldName: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var fieldImg: UIImageView!
    @IBOutlet weak var fieldAddressLbl: UILabel!
    @IBOutlet weak var bestforLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var availableLbl: UILabel!
    @IBOutlet weak var companyImg: UIImageView!
    @IBOutlet weak var fieldTypeLbl: UILabel!
    @IBOutlet weak var fieldSizeLbl: UILabel!
    @IBOutlet weak var sportTypeLbl: UILabel!
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var paymentLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var contactBtn: UIButton!
    
    //MARK: - ViewLifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        registerCollectionCell()
        registerTableViewCell()
        initView()
        configer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let sessionId = sessionId , let payment = payment else {return}
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
           router?.navigateToCheckOutSessionDetails()
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
        if (field.payment == "contact owner"){
            contactBtn.setTitle("Contact", for: .normal)
        } else {
            contactBtn.setTitle("Booking Now", for: .normal)
        }
        fieldName.text = field.name
        fieldAddressLbl.text = field.address
        descriptionLbl.text = field.fieldDescription
        dateLbl.text = field.date
        timeLbl.text = field.time
        sportTypeLbl.text = field.sport
        fieldTypeLbl.text = field.fieldType
        fieldSizeLbl.text = field.fieldSize
        genderLbl.text = field.gender
        bestforLbl.text = field.bestFor
        availableLbl.text = field.visibility
        companyNameLbl.text = field.partnerName
        costLbl.text = "$\(String(describing: field.cost ?? 0))"
        paymentLbl.text = "payment method: \(String(describing: field.payment ?? ""))"
        
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
        
        if let services = field.services {
            self.services = services
            collectionView.reloadData()
        }
    }
}

//MARK: - Extension Initialization
extension SessionDetailsViewController {
    func initView(){
        // MARK : - view raduis
//        self.companyImg = CreateCornerRauis.imageViewRaduis(view: self.companyImg, number: (self.companyImg.frame.height / 2))
//        self.fieldContactsContainerView = CreateCornerRauis.viewRaduis(view: self.fieldContactsContainerView , number: 5)
    }
    
    func configer(){
        router = SessionDetailsRouter(view: self)
    }
}

//MARK: - collectionViewMethods
extension SessionDetailsViewController {
    func registerCollectionCell() {
        let cell = UINib(nibName: "ServicesCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "ServicesCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCell", for: indexPath) as! ServicesCell
           cell.serviceLbl.text = services[indexPath.row].name
           if let serviceImg = services[indexPath.row].image {
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
    
}


