//
//  CheckOutSessionDetailsViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICheckOutSessionDetailsViewController: class {
    var router: ICheckOutSessionDetailsRouter? { get set }
    func showAlert(title: String, msg: String)
     func showDetailsResponse(response: CheckOutSessionDetailsModel.PublicEventDetailsJoin?)
}

class CheckOutSessionDetailsViewController: UIViewController {
    var interactor: ICheckOutSessionDetailsInteractor?
    var router: ICheckOutSessionDetailsRouter?
    
    var fieldData: PublicEventDetailsModel.PublicEventDetails?
    var sessionData: SessionDetailsModel.SessionDetailsResponse?
    //MARK:- Properties
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtntapped))
    }()
    
    @objc func backBtntapped() {
        self.dismiss(animated: true, completion: nil)
    }
    //MARK: - Outlets
    @IBOutlet weak var cashContainerView: UIView!
    @IBOutlet weak var walletContainerView: UIView!
    @IBOutlet weak var promocodeContainerView: UIView!
    @IBOutlet weak var comapnyName: UILabel!
    @IBOutlet weak var fieldName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var cancelPeriodFree: UILabel!
    @IBOutlet weak var chargeAfterFreePeriod: UILabel!
    @IBOutlet weak var promoCode: UITextField!
    @IBOutlet weak var paymentType: UILabel!
    @IBOutlet weak var paymentDetails: UILabel!
    @IBOutlet weak var subtotal: UILabel!
    @IBOutlet weak var cobonDiscount: UILabel!
    @IBOutlet weak var tax: UILabel!
    @IBOutlet weak var cancelTitle: UILabel!
    @IBOutlet weak var freeStack: UIStackView!
    @IBOutlet weak var chargeStack: UIStackView!
    @IBOutlet weak var subTotal: UILabel!
    @IBOutlet weak var total: UILabel!
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        initView()
        promoCode.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if fieldData != nil{
            loadEventCheckOut()
        }
        else {
            print("seession")
            loadSession()
        }
    }
    
    func loadSession(){
        
        
        comapnyName.text = sessionData?.field?.partnerName
        fieldName.text = sessionData?.field?.name
        date.text = sessionData?.field?.date
        time.text = (sessionData?.field?.time)! //+ " - " + (sessionData?.field?.endTime)!
//        cancelPeriodFree.text =  "\(sessionData?.field?.guaranteedRefundTime ?? "0")" + "hours before the start "
        total.text = "\(String(describing: sessionData?.field?.cost ?? 0))"
        subTotal.text = "\(String(describing: sessionData?.field?.cost ?? 0))"
        if fieldData?.publicEvent?.payment == "online" || sessionData?.field?.payment == "Online"{
            paymentType.text = "Wallet"
            paymentDetails.text = "Your request will be locked , other members cannot pay and book it."
            cancelTitle.isHidden = false
            freeStack.isHidden = false
            chargeStack.isHidden = false
        }
            
        else {
            paymentType.text = "Cash On field"
            paymentDetails.text = "Your request booked but not locked for you unless either you pay online, Other users can pay online and your booking will be canceled."
            cancelTitle.isHidden = true
            freeStack.isHidden = true
            chargeStack.isHidden = true
        }

    }
    func loadEventCheckOut() {
        comapnyName.text = fieldData?.publicEvent?.partnerName
        fieldName.text = fieldData?.publicEvent?.fieldName
        date.text = fieldData?.publicEvent?.date
        time.text = (fieldData?.publicEvent?.startTime ?? "")! + " - " + (fieldData?.publicEvent?.endTime ?? "")! 
        cancelPeriodFree.text =  "\(fieldData?.publicEvent?.guaranteedRefundTime ?? 0)" + "hours before the start "
        total.text = "\(String(describing: fieldData?.publicEvent?.cost ?? 0))"
        subTotal.text = "\(String(describing: fieldData?.publicEvent?.cost ?? 0))"
        if fieldData?.publicEvent?.payment == "online" || fieldData?.publicEvent?.payment == "Online"{
            paymentType.text = "Wallet"
            paymentDetails.text = "Your request will be locked , other members cannot pay and book it."
            cancelTitle.isHidden = false
            freeStack.isHidden = false
            chargeStack.isHidden = false
        }
            
        else {
            paymentType.text = "Cash On field"
            paymentDetails.text = "Your request booked but not locked for you unless either you pay online, Other users can pay online and your booking will be canceled."
            cancelTitle.isHidden = true
            freeStack.isHidden = true
            chargeStack.isHidden = true
        }
    }
    
    //MARK: - Actions
    @IBAction func proceesBtnTapped(_ sender: UIButton) {
  //      router?.navigateToWalletSuccessCheckOut()
        interactor?.showDetails(view: self, eventId: (fieldData?.publicEvent?.id!) ?? "\(sessionData?.field?.id! ?? 0)")
    }
    
}

//MARK: - Extensions
extension CheckOutSessionDetailsViewController: ICheckOutSessionDetailsViewController {
    func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    func showDetailsResponse(response: CheckOutSessionDetailsModel.PublicEventDetailsJoin?){
    }
}

//MARK: - Extension Initialization
extension CheckOutSessionDetailsViewController {
    func setupNavigationBar() {
        navigationItem.title = "CheckOut"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func initView() {

        
    }
}

extension CheckOutSessionDetailsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
      }
      
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          self.view.endEditing(true)
          return false
      }
}
