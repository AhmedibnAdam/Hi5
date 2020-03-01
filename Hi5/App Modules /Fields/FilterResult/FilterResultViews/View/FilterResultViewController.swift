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
    var dayName: [String] = []
    var dayMonth: [String] = []
    

    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - View Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        registerCalenderCollectionCell()
        collectionView.delegate = self
        collectionView.dataSource = self
        registerTableViewcell()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getDayName()
        
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
    func getDayName() {
        let date = Date()
        let dateFormatter = DateFormatter()
        for i in 1...14 {
            let currentDate = date.getDate(dayDifference: i)
            dateFormatter.dateFormat = "dd"
            let dateInMonth = dateFormatter.string(from: currentDate - TimeInterval(i))
            self.dayMonth.append(dateInMonth)
            dateFormatter.dateFormat = "EEEE"
            let dayInWeek = dateFormatter.string(from: currentDate - TimeInterval(i))
            self.dayName.append(String(dayInWeek.prefix(3)))
        }
    }
}

//MARK: - TableViewMethods
extension FilterResultViewController: UITableViewDelegate , UITableViewDataSource {
    func registerTableViewcell() {
        let cell = UINib(nibName: "FieldCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "FieldCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FieldCell") as! FieldCell
        return cell
    }
    
}

//MARK: - CollectionViewMethods
extension FilterResultViewController {
    
    func registerCalenderCollectionCell(){
        let cell = UINib(nibName: "CalenderCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "CalenderCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dayName.count
    }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalenderCell", for: indexPath) as! CalenderCell
        let day = dayName[indexPath.row]
        let date = dayMonth[indexPath.row]
        cell.dateLbl.text = date
        cell.nameLbl.text = day
        
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

//MARK: - Extebsion Date
extension Date
{
    var startOfDay: Date
    {
        return Calendar.current.startOfDay(for: self)
    }

    func getDate(dayDifference: Int) -> Date {
        var components = DateComponents()
        components.day = dayDifference
        return Calendar.current.date(byAdding: components, to:startOfDay)!
    }
}
