//
//  SessionResultViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/4/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISessionResultViewController: class {
	var router: ISessionResultRouter? { get set }
    func showAlert(title: String, msg: String)
    func hideIndicator()
    func showTableView()
    func hideTableView()
}

class SessionResultViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    //MARK: - Properties
	var interactor: ISessionResultInteractor?
	var router: ISessionResultRouter?
    var dayName: [String] = []
    var dayMonth: [String] = []
    var parameter: [String: Any] = [:]
    var selectedDay: String?
    
    //MARK: - Outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - ViewLifeCycle
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
        let date = Date()
        let dateFormatter = DateFormatter()
        let selectDay = date.getDate(dayDifference: 0)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        selectedDay = dateFormatter.string(from: selectDay)
        if let currentDay = selectedDay {
            parameter["date"] = currentDay
            showIndicator()
                //interactor?.filterSession(view: self, parameter: parameter)
        }
    }
    
    func showIndicator() {
        indicator.isHidden = false
    }

}
//MARK: - Extensions
extension SessionResultViewController: ISessionResultViewController {
      func showAlert(title: String, msg: String) {
        ShowAlertView.showAlert(title: title, msg: msg, sender: self)
      }
      func hideIndicator() {
        indicator.isHidden = true
      }
      func showTableView() {
          self.tableView.isHidden = false
      }
      func hideTableView() {
          self.tableView.isHidden = true
      }
}

extension SessionResultViewController: UITableViewDelegate , UITableViewDataSource {
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
extension SessionResultViewController {
    func registerCalenderCollectionCell(){
            let cell = UINib(nibName: "CalenderCell", bundle: nil)
            collectionView.register(cell, forCellWithReuseIdentifier: "CalenderCell")
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
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
            let date = Date()
            let dateFormatter = DateFormatter()
            let selectDay = date.getDate(dayDifference: indexPath.row)
            dateFormatter.dateFormat = "yyyy-MM-dd"
            selectedDay = dateFormatter.string(from: selectDay)
            if let currentDay = selectedDay {
                parameter["date"] = currentDay
                    showIndicator()
                    //interactor?.filterSession(view: self, parameter: parameter)
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            let cell = collectionView.cellForItem(at: indexPath) as? CalenderCell
            cell?.isSelected = false

       }
}

extension SessionResultViewController {
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
