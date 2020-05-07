//
//  PublicEventDetailsViewController.swift
//  Hi5
//
//  Created by Adam on 4/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
import Kingfisher

protocol IPublicEventDetailsViewController: class {
    var router: IPublicEventDetailsRouter? { get set }
    func showErrorAlert(title: String, msg: String)
    func showDetailsResponse(response: PublicEventDetailsModel.PublicEventDetails)
}

class PublicEventDetailsViewController: UIViewController {
    var interactor: IPublicEventDetailsInteractor?
    var router: IPublicEventDetailsRouter?
    
    var field_id: String?
    var fieldData: PublicEventDetailsModel.PublicEventDetails?
    
    @IBOutlet weak var noOfPlayerSlider: UISlider!
    @IBOutlet weak var sliderLableP: UILabel!
    @IBOutlet weak var fieldImage: UIImageView!
    @IBOutlet weak var babckButton: UIButton!
    @IBOutlet weak var favorite: UIButton!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var descreption: UILabel!
    @IBOutlet weak var sportsType: UILabel!
    @IBOutlet weak var field: UILabel!
    @IBOutlet weak var fieldType: UILabel!
    @IBOutlet weak var fieldSize: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var bestFor: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var guranteed: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var dat3: UILabel!
    @IBOutlet weak var creator: UILabel!
    @IBOutlet weak var paymentMetod: UILabel!
    @IBOutlet weak var creatorImage: UIImageView!
    @IBOutlet weak var playerNumbers: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var refundStack: UIStackView!
    @IBOutlet weak var refunbootomLineView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // do someting...
        initView()
        registerTableCell()
        
    }
    override func viewWillAppear(_ animated: Bool){
        interactor?.showDetails(view: self ,eventId: field_id! )
    }
    
    
    func initView(){
        navigationController?.isNavigationBarHidden = true
        noOfPlayerSlider.value = 1.0
        self.sliderLableP.text = "1"
        
        let trackRect = noOfPlayerSlider.trackRect(forBounds: noOfPlayerSlider.frame)
        let thumbRect = noOfPlayerSlider.thumbRect(forBounds: noOfPlayerSlider.bounds, trackRect: trackRect, value: noOfPlayerSlider.value - 0.9)
        
        self.sliderLableP.center = CGPoint(x: thumbRect.midX, y: self.sliderLableP.center.y)
    }
    @IBAction func join(_ sender: UIButton) {
        router?.navigateToCheckOutSessionDetails(field: self.fieldData!)
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        //   router?.navigateToFields()
        self.dismiss()
    }
    
    
}

extension PublicEventDetailsViewController: IPublicEventDetailsViewController {
    func showErrorAlert(title: String, msg: String){
        print(title )
        print(msg )
    }
    func showDetailsResponse(response: PublicEventDetailsModel.PublicEventDetails){
        let field = response.publicEvent
        self.fieldData = response
        tableView.reloadData()
        name.text = field?.fieldName
        age.text  = field?.groupName
        noOfPlayerSlider.value = Float((field?.playersNumber!)!)
        sliderLableP.text = "\(field?.playersNumber ?? 1)"
        let trackRect = noOfPlayerSlider.trackRect(forBounds: noOfPlayerSlider.frame)
        let thumbRect = noOfPlayerSlider.thumbRect(forBounds: noOfPlayerSlider.bounds, trackRect: trackRect, value: noOfPlayerSlider.value )
        
        self.sliderLableP.center = CGPoint(x: thumbRect.midX, y: self.sliderLableP.center.y)
        if let image = field?.fieldImage {
            let url = URL(string: image)
            fieldImage.kf.setImage(with: url)
        }
        
        location.text = field?.address
        descreption.text = ""
        sportsType.text = field?.sportType
        fieldType.text = field?.fieldType
        fieldSize.text = field?.fieldSize
        gender.text = field?.gender
        guranteed.text = "\(String(describing: field?.guaranteedRefundTime ?? 0)) hour before"
        time.text = "\(String(describing: field?.startTime ?? "")) - \(String(describing: field?.endTime ?? ""))"
        dat3.text = field?.date
        status.text = field?.status
        creator.text = field?.createrName
        if let image2 = field?.partnerImage {
            let url = URL(string: image2)
            creatorImage.kf.setImage(with: url)
        }
        playerNumbers.text = "\(String(describing: field?.players?.count ?? 0 )) members"
        paymentMetod.text = "Payment method: " + (field?.payment!)!
        if field?.payment == "cash"{
            refundStack.isHidden = true
            refunbootomLineView.isHidden = true
        }
        else{
            refundStack.isHidden = false
            refunbootomLineView.isHidden = false

        }
    }
}

extension PublicEventDetailsViewController {
    // do someting...
}

extension PublicEventDetailsViewController:  UITableViewDelegate , UITableViewDataSource {
    func registerTableCell() {
        let cell = UINib(nibName: "PlayersTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "PlayersTableViewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fieldData?.publicEvent?.players?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayersTableViewCell") as! PlayersTableViewCell
        let player = self.fieldData?.publicEvent?.players?[indexPath.row]
        cell.name.text = player?.name
        cell.userName.text = player?.userName
      
        return cell
    }
}
