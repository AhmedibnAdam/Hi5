//
//  FilterResultViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/26/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFilterResultViewController: class {
	var router: IFilterResultRouter? { get set }
}

class FilterResultViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
   
	var interactor: IFilterResultInteractor?
	var router: IFilterResultRouter?
    //var isSelected = false
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK: - View Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        registerCalenderCollectionCell()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    //MARK: - Actions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        router?.navigateToFilter()
    }
}

//MARK: - Extensions
extension FilterResultViewController: IFilterResultViewController {

}

extension FilterResultViewController {
    
	
}

//MARK: - CollectionViewMethods
extension FilterResultViewController {
    
    func registerCalenderCollectionCell(){
        let cell = UINib(nibName: "CalenderCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "CalenderCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 15
    }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalenderCell", for: indexPath) as! CalenderCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width / 7
            let height = collectionView.frame.height
            return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CalenderCell
        cell.isSelected = true

    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CalenderCell
        cell.isSelected = false

    }
}
