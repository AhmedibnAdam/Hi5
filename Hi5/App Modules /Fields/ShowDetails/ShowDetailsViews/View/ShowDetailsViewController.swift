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

protocol IShowDetailsViewController: class {
	var router: IShowDetailsRouter? { get set }
    func showAlert(title: String, msg: String)
    func showDetailsResponse(response: ShowDetailsModel.ShowDetailsResponse)
}

class ShowDetailsViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
    //MARK: - Properties
	var interactor: IShowDetailsInteractor?
	var router: IShowDetailsRouter?
    var field: FieldsModel.Field?
    var services = [ShowDetailsModel.Service]()
    
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
    @IBOutlet weak var checkAvailabilityBtn: UIButton!
    
    //MARK: - View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCollectionCell()
        initView()
        configer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let id = field?.id {
            self.interactor?.showDetails(view: self, fieldId: id)
        } else {
            showAlert(title: "Error", msg: "SomeThing Wrong")
        }
    }
    //MARK: - Actions
    @IBAction func requestMemberShipBtnTapped(_ sender: UIButton) {
        if (sender.currentTitle == "Request membership") {
            sender.setTitle("Cancel Request", for: .normal)
            sender.setTitleColor(.lightGray, for: .normal)
            self.statusLbl.text = "pending"
            self.statusLbl.textColor = .lightGray
            if let id = field?.id {
                self.interactor?.requestMemberShip(view: self, fieldId: id)
            }
            
        } else {
            sender.setTitle("Request membership", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            self.statusLbl.text = "not a member"
            self.statusLbl.textColor = .black
            if let id = field?.id {
                self.interactor?.cancelRequestMemberShip(view: self, fieldId: id)
            }
        }
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        router?.navigateToFields()
    }
}

//MARK: - Extensions
extension ShowDetailsViewController: IShowDetailsViewController {
    func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    //MARK:  showDetailsResponse
    func showDetailsResponse(response: ShowDetailsModel.ShowDetailsResponse) {
        guard let field = response.field else {return}
        fieldName.text = field.name
        commentLbl.text = "\(String(describing: field.comments ?? 0))"
        rateLbl.text = "\(String(describing: field.rating ?? 0))"
        fieldAddressLbl.text = field.address
        fieldDescriptionLbl.text = field.fieldDescription
        sportTypeLbl.text = field.sportType
        fieldTypeLbl.text = field.fieldType
        fieldSizeLbl.text = field.fieldSize
        gendersLbl.text = field.gender
        bestForLbl.text = field.recommendedFor
        if (field.visibility == "public") {
            availableLbl.text = field.visibility
            self.statusStackView.isHidden = true
            self.containerView.isHidden = true
            self.requestMemberShipBtn.isHidden = true
        } else {
            availableLbl.text = field.visibility
            statusLbl.text = field.membership?.status
            self.statusStackView.isHidden = false
            //self.containerView.isHidden = false
            if (field.membership?.status == "not member") {
                self.requestMemberShipBtn.isHidden = false
                self.containerView.isHidden = true
            } else if (field.membership?.status == "member") {
                self.requestMemberShipBtn.isHidden = true
                self.containerView.isHidden = false
                self.expireDateLbl.text = field.membership?.expireAt
            } else if (field.membership?.status == "pending") {
                self.containerView.isHidden = true
                self.requestMemberShipBtn.isHidden = false
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
extension ShowDetailsViewController{
    
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

extension ShowDetailsViewController {
    func initView(){
        // MARK : - view raduis
        self.companyImg = CreateCornerRauis.imageViewRaduis(view: self.companyImg, number: (self.companyImg.frame.height / 2))
        self.containerView = CreateCornerRauis.viewRaduis(view: self.containerView, number: 5)
          // MARK : - Button  raduis
        self.checkAvailabilityBtn = CreateCornerRauis.ButtonRaduis(button: self.checkAvailabilityBtn, number: 5)
    }
    
    func configer(){
        router = ShowDetailsRouter(view: self)
    }
}
