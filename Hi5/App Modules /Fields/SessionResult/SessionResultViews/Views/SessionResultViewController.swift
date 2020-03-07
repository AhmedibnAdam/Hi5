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
    func addNoFields()
    func removeNoFields()
    func showResponse(response: SessionResultModel.SessionResultResponse)
}

class SessionResultViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    //MARK: - Properties
	var interactor: ISessionResultInteractor?
	var router: ISessionResultRouter?
    var dayName: [String] = []
    var dayMonth: [String] = []
    var parameter: [String: Any] = [:]
    var selectedDay: String?
    var fieldId: Int?
    var fieldName: String?
    var fields = [SessionResultModel.Field]()
    
    //MARK: - Outlets
    @IBOutlet weak var noFieldsLbl: UILabel!
    @IBOutlet weak var noFieldsImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - ViewLifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = fieldName
        registerCalenderCollectionCell()
        collectionView.delegate = self
        collectionView.dataSource = self
        registerTableViewcell()
        tableView.delegate = self
        tableView.dataSource = self
     }
    
    override func viewWillAppear(_ animated: Bool) {
        print(fieldId)
        getDayName()
        let date = Date()
        let dateFormatter = DateFormatter()
        let selectDay = date.getDate(dayDifference: 0)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        selectedDay = dateFormatter.string(from: selectDay)
        if let currentDay = selectedDay {
            parameter["date"] = currentDay
            showIndicator()
            interactor?.checkAvailability(view: self, fieldId: fieldId ?? 9, date: currentDay)
        }
    }
    
    func showIndicator() {
        indicator.isHidden = false
    }
    
    //MARK: - Actions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss()
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
      func addNoFields() {
          noFieldsImg.isHidden = false
          noFieldsLbl.isHidden = false
      }
      
      func removeNoFields() {
          noFieldsImg.isHidden = true
          noFieldsLbl.isHidden = true
      }
      
      func showResponse(response: SessionResultModel.SessionResultResponse) {
          guard let field = response.fields else {return}
          self.fields = field
          self.tableView.reloadData()
      }
}

extension SessionResultViewController: UITableViewDelegate , UITableViewDataSource {
	func registerTableViewcell() {
        let cell = UINib(nibName: "FieldCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "FieldCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let field = fields[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FieldCell") as! FieldCell
        cell.fieldNameLbl.text = field.name
        //cell.costLbl.text = "$\(String(describing: field.cost))"
        cell.partnerNamelbl.text = field.partnerName
        cell.timeLbl.text = field.time
        cell.dateLbl.text = field.date
        cell.fieldLocationLbl.text = field.address
        cell.sportTypeLbl.text = field.sport
        cell.genderLbl.text = field.gender
        cell.bestForLbl.text = field.bestFor
        cell.paymentLbl.text = field.payment
        if let cost = field.cost {
            cell.costLbl.text = "$\(String(describing: cost))"
        }
        if let partnerImg = field.partnerImage {
            let url = URL(string: partnerImg)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url!) {
                    DispatchQueue.main.async {
                        cell.partnerImg.image = UIImage(data: data)
                    }
                }
            }
        }
        
        if let image = field.image {
            let url = URL(string: image)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url!){
                    DispatchQueue.main.async {
                        cell.fieldImg.image = UIImage(data: data)
                    }
                }
            }
        }
        
        
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
            return dayName.count
        }
           
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalenderCell", for: indexPath) as! CalenderCell
            let day = dayName[indexPath.row]
            let date = dayMonth[indexPath.row]
            cell.dateLbl.text = date
            cell.nameLbl.text = day
            if (indexPath.row == 0){
                cell.containerView.backgroundColor = .white
                cell.nameLbl.textColor = .orange
                cell.dateLbl.textColor = .orange
            }
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                let width = collectionView.frame.width / 7
                let height = collectionView.frame.height
                return CGSize(width: width, height: height)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let index = IndexPath(item: 0, section: 0)
            let firstCell = collectionView.cellForItem(at: index) as? CalenderCell
            firstCell?.containerView.backgroundColor = .clear
            firstCell?.nameLbl.textColor = .white
            firstCell?.dateLbl.textColor = .white
            
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
                    interactor?.checkAvailability(view: self, fieldId: fieldId ?? 9, date: currentDay)
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

