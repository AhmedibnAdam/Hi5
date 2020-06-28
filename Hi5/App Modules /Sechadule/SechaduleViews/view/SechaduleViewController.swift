//
//  SechaduleViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/14/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
protocol ISechaduleViewController: class {
    var router: ISechaduleRouter? { get set }
    func showAlert(title: String, msg: String)
    func showUpCommingSechadule(response: SechaduleModel.SechaduleSessions)
    func showPastSechadule(response: SechaduleModel.PastSechaduleResponse)
    func showCancledSechadule(response: SechaduleModel.CanceledSechaduleResponse)
}

class SechaduleViewController: UIViewController {
    
    
    var interactor: ISechaduleInteractor?
    var router: ISechaduleRouter?
    var types = ["Comming","Past","Canceled"]
    var upCommingSechadule: SechaduleModel.SechaduleSessions?
    var pastSechadule: SechaduleModel.PastSechaduleResponse?
    var canceledSechadule: SechaduleModel.CanceledSechaduleResponse?
    var fieldsTabType = 0  // Comming = 0 / Past = 1 / Canceled = 2
    var firstTimeIn = 0
    var sechaduleCellCount = 0
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtntapped))
    }()
    
    @objc func backBtntapped() {
        router?.navigateToTabBar()
    }
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noSechaduleImage: UIImageView!
    @IBOutlet weak var noSechaduleLabel: UILabel!
    
    
    //MARK: - viewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        registerCollectionCell()
        registerTableCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        interactor?.getUpCommingSechadule(view: self)
    }
    
}

extension SechaduleViewController: ISechaduleViewController {
    
    func showAlert(title: String, msg: String) {
        print(title + "-" + msg)
    }
    
    func showUpCommingSechadule(response: SechaduleModel.SechaduleSessions) {
        let upCommingSechadule = response
        self.upCommingSechadule = upCommingSechadule
        fieldsTabType = 0
        sechaduleCellCount = upCommingSechadule.public_events?.count ?? 0
        self.tableView.reloadData()
        print(response)
    }
    
    func showPastSechadule(response: SechaduleModel.PastSechaduleResponse) {
        let pastSechadule = response
        self.pastSechadule = pastSechadule
        fieldsTabType = 1
        sechaduleCellCount = pastSechadule.public_events?.count ?? 0
        self.tableView.reloadData()
        print(response)
    }
    func showCancledSechadule(response: SechaduleModel.CanceledSechaduleResponse) {
        let canceledSechadule = response
        self.canceledSechadule = canceledSechadule
        fieldsTabType = 2
        sechaduleCellCount = canceledSechadule.public_events?.count ?? 0
        self.tableView.reloadData()
        print(response)
    }
    
}

extension SechaduleViewController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func registerCollectionCell() {
        let cell = UINib(nibName: "TypeCollectionViewCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "typeCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return types.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = types[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "typeCell", for: indexPath) as! TypeCollectionViewCell
        if firstTimeIn ==  0 {
            if indexPath.row == 0{
                cell.typeLbl.textColor = .orange
                cell.hightLightVieww.isHidden = false
                firstTimeIn += 1
            }
        }
        cell.typeLbl.text = type
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TypeCollectionViewCell
        cell.typeLbl.textColor = .lightGray
        cell.hightLightVieww.isHidden = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let firstCellIndexPath = IndexPath(item: 0, section: 0)
        let firstCell = collectionView.cellForItem(at: firstCellIndexPath) as!TypeCollectionViewCell
        firstCell.typeLbl.textColor = .lightGray
        firstCell.hightLightVieww.isHidden = true
        let cell = collectionView.cellForItem(at: indexPath) as! TypeCollectionViewCell
        cell.typeLbl.textColor = .orange
        cell.hightLightVieww.isHidden = false
        if (indexPath.row == 0) {
            self.interactor?.getUpCommingSechadule(view: self)
        } else if (indexPath.row == 1){
            self.interactor?.getPastSechadule(view: self)
        } else if (indexPath.row == 2){
            self.interactor?.getCancelSechadule(view: self)
        }
    }
}

extension SechaduleViewController: UITableViewDelegate , UITableViewDataSource {
    func registerTableCell() {
        let cell = UINib(nibName: "SechaduleTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "SechaduleTableViewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.sechaduleCellCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SechaduleTableViewCell") as! SechaduleTableViewCell
        
        if self.fieldsTabType == 0 {
            let sechaduleData = self.upCommingSechadule?.public_events?[indexPath.row]
            cell.fieldName.text = sechaduleData?.fieldName
            if let image = sechaduleData?.fieldImage {
                let url = URL(string: image)
                cell.ballImageView.kf.setImage(with: url)
                cell.fieldImage.kf.setImage(with: url)
            }
            
            if let image = sechaduleData?.partnerImage {
                let url = URL(string: image)
                cell.partnerImage.kf.setImage(with: url)
                
            }
            cell.partnerName.text = sechaduleData?.partnerName
            
            cell.location.text = sechaduleData?.address
//            cell.pastCost.text = "\( sechaduleData?.oldPrice! ?? 0)"
            cell.cost.text = "\(sechaduleData?.cost! ?? 0)"
            cell.point.text = "\( String(describing: sechaduleData?.points) )"
            
            cell.bestFor.text = sechaduleData?.bestFor
            cell.day.text = sechaduleData?.day
            cell.date.text = sechaduleData?.date
            cell.starttime.text = sechaduleData?.startTime
            cell.endTime.text = sechaduleData?.endTime

            return cell
        }
        else if self.fieldsTabType == 1 {
            let sechaduleData = self.pastSechadule?.public_events?[indexPath.row]
            cell.fieldName.text = sechaduleData?.fieldName
            if let image = sechaduleData?.fieldImage {
                let url = URL(string: image)
                cell.ballImageView.kf.setImage(with: url)
                cell.fieldImage.kf.setImage(with: url)
            }
            
            if let image = sechaduleData?.partnerImage {
                let url = URL(string: image)
                cell.partnerImage.kf.setImage(with: url)
                
            }
            cell.partnerName.text = sechaduleData?.partnerName
            cell.location.text = sechaduleData?.address
//            cell.pastCost.text = "\( sechaduleData?.oldPrice! ?? 0)"
            cell.cost.text = "\(sechaduleData?.cost! ?? 0)"
            cell.point.text = "\( sechaduleData?.points )"
            cell.bestFor.text = sechaduleData?.bestFor
            cell.day.text = sechaduleData?.day
            cell.date.text = sechaduleData?.date
            cell.starttime.text = sechaduleData?.startTime
            cell.endTime.text = sechaduleData?.endTime
            

            return cell
        }
        else {
            let sechaduleData = self.canceledSechadule?.public_events?[indexPath.row]
            cell.fieldName.text = sechaduleData?.fieldName
            if let image = sechaduleData?.partnerImage {
                let url = URL(string: image)
                cell.ballImageView.kf.setImage(with: url)
                cell.fieldImage.kf.setImage(with: url)
            }
            
            if let image = sechaduleData?.partnerImage {
                let url = URL(string: image)
                cell.partnerImage.kf.setImage(with: url)
                
            }
            cell.partnerName.text = sechaduleData?.partnerName
            cell.location.text = sechaduleData?.address
//            cell.pastCost.text = "\( sechaduleData?.oldPrice! ?? 0)"
            cell.cost.text = "\(sechaduleData?.cost! ?? 0)"
            cell.point.text = "\( String(describing: sechaduleData?.points) )"
            cell.bestFor.text = sechaduleData?.bestFor
            cell.day.text = sechaduleData?.day
            cell.date.text = sechaduleData?.date
            cell.starttime.text = sechaduleData?.startTime
            cell.endTime.text = sechaduleData?.endTime
            return cell
        }
    }
}

extension SechaduleViewController {
    
    func setupNavigationBar() {
        navigationItem.title = "My schedule"
        let button = UIButton(type: .system)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 5)
        button.sizeToFit()
        button.tintColor = .black
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
}

