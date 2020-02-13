//
//  FieldsViewController.swift
//  Hi5
//
//  Created by Adam on 12/26/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFieldsViewController: class {
	var router: IFieldsRouter? { get set }
    func showAlert(title: String, msg: String)
}

class FieldsViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    var types = ["Nearby Fields","Favourites","Member of"]
    //var imageBar = []
    var titleBar = ["social" , "event" , "notification"]
	var interactor: IFieldsInteractor?
	var router: IFieldsRouter?
    
    lazy var sideMenu: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "menu"), style: .done, target: self, action: #selector(openSideMenu))
    }()
    
    @objc func openSideMenu() {
        
    }
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    
    //MARK: - viewLifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        configer()
        setupNavigationBar()
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        registerCollectionCell()
        registerTableCell()
        registerBottomCollectionCell()
    }
}

//MARK: - Extensions
extension FieldsViewController: IFieldsViewController {
     func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
}

//MARK: - topCollectionView
extension FieldsViewController {
        func registerBottomCollectionCell() {
           let cell = UINib(nibName: "BottomCollectionViewCell", bundle: nil)
          bottomCollectionView.register(cell, forCellWithReuseIdentifier: "bottomCell")
    }
    
        func registerCollectionCell() {
            let cell = UINib(nibName: "TypeCollectionViewCell", bundle: nil)
            collectionView.register(cell, forCellWithReuseIdentifier: "typeCell")
    }
    
	    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if collectionView == self.collectionView {
                return types.count
            } else {
                return titleBar.count
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let type = types[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "typeCell", for: indexPath) as! TypeCollectionViewCell
            cell.typeLbl.text = type
            return cell
            
        } else {
            let title = titleBar[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as! BottomCollectionViewCell
            cell.barLbl.text = title
            cell.barImg.image = UIImage(named: title)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView {
            let width = collectionView.frame.width / 3
            let height = collectionView.frame.height
            return CGSize(width: width, height: height)
        } else {
            let width = bottomCollectionView.frame.width / 3
            let height = bottomCollectionView.frame.height
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TypeCollectionViewCell
        cell.typeLbl.textColor = .lightGray
        cell.hightLightVieww.isHidden = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! TypeCollectionViewCell
            cell.typeLbl.textColor = .orange
            cell.hightLightVieww.isHidden = false
        } else {
            router?.navigateToTabBar()
        }
         
    }
}

//MARK: - initializer
extension FieldsViewController {
    func initView(){

    }

    func configer(){
       router = FieldsRouter(view: self)
    }
    func setupNavigationBar() {
        navigationItem.title = "Fields"
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "searchIcon"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 5)
        button.setTitle("session", for: .normal)
        button.sizeToFit()
        button.tintColor = .black
        let searchSessionBtn = UIBarButtonItem(customView: button)
        navigationItem.setRightBarButton(searchSessionBtn, animated: true)
        button.addTarget(self, action: #selector(searchSession), for: .touchUpInside)
        navigationItem.setLeftBarButton(sideMenu, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func searchSession() {
        
    }
}

//MARK: - tableView
extension FieldsViewController: UITableViewDelegate , UITableViewDataSource {
    
    func registerTableCell() {
        let cell = UINib(nibName: "FieldsTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "fieldsCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fieldsCell") as! FieldsTableViewCell
        
        return cell
    }
    
    
}


