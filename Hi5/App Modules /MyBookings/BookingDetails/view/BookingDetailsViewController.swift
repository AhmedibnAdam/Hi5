//
//  BookingDetailsViewController.swift
//  Hi5
//
//  Created by Adam on 5/11/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IBookingDetailsViewController: class {
    var router: IBookingDetailsRouter? { get set }
    func showAlert(title: String, msg: String)
    func showResponse(response: BookingDetailsModel.BookedDetails)
    
}

class BookingDetailsViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    var interactor: IBookingDetailsInteractor?
    var router: IBookingDetailsRouter?
    
    var sessionData: BookingDetailsModel.BookedDetails?
    //MARK: - Properties
    var payment: String?
    var id: Int?
    var sessionId: Int?
    var services: [BookingDetailsModel.Service] = []
    var fieldContacts: [SessionDetailsModel.FieldContact] = []
    var lat: Double?
    var long: Double?
    var type: Int?
    
    
    //MARK: - Outlets
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
    @IBOutlet weak var commentAndReview: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        configer()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        interactor?.bookedDetails(view: self, fieldId: id!)
    }
    @IBAction func backBtnTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func comment(_ sender: UIButton) {
        if type == 0 {
            interactor?.cancelBooking(fieldId: "\(self.sessionData?.field?.bookedSessionID ?? 0)")
        }
        else if type == 1{
            let params = ["field_id": self.sessionData?.field?.id ?? 0 , "session_id": self.sessionData?.field?.bookedSessionID ?? 0]
            router?.navigateToComment(params: params)
        }
        else {
            
        }
        
    }
    
}

extension BookingDetailsViewController: IBookingDetailsViewController {
    func showAlert(title: String, msg: String) {
        ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    
    func showResponse(response: BookingDetailsModel.BookedDetails) {
        guard let field = response.field else {return}
        
        sessionData = response
        fieldName.text = field.name
        fieldAddressLbl.text = field.address
        dateLbl.text = field.date
        timeLbl.text = (field.startTime ?? "") + "-" + (field.endTime ?? "") 
        sportTypeLbl.text = field.sport
        fieldTypeLbl.text = field.fieldType
        fieldSizeLbl.text = field.fieldSize
        statusLbl.text = field.status
        //        genderLbl.text = field.gender
        bestforLbl.text = field.bestFor
        //        availableLbl.text = field.visibility
        companyNameLbl.text = field.partnerName
        costLbl.text = "$\(String(describing: field.newPrice ?? 0))"
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

extension BookingDetailsViewController {
    func initView(){
        
        commentAndReview.isHidden = true
        if type == 0 {
            contactBtn.isHidden = false
            contactBtn.setTitle("Cancel", for: .normal)
        }
        else if  type == 1{
            contactBtn.isHidden = false
            if self.sessionData?.field?.status == "Locked"{
                
            }
                
            else{
                contactBtn.setTitle("Comment", for: .normal)
                
            }
        }
        else {
            contactBtn.isHidden = true
        }
    }
    
    func configer(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        registerCollectionCell()
    }
}

extension BookingDetailsViewController {
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
        let width = collectionView.frame.width / 6
        let height = collectionView.frame.height / 2
        return CGSize(width: width, height: height)
    }
}
extension BookingDetailsViewController {
    // do someting...
}
