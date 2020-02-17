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
    
   //MARK: - Outlets
    @IBOutlet weak var profileImgBtn: UIButton!
    @IBOutlet weak var fullNamelbl: UILabel!
    @IBOutlet weak var userNamelbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
   //MARK: - ViewLifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
		initView()
        configer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        if let data = defaults.object(forKey: "image") as? Data {
            let image = UIImage(data: data)
            self.profileImgBtn.setImage(image, for: .normal)
        }
        let fullName = defaults.string(forKey: "FullName")
        let userName = defaults.string(forKey: "UserName")
        fullNamelbl.text = fullName
        userNamelbl.text = userName
    }
    //MARK: - Actions
    @IBAction func profileImgBtnTapped(_ sender: UIButton) {
        router?.navigatetoProfile()
    }
}
  //MARK: - Extensions
extension SideMenuViewController: ISideMenuViewController {
	// do someting...
}

extension SideMenuViewController {
    func initView(){
        // MARK : - view raduis
        self.profileImgBtn = CreateCornerRauis.ButtonRaduis(button: self.profileImgBtn, number: (self.profileImgBtn.frame.size.width / 2))
    }
    
    func registerCell() {
        let cell = UINib(nibName: "MenuCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "MenuCell")
    }
    
    func configer(){
        router = SideMenuRouter(view: self)
    }
}

extension SideMenuViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        return cell
    }
}
