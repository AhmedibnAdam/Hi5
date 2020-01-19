//
//  SocialViewController.swift
//  Hi5
//
//  Created by Adam on 12/23/19.
//  Copyright (c) 2019 Fudex. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
//import SideMenuSwift
import SideMenu

protocol ISocialViewController: class {
	var router: ISocialRouter? { get set }
}

class SocialViewController: UIViewController {
	var interactor: ISocialInteractor?
	var router: ISocialRouter?


    
      @IBOutlet var contentView: UIView!
      override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view, typically from a nib.
        router = SocialRouter(view: self)
        self.modalPresentationStyle = .fullScreen

      }
      override func viewWillAppear(_ animated: Bool) {
         
          
      }
  
    
    @IBAction func showSideMenu(_ sender: UIButton) {
        router?.naveigateToSideMenu()
    }
    
    
}

extension SocialViewController: ISocialViewController {
	// do someting...
}

extension SocialViewController {
	// do someting...
}

extension SocialViewController : UITableViewDataSource , UITableViewDelegate {

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "frindsCell", for: indexPath)
        return cell
    }
    
    
}
