//
//  MyFriendsViewController.swift
//  Hi5
//
//  Created by Adam on 12/31/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyFriendsViewController: class {
	var router: IMyFriendsRouter? { get set }
}

class MyFriendsViewController: UIViewController {
	var interactor: IMyFriendsInteractor?
	var router: IMyFriendsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension MyFriendsViewController: IMyFriendsViewController {
	// do someting...
}

extension MyFriendsViewController {
	// do someting...
}

extension MyFriendsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fieldsCell", for: indexPath)
//            as! FieldTableViewCell
//        cell.options.tag = indexPath.row
//         cell.options.addTarget(self, action: #selector(optionAction(_:)), for: .touchUpInside)
        return cell
    }
    
    

    @objc func optionAction(_ sender: UIButton){
          let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)

             alert.addAction(UIAlertAction(title: "Copy link", style: .default , handler:{ (UIAlertAction)in
                 print("User click Approve button")
             }))

             alert.addAction(UIAlertAction(title: "Send to", style: .default , handler:{ (UIAlertAction)in
                 print("User click Edit button")
             }))

        
          

             alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
                 print("User click Dismiss button")
             }))
          
          self.present(alert, animated: true, completion: {
                 print("completion block")
             })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "details", sender: self)
    }
}

