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
    func showAlert(title: String, msg: String)
    func hideIndicator()
    func showResponse(response: FilterResultModel.FilterSessionResponse)
    func showTableView()
    func hideTableView()
    func showNoFields()
    func removeNoFields()
}

class FilterResultViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
   
    var interactor: IFilterResultInteractor?
    var router: IFilterResultRouter?
    var dayName: [String] = []
    var dayMonth: [String] = []
    var parameter: [String: Any] = [:]
    var type: String?
    var selectedDay: String?
    var fields = [FilterResultModel.FilterField]()
    
    //MARK: - Outlets
    @IBOutlet weak var noFieldsLbl: UILabel!
    @IBOutlet weak var noFieldsImg: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var PlayGroundtitle: UILabel!
    
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
        let date = Date()
                let dateFormatter = DateFormatter()
                let selectDay = date.getDate(dayDifference: 0)
                dateFormatter.dateFormat = "yyyy-MM-dd"
        selectedDay = dateFormatter.string(from: selectDay)

        getSessionsData()
        
    }
    
    func getSessionsData(){
       
         if selectedDay != nil {
             parameter["date"] = selectedDay
             showIndicator()
             removeNoFields()
             if type == "filter"{
                PlayGroundtitle.text =  parameter["name"] as? String
                  interactor?.filterSession(view: self, parameter: parameter)
             }
             else{
                 parameter["date"] = selectedDay
                 PlayGroundtitle.text =  parameter["name"] as? String
                  interactor?.chechAvalabilty(view: self, parameter: parameter)
             }
         }
    }
    
    func showIndicator() {
        indicator.isHidden = false
    }
    //MARK: - Actions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        router?.navigateToFilter(params: parameter)
    }
}

//MARK: - Extensions
extension FilterResultViewController: IFilterResultViewController {
    func showNoFields() {
        noFieldsImg.isHidden = false
        noFieldsLbl.isHidden = false
    }
    
    func removeNoFields() {
        noFieldsImg.isHidden = true
        noFieldsLbl.isHidden = true
    }
    
    func showResponse(response: FilterResultModel.FilterSessionResponse) {
        guard let field = response.fields else {return}
        self.fields = field
        if field.count == 0 {
          self.tableView.isHidden = true
        }
        else{
           self.tableView.isHidden = false
        }
        self.tableView.reloadData()
    }
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
        return fields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let field = fields[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FieldCell") as! FieldCell
        cell.distance.text = field.distance ?? "--" + "km"
        cell.fieldNameLbl.text = field.name
        cell.partnerName.text = field.partnerName
        if field.visibility == "public"{
            cell.visability.isHidden = true
        }
        else if field.visibility == "only members" || field.visibility == "only members "{
            cell.visability.isHidden = false

        }
        cell.fieldLocationLbl.text = field.address
        cell.date.text = field.date
        cell.endTime.text = field.endTime
        cell.starttime.text = field.startTime
        cell.cost.text = "\(String(describing: field.newPrice!))"
        cell.pastCost.text = "\(field.oldPrice!)"
//        cell.sportTypeLbl.text = field.sport
//        cell.genderLbl.text = field.gender
        cell.bestForLbl.text = field.bestFor
        cell.paymentLbl.text = field.payment
        if field.oldPrice == field.newPrice {
            cell.before.isHidden = true
            cell.pastCost.isHidden = true

            cell.beforeCenterView.isHidden = true
            cell.currancy.isHidden = true
        }
        else {
            cell.before.isHidden = false
            cell.pastCost.isHidden = false

            cell.beforeCenterView.isHidden = false
            cell.currancy.isHidden = false
        }
        if let cost = field.newPrice {
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let field = fields[indexPath.row]
        router?.navigateTosessionDetails(param: self.parameter, id: field.id!, payment: field.payment!, sessionId: field.sessionID!)
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
        getSessionsData()
  
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CalenderCell
        cell?.isSelected = false

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
