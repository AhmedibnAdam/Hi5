//
//  SocialViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/11/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISocialViewController: class {
    var router: ISocialRouter? { get set }
}

class SocialViewController: UIViewController {
    
    
    var interactor: ISocialInteractor?
    var router: ISocialRouter?
    //MARK:- Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    //MARK: - Properties
    
    var delegate: SocialControllerDelegate?
    let cellID = "SocialCellID"
    let headerID = "headerId"
    let usersname = ["David Smith","Jack Ahlers","Karl Nyland","Talitha Stinger","Karl Nyland","David Smith","Jack Ahlers"]
    lazy var buttonSlideBar: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "menu"), style: .done, target: self, action: #selector(sideMenu))
    }()
    
    @objc func sideMenu() {
        delegate?.handleMenuToggle()
    }
    
    //MARK: - ViewlifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        registerCollectionCell()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
//MARK: - Extensions
extension SocialViewController: ISocialViewController {
    // do someting...
}
extension SocialViewController {
    // do someting...
    //MARK: - Extensions
    func registerCollectionCell() {
        let cell = UINib(nibName: "SocialCell", bundle: nil)
        let header = UINib(nibName: "SocialHeader", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier:cellID)
        collectionView.register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
    }
}
extension SocialViewController {
    func setupNavigationBar() {
        navigationItem.title = "Social Page"
        navigationItem.setLeftBarButton(buttonSlideBar, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}
extension SocialViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        usersname.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SocialCell
        cell.testLabel.text = usersname[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! SocialHeader
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}



