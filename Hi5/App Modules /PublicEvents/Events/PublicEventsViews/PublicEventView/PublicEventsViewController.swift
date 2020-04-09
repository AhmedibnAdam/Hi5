//
//  PublicEventsViewController.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
import Kingfisher


protocol IPublicEventsViewController: class {
    var router: IPublicEventsRouter? { get set }
    func showAlert(title: String, msg: String)
    func showFilteresPublicEvent(response: PublicEventsModel.PublicEventResponse)
}

class PublicEventsViewController: UIViewController {
    
    
    //MARK:- Variables
     let today = Date()
    
    let cellAID = "cellAID"
    let cellBID = "CalenderCell"
    let headerID = "headerID"
    let maxHeaderHeight: CGFloat = 300
    let minHeaderHeight: CGFloat = 82
    var previousScrollOffset: CGFloat = 0
    var previousScrollViewHeight: CGFloat = 0
    var filteredPublicEventData: PublicEventsModel.PublicEventResponse?
     var delegate: PublicEventControllerDelegate?
    var weekDays:[String] = []
    var daysArray:[String] = []
    var monthes:[String] = []
    var years:[String] = []
    var dayName: [String] = []
    var dayMonth: [String] = []
    var dayIsSelected = Array(repeating: false, count: 14)
    var sliderLableP = UILabel()
     var selectedDay: String?



    
    var interactor: IPublicEventsInteractor?
    var router: IPublicEventsRouter?
    
    //MARK:-OUTLETS
    
    @IBOutlet weak var slider: SliderView!
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var subCollectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var year: UILabel!
    lazy var buttonSlideBar: UIBarButtonItem = {
          return UIBarButtonItem(image: UIImage(named: "menu"), style: .done, target: self, action: #selector(sideMenu))
      }()
    
    //MARK:-viewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        setUpUI()
        configure()
 
    }
    override func viewWillAppear(_ animated: Bool){
       getFilteredPublicEvent()
          setUP()
    }
    
    func setUP(){
     let images = ["ballinpitch", "ballinpitch", "ballinpitch", "ballinpitch"]
       let imagesList = images.map{UIImage(named: $0)!}
       
       slider.list = imagesList
//        self.slider.addSubview(sliderView)
        getDayName()
              let date = Date()
              let dateFormatter = DateFormatter()
              let selectDay = date.getDate(dayDifference: 0)
              dateFormatter.dateFormat = "yyyy-MM-dd"
              selectedDay = dateFormatter.string(from: selectDay)
              if let currentDay = selectedDay {
//                  parameter["date"] = "2020-03-05"//currentDay
//                  showIndicator()
//                  removeNoFields()
//                      interactor?.filterSession(view: self, parameter: parameter)
              }
    }
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

    
        //MARK:- setUp UI
    func setUpUI(){
        getToday()
        get15DayaAfter()
        setupNavigationBar()
        registerCollectionCell()
        navigationItem.rightBarButtonItem?.image = UIImage(named: "notification", in: nil, with: nil)
//        imageView.layer.cornerRadius = 5
    }
    
    //MARK:- Configure
    
    func configure(){
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        subCollectionView.delegate = self
        subCollectionView.dataSource = self
        mainCollectionView.showsVerticalScrollIndicator = false
        subCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func getFilteredPublicEvent(){
//        var vc = self
//        vc = PublicEventsConfiguration.setup() as! PublicEventsViewController
        let params = ["date":"2020-03-06",  // EX "2020-03-06"
                      "latitude": "29.962696",
                      "longitude": "31.276941"
        ]
        self.interactor?.parameters = params
        self.interactor?.filterPublicEvent(view: self)
    }
    
    func getToday(){
        let cal = NSCalendar.current
        // start with today
        let date = cal.startOfDay(for: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        let dateString = dateFormatter.string(from: date)
        var splitString = dateString.split(separator: ",").map(String.init)
        weekDays.append(splitString[0])
        splitString = dateString.split(separator: " ").map(String.init)
        daysArray.append(splitString[1])
        month.text = splitString[2]
        year.text = splitString[3]
    }
   func get15DayaAfter(){
        let upcomming15Days = Date.getDates(forLastNDays: 15)
           print(upcomming15Days)
        for days in upcomming15Days {
            var splitString = days.split(separator: ",").map(String.init)
            weekDays.append(splitString[0])
            splitString = days.split(separator: " ").map(String.init)
            daysArray.append(splitString[1])
             monthes.append(splitString[2])
             years.append(splitString[3])
        }
    }
}
//MARK:-Extensions
extension PublicEventsViewController: IPublicEventsViewController {
    
    func setupNavigationBar() {
        navigationItem.title = "Public Events"
        navigationItem.setLeftBarButton(buttonSlideBar, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    @objc func sideMenu() {
        delegate?.handleMenuToggle()
    }
    func showAlert(title: String, msg: String) {
        ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    
    func showFilteresPublicEvent(response: PublicEventsModel.PublicEventResponse) {
        print(response)
        self.filteredPublicEventData = response
        
        if let image = self.filteredPublicEventData?.publicEvents[0].fieldImage {
            let url = URL(string: image)
//            self.imageView.kf.setImage(with: url)

        }
        self.mainCollectionView.reloadData()
    }
}


extension Date {
    static func getDates(forLastNDays nDays: Int) -> [String] {
        let cal = NSCalendar.current
        // start with today
        var date = cal.startOfDay(for: Date())
        
        var arrDates = [String]()
        
        for _ in 1 ... nDays {
            // move back in time by one day:
            date = cal.date(byAdding: Calendar.Component.day, value: 1, to: date)!
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
            let dateString = dateFormatter.string(from: date)
            arrDates.append(dateString)
        }
        print(arrDates)
        return arrDates
    }
}


extension PublicEventsViewController {
    // do someting...
    func registerCollectionCell() {
        let cellA = UINib(nibName: "publicEventsCell", bundle: nil)
        let cellB = UINib(nibName: "CalenderCell", bundle: nil)
        mainCollectionView.register(cellA, forCellWithReuseIdentifier: cellAID)
        subCollectionView.register(cellB, forCellWithReuseIdentifier: cellBID)
    }
    func canAnimateHeader(_ scrollView:UIScrollView) -> Bool {
        let scrollViewMaxHeight = scrollView.frame.height + self.headerViewHeight.constant - minHeaderHeight
        return scrollView.contentSize.height > scrollViewMaxHeight
    }
    func setScrollPosition() {
        self.mainCollectionView.contentOffset = CGPoint(x:1, y: 1)
        // there is something went unexplainable here, when do we I change the x and y to 0 the scroll became a little intermittent
    }
//    func handleDaySelection(cell: dateCell, indexPath:IndexPath) {
//        month.text = self.monthes[indexPath.row]
//        year.text = self.years[indexPath.row]
//        if dayIsSelected[indexPath.row] {
//            dayIsSelected[indexPath.row] = false
//            cell.containerView.isHidden = dayIsSelected[indexPath.row]
//            cell.dayLabel.font = UIFont.boldSystemFont(ofSize: 16)
//            cell.weekDayLabel.font = UIFont.boldSystemFont(ofSize: 10)
//            cell.weekDayLabel.textColor = .orange
//            cell.dayLabel.textColor = .orange
//        }else {
//            dayIsSelected[indexPath.row] = true
//            cell.containerView.isHidden = dayIsSelected[indexPath.row]
//            cell.dayLabel.font = UIFont.systemFont(ofSize: 10)
//            cell.weekDayLabel.font = UIFont.systemFont(ofSize: 10)
//            cell.weekDayLabel.textColor = .white
//            cell.dayLabel.textColor = .white
//        }
//    }
    
}
extension PublicEventsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainCollectionView {
            return self.filteredPublicEventData?.publicEvents.count ?? 0
        }else {
            return dayName.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainCollectionView {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: cellAID, for: indexPath) as! publicEventsCell
            let cellData = self.filteredPublicEventData?.publicEvents[indexPath.row]
            cellA.filteredPublicEventData = cellData
            cellA.showData()
                
            return cellA
        }else {
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
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainCollectionView {
            return CGSize(width: view.frame.width, height: 280)
        }else {
            let width = collectionView.frame.width / 7
                       let height = collectionView.frame.height
                       return CGSize(width: width, height: height)        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == subCollectionView {
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
//               if let currentDay = selectedDay {
//                   parameter["date"] = currentDay
//                       showIndicator()
//                       removeNoFields()
//                       interactor?.filterSession(view: self, parameter: parameter)
//               
//            }
            //            handleDaySelection(cell: cellB,indexPath: indexPath)
        }
        else{
            let cellData = self.filteredPublicEventData?.publicEvents
            let id = cellData?[indexPath.row].id
            router?.navugateToDetails(event_id: id ?? "0")
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == subCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as? CalenderCell
             cell?.isSelected = false
        }
    }
 
}
extension PublicEventsViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollDiff = (scrollView.contentOffset.y - previousScrollOffset)
        let isScrollingDown = scrollDiff > 0
        let isScrollingUp = scrollDiff < 0
        if canAnimateHeader(scrollView) {
            var newHeight = headerViewHeight.constant
            if isScrollingDown {
                newHeight = max(minHeaderHeight, headerViewHeight.constant - abs(scrollDiff))
            } else if isScrollingUp {
                newHeight = min(maxHeaderHeight, headerViewHeight.constant + abs(scrollDiff))
            }
            if newHeight != headerViewHeight.constant {
                headerViewHeight.constant = newHeight
                setScrollPosition()
                previousScrollOffset = scrollView.contentOffset.y
            }
        }
    }
}

