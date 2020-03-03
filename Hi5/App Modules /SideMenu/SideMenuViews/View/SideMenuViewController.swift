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
   //MARK: - Properties
   var textArr = ["Friends","My Schedule","My bookings","Fields","Wallet","Suggest Field","Settings & Privacy","Notification setting","Help Center"]
   var imgArr = ["friends","mySchadule","bookings","fields","wallet","suggestFields","settings","notificationSettings","helpCenter"]
    var imageCashe = [String:UIImage]()
    var lastURLUsedToLoadImage:String?
    var userImage:UIImage? {
        didSet{
            profileImg.image = userImage
        }
    }
   //MARK: - Outlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var fullNamelbl: UILabel!
    @IBOutlet weak var userNamelbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
   //MARK: - ViewLifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        profileImgTapped()
        registerCell()
        configer()
    }
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        if let data = defaults.object(forKey: "image") as? Data{
            let image = UIImage(data: data)
            self.profileImg.image = image
        }
        if let imageURL = defaults.object(forKey: "image") as? String {
            loadImage(urlString: imageURL)
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
    func loadImage(urlString:String) {
            if let cachedImage = imageCashe[urlString] {
                userImage? = cachedImage
        }
            lastURLUsedToLoadImage = urlString
       
            guard let url = URL(string: urlString) else {return}
                  URLSession.shared.dataTask(with: url) { (data, response, err) in
                      if let err = err {
                          print("Failed to fetch post image",err.localizedDescription)
                          return
                      }
                      if url.absoluteString != self.lastURLUsedToLoadImage {
                          return
                      }
                      guard let imageData = data else {return}
                    guard let photoImage = UIImage(data: imageData) else {return}
                    self.imageCashe[url.absoluteString] = photoImage
                      DispatchQueue.main.async {
                        self.userImage = photoImage
                      }
                      }.resume()
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
        } else if(indexPath.row == 2){
            print("My booking...")
        } else if(indexPath.row == 3){
            router?.navigateToFields()
        } else if(indexPath.row == 4){
            print("wallet...")
        } else if(indexPath.row == 5){
            print("Suggest Field...")
        } else if(indexPath.row == 6){
            print("Setting....")
        } else if(indexPath.row == 7){
            print("Notificatio Setting....")
        } else if(indexPath.row == 8){
            print("Help center.....")
        }
    }
}
