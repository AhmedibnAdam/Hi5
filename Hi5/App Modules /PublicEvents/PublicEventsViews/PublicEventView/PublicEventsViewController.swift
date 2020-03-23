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
import ImageSlideshow


protocol IPublicEventsViewController: class {
    var router: IPublicEventsRouter? { get set }
    func showAlert(title: String, msg: String)
    func showFilteresPublicEvent(response: PublicEventsModel.PublicEventResponse)
}

class PublicEventsViewController: UIViewController {
    
    
    //MARK:- Variables
     let today = Date()
    
    let cellAID = "cellAID"
    let cellBID = "cellBID"
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
    var dayIsSelected = Array(repeating: false, count: 14)
    var sliderLableP = UILabel()

    
    let localSource = [BundleImageSource(imageString: "ballinpitch"), BundleImageSource(imageString: "field"), BundleImageSource(imageString: "stadium"), BundleImageSource(imageString: "nofavouritefields")]
   
//    let alamofireSource = [AlamofireSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    
//    let kingfisherSource = [KingfisherSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, KingfisherSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, KingfisherSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]


    
    var interactor: IPublicEventsInteractor?
    var router: IPublicEventsRouter?
    
    //MARK:-OUTLETS
    
    @IBOutlet weak var slideshow: UIView!
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
        setUP()
        
        setUpUI()
        configure()
    }
    override func viewWillAppear(_ animated: Bool){
       getFilteredPublicEvent()
    }
    
    var slider = ImageSlideshow()
    func setUP(){
        slider.slideshowInterval = 5.0
        slider.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slider.contentScaleMode = UIViewContentMode.scaleAspectFill
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        pageControl.pageIndicatorTintColor = UIColor.black
        slider.pageIndicator = pageControl
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slider.activityIndicator = DefaultActivityIndicator()
        slider.delegate = self
        
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        slider.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTap))
        slider.addGestureRecognizer(recognizer)
        self.slideshow.addSubview(slider)
    }

        @objc func didTap() {
            let fullScreenController = slider.presentFullScreenController(from: self)
            // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
            fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
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
        let cellB = UINib(nibName: "dateCell", bundle: nil)
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
    func handleDaySelection(cell: dateCell, indexPath:IndexPath) {
        month.text = self.monthes[indexPath.row]
        year.text = self.years[indexPath.row]
        if dayIsSelected[indexPath.row] {
            dayIsSelected[indexPath.row] = false
            cell.containerView.isHidden = dayIsSelected[indexPath.row]
            cell.dayLabel.font = UIFont.boldSystemFont(ofSize: 16)
            cell.weekDayLabel.font = UIFont.boldSystemFont(ofSize: 10)
            cell.weekDayLabel.textColor = .orange
            cell.dayLabel.textColor = .orange
        }else {
            dayIsSelected[indexPath.row] = true
            cell.containerView.isHidden = dayIsSelected[indexPath.row]
            cell.dayLabel.font = UIFont.systemFont(ofSize: 10)
            cell.weekDayLabel.font = UIFont.systemFont(ofSize: 10)
            cell.weekDayLabel.textColor = .black
            cell.dayLabel.textColor = .black
        }
    }
    
}
extension PublicEventsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainCollectionView {
            return self.filteredPublicEventData?.publicEvents.count ?? 0
        }else {
            return 14
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
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: cellBID, for: indexPath) as! dateCell
            cellB.backgroundColor = .red
            cellB.weekDay = weekDays[indexPath.row]
            cellB.Day = daysArray[indexPath.row]
            
            return cellB
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainCollectionView {
            return CGSize(width: view.frame.width, height: 280)
        }else {
            return CGSize(width:50,height: 100)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == subCollectionView {
            let cellB = subCollectionView.cellForItem(at: indexPath) as! dateCell
            
            handleDaySelection(cell: cellB,indexPath: indexPath)
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
extension PublicEventsViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}
