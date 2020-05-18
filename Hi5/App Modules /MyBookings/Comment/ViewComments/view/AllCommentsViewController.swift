//
//  AllCommentsViewController.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
import Cosmos
import Kingfisher

protocol IAllCommentsViewController: class {
	var router: IAllCommentsRouter? { get set }
    func showWalletResponse(response: AllCommentsModel.Comments)
    func showErrorAlert(title: String, msg: String)
}

class AllCommentsViewController: UIViewController {
	var interactor: IAllCommentsInteractor?
	var router: IAllCommentsRouter?
    var fieldID: Int?
    var response: AllCommentsModel.Comments?
    
    @IBOutlet weak var rarerCount: UILabel!
    @IBOutlet weak var rateView: CosmosView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalRate: UILabel!
    @IBOutlet weak var rate5: NSLayoutConstraint!
    @IBOutlet weak var rate4: NSLayoutConstraint!
    @IBOutlet weak var rate3: NSLayoutConstraint!
    @IBOutlet weak var rate2: NSLayoutConstraint!
    @IBOutlet weak var rate1: NSLayoutConstraint!

    lazy var backBtn: UIBarButtonItem = {
               return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtntapped))
           }()

       override func viewDidLoad() {
           super.viewDidLoad()
           setupNavigationBar()
           registerTableCell() 
       }
       
    override func viewWillAppear(_ animated: Bool) {
        interactor?.showComment(id: fieldID ?? 0)
    }
         
         @objc func backBtntapped() {
           self.dismiss()
         }
}

extension AllCommentsViewController: IAllCommentsViewController {
    func showWalletResponse(response: AllCommentsModel.Comments) {
        self.response = response
        tableView.reloadData()
        rateView.rating = response.meta?.ratingAvg ?? 1.0
      
        totalRate.text = String(format: "%02d", response.meta?.ratingAvg ?? 1.0)
        rarerCount.text = "(" + "\(response.meta?.totalRateCount ?? 0)" + ")"
        
        for n in response.rates ?? []{
            let width =  ( (n.reviewersCount!) / (response.meta?.totalRateCount ?? 1) )
            switch n.rate {
            case 1:
                
                rate1.constant = CGFloat(width * 200)
            case 2:
                rate2.constant = CGFloat(width * 200)
            case 3:
                rate3.constant = CGFloat(width * 200)
            case 4:
                rate4.constant = CGFloat(width * 200)
            case 5:
                rate5.constant = CGFloat(width * 200)
            default:
                print("default")
            }
        }
    }
    
    func showErrorAlert(title: String, msg: String) {
        ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    
	// do someting...
}

extension AllCommentsViewController {
	func setupNavigationBar() {
        navigationItem.title = "Comment"
        let button = UIButton(type: .system)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 5)
        button.sizeToFit()
        button.tintColor = .black
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}

extension AllCommentsViewController: UITableViewDelegate , UITableViewDataSource {
	    func registerTableCell() {
        let cell = UINib(nibName: "CommentTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "CommentTableViewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  response?.comments?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell") as! CommentTableViewCell
        let comment = response?.comments?[indexPath.row]
        cell.comment.text = comment?.commentDescription
        cell.date.text = comment?.date
        cell.name.setTitle(comment?.player, for: .normal)
        cell.rate.rating = Double(comment?.rate ?? "0.0")!
        
        cell.profileImage.imageView?.kf.setImage(with: URL(string: comment?.playerImage ?? ""))
        return cell
    }
}
