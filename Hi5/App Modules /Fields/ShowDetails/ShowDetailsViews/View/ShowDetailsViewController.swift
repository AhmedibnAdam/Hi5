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
}

class ShowDetailsViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
    //MARK: - Properties
	var interactor: IShowDetailsInteractor?
	var router: IShowDetailsRouter?
    
    //MARK: - Outlets
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
}

//MARK: - Extensions
extension ShowDetailsViewController: IShowDetailsViewController {
	// do someting...
}

//MARK: - CollectionViewMethods
extension ShowDetailsViewController{
    
    func registerCollectionCell() {
        let cell = UINib(nibName: "ServicesCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "ServicesCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCell", for: indexPath) as! ServicesCell
        
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
