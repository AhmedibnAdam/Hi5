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
    func checkOut(response: CheckOutSessionDetailsModel.CheckOut?)
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
    @IBOutlet weak var chooseCash: UIButton!
    @IBOutlet weak var chooseWallet: UIButton!
    @IBOutlet weak var walletView: UIView!
    @IBOutlet weak var bookedStatus: UILabel!
    @IBOutlet weak var process: UIButton!
    @IBOutlet weak var useCreditStack: UIStackView!
    @IBOutlet weak var applePayStack: UIStackView!
    @IBOutlet weak var CardPayStack: UIStackView!
    @IBOutlet weak var promoStack: UIStackView!
    @IBOutlet weak var paymentTypeStack: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var applePayCheck: UIButton!
    @IBOutlet weak var cardPayCheck: UIButton!
    @IBOutlet weak var containerScrollView: UIScrollView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    

    var payment: String?
    @IBAction func cashChoice(_ sender: UIButton) {
        sender.borderWidth = 1
        sender.backgroundColor = .orange
        sender.setTitleColor(.white, for: .normal)
        chooseWallet.backgroundColor = .white
        chooseWallet.setTitleColor(.darkGray, for: .normal)
        payment = "cash"
        hideWhileCash()
        chooseWallet.borderWidth = 0
    }
    @IBAction func walletChoice(_ sender: UIButton) {
        sender.borderWidth = 1
        sender.backgroundColor = .orange
        sender.setTitleColor(.white, for: .normal)
        chooseCash.backgroundColor = .white
        chooseCash.setTitleColor(.darkGray, for: .normal)
        payment = "online"
        showWhileOnline()
        chooseCash.borderWidth = 0
    }
    @IBAction func applePay(_ sender: UIButton) {
        applePayCheck.setImage(UIImage(named: "agreeCheckBox2"), for: .normal)
        cardPayCheck.setImage(UIImage(named: "agreeCheckBox"), for: .normal)
        cardView.isHidden = true
    }
    @IBAction func cardPay(_ sender: UIButton) {
        applePayCheck.setImage(UIImage(named: "agreeCheckBox"), for: .normal)
        cardPayCheck.setImage(UIImage(named: "agreeCheckBox2"), for: .normal)
        cardView.isHidden = false
    }
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        initView()
        promoCode.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if fieldData != nil{
            containerScrollView.isHidden = false
            indicator.stopAnimating()
            loadEventCheckOut()
            self.walletView.isHidden = true
            self.chooseWallet.isHidden = true
           
        }
        else {
            print("seession")
            loadSession()
            
            interactor?.checkOut(eventId: "\(sessionData?.field?.sessionID ?? 0)")
        }
    }
    
    func loadSession(){
        
        
        comapnyName.text = sessionData?.field?.partnerName
        fieldName.text = sessionData?.field?.name
        date.text = sessionData?.field?.date
        time.text = (sessionData?.field?.time) ?? "" //+ " - " + (sessionData?.field?.endTime)!
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
            //            paymentType.text = "Cash On field"
            //            paymentDetails.text = "Your request booked but not locked for you unless either you pay online, Other users can pay online and your booking will be canceled."
            //            cancelTitle.isHidden = true
            //            freeStack.isHidden = true
            //            chargeStack.isHidden = true
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
        if fieldData != nil{
            interactor?.joinPublicEvent(view: self, eventId: (fieldData?.publicEvent?.id!) ?? "\(sessionData?.field?.id! ?? 0)")
        }
        else {
            interactor?.parameters = ["payment_method": payment ?? "cash"]
            interactor?.join(view: self, eventId: "\(sessionData?.field?.sessionID! ?? 0)")
        }
    }
    
}

//MARK: - Extensions
extension CheckOutSessionDetailsViewController: ICheckOutSessionDetailsViewController {
    func checkOut(response: CheckOutSessionDetailsModel.CheckOut?) {
        containerScrollView.isHidden = false
        indicator.stopAnimating()

        let status = response?.session?.booked?.status
        let method = response?.session?.booked?.method
        let canBook = response?.session?.booked?.canBook
        
        if status == true{
            self.process.isHidden = true
            bookedStatus.text = "Locked"
             hideWhileCash()
            bookedStatus.textColor = .red
            if method == "Online" || method == "online"{
                self.chooseCash.isHidden = true
                 self.chooseWallet.isHidden = false
                 payment = method
                chooseWallet.backgroundColor = .orange
                chooseWallet.setTitleColor(.white, for: .normal)
            }
            else if method == "cash" || method == "Cash" {
                self.process.isHidden = false
                bookedStatus.text = "Unlocked"
                bookedStatus.textColor = .green
                self.chooseCash.isHidden = true
                self.chooseWallet.isHidden = false
                showWhileOnline()
                payment = "online"
                chooseCash.backgroundColor = .orange
                chooseCash.setTitleColor(.white, for: .normal)
            }
            else {
                self.process.isHidden = true
                bookedStatus.text = "Locked"
                hideWhileCash()
                self.chooseCash.isHidden = true
                self.chooseWallet.isHidden = false
                payment = method
                chooseWallet.backgroundColor = .orange
                chooseWallet.setTitleColor(.white, for: .normal)
            }
      
            
        }
        else {
            bookedStatus.text = "Unlocked"
            bookedStatus.textColor = .green
            self.process.isHidden = false
            
            if method == "Online" || method == "online"{
                self.chooseCash.isHidden = true
                self.chooseWallet.isHidden = false
                 payment = "online"
                showWhileOnline()
                chooseWallet.backgroundColor = .orange
                chooseWallet.setTitleColor(.white, for: .normal)
            }
            else if method == "cash" || method == "Cash" {
                self.chooseCash.isHidden = false
                self.chooseWallet.isHidden = true
                payment = "cash"
                hideWhileCash()
                chooseCash.backgroundColor = .orange
                chooseCash.setTitleColor(.white, for: .normal)
            }
            else {
                      self.process.isHidden = false
                      self.chooseCash.isHidden = false
                      self.chooseWallet.isHidden = false
                      payment = "online"
                      showWhileOnline()
                      chooseCash.backgroundColor = .orange
                      chooseCash.setTitleColor(.white, for: .normal)
                  }
          
        }
        if canBook == false{
            hideWhileCash()
            bookedStatus.text = "Locked"
            paymentTypeStack.isHidden = true
            process.isHidden = true
        }
        else {
             process.isHidden = false
            bookedStatus.text = "Unlocked"
        }
    }
    
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
    func hideWhileCash() {
        useCreditStack.isHidden = true
        applePayStack.isHidden = true
        CardPayStack.isHidden = true
        promoStack.isHidden = true
        cardView.isHidden = true
    }
    func showWhileOnline() {
        useCreditStack.isHidden = false
        applePayStack.isHidden = false
        CardPayStack.isHidden = false
        promoStack.isHidden = false
        cardView.isHidden = false
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
