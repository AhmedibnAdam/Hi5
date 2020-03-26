//
//  SideMenuViewController.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISideMenuViewController: class {
    var router: ISideMenuRouter? { get set }
}

class SideMenuViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    var interactor: ISideMenuInteractor?
    var router: ISideMenuRouter?
    var height = 0.0
    //MARK: - Properties
    var textArr = ["Friends","My Schedule","My bookings","Fields","Wallet","Suggest Field","Settings & Privacy","Notification setting","Help Center","Logout"]
    var imgArr = ["friends","mySchadule","bookings","fields","wallet","suggestFields","settings","notificationSettings","helpCenter","helpCenter"]
    //MARK: - Outlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var fullNamelbl: UILabel!
    @IBOutlet weak var userNamelbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var contentView: UIView!
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        profileImgTapped()
        registerCell()
        configer()
        initView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
          initView()
        let defaults = UserDefaults.standard
        if let data = defaults.object(forKey: "image") as? Data {
            let image = UIImage(data: data)
            self.profileImg.image = image
        }
        let fullName = defaults.string(forKey: "FullName")
        let userName = defaults.string(forKey: "UserName")
        fullNamelbl.text = fullName
        userNamelbl.text = userName
    }
    //MARK: - Actions
    
}
//MARK: - Extensions
extension SideMenuViewController: ISideMenuViewController {
    // do someting...
}

extension SideMenuViewController {
    func initView(){
        
        let device =  UIDevice().model
        
        
        switch device {
        case "iPhone":
            plusHeight()
        case "iPhone 8 Plus":
            smallHeight()
        case "iPhone 8":
            smallHeight()
        case "iPhone 7 Plus":
            smallHeight()
        case "iPhone 7":
           smallHeight()
        case "iPhone 6 Plus":
          smallHeight()
        case "iPhone 6":
            smallHeight()
        case "iPhone X":
            smallHeight()
        case "iPhone XS":
            largeHeight()
        case "iPhone XS Max":
            largeHeight()
        case "iPhone XR":
            largeHeight()
        case "iPhone 11":
            largeHeight()
        case "iPhone 11 Pro":
            largeHeight()
        case "iPhone 11 Pro Max":
            largeHeight()
        default:
            plusHeight()
        }
        
        // self.tableView.frame.size.height = CGFloat(height)
    }
    
    func smallHeight(){
        height = 540.0
        self.tableView.frame.size.height = CGFloat(height)
        tableHeight.constant = CGFloat(height)
    }
    func plusHeight(){
        height = 540.0 + 50
        self.tableView.frame.size.height = CGFloat(height)
        tableHeight.constant = CGFloat(height)
    }
    func largeHeight(){
        height = 540.0 + 130
        self.tableView.frame.size.height = CGFloat(height)
        tableHeight.constant = CGFloat(height)
    }
    
    func registerCell() {
        let cell = UINib(nibName: "MenuCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "MenuCell")
    }
    
    func profileImgTapped() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(tapGestureRecognizer:)))
        profileImg.isUserInteractionEnabled = true
        profileImg.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTapGesture(tapGestureRecognizer: UITapGestureRecognizer) {
        router?.navigatetoProfile()
    }
    
    func configer(){
        router = SideMenuRouter(view: self)
    }
}

//MARK: - Table view delegate and data source
extension SideMenuViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArr.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let text = textArr[indexPath.row]
        let image = imgArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        cell.lbl.text = text
        cell.img.image = UIImage(named: image)
        cell.selectionStyle = .none
        if(indexPath.row == 0 || indexPath.row == 3){
            cell.plusBtn.isHidden = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            print("Friends")
        } else if(indexPath.row == 1){
            print("My Schedule..")
            router?.navigateToSechadule()
        } else if(indexPath.row == 2){
            router?.navigateToMyBookings()
        } else if(indexPath.row == 3){
            router?.navigateToFields()
        } else if(indexPath.row == 4){
            print("wallet...")
        } else if(indexPath.row == 5){
            print("Suggest Field...")
            router?.navigateToSuggestedField()
        } else if(indexPath.row == 6){
            print("Setting....")
        } else if(indexPath.row == 7){
            print("Notificatio Setting....")
        } else if(indexPath.row == 8){
            print("Help center.....")
        } else if(indexPath.row == 9){
            print("logout......")
            let defaults = UserDefaults.standard
            let dictionary = defaults.dictionaryRepresentation()
            dictionary.keys.forEach { key in
                defaults.removeObject(forKey: key)
            }
            router?.navigateToLogin()
        }
    }
}

extension UITableView {
    
    public func reloadData(_ completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion:{ _ in
            completion()
        })
    }
    
    func scroll(to: scrollsTo, animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
            let numberOfSections = self.numberOfSections
            let numberOfRows = self.numberOfRows(inSection: numberOfSections-1)
            switch to{
            case .top:
                if numberOfRows > 0 {
                    let indexPath = IndexPath(row: 0, section: 0)
                    self.scrollToRow(at: indexPath, at: .top, animated: animated)
                }
                break
            case .bottom:
                if numberOfRows > 0 {
                    let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
                    self.scrollToRow(at: indexPath, at: .bottom, animated: animated)
                }
                break
            }
        }
    }
    
    enum scrollsTo {
        case top,bottom
    }
}
