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

class BookingDetailsViewController: UIViewController {
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
    @IBOutlet weak var fieldName: UILabel!
   
    @IBOutlet weak var fieldImg: UIImageView!

    @IBOutlet weak var companyImg: UIImageView!
  
    @IBOutlet weak var contactBtn: UIButton!
    
    
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
        }
    }
}

extension BookingDetailsViewController {
    func initView(){
        
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
       
    }
}

extension BookingDetailsViewController {
    // do someting...
}
