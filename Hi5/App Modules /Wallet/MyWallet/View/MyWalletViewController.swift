//
//  MyWalletViewController.swift
//  Hi5
//
//  Created by Adam on 4/17/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.


import UIKit

protocol IMyWalletViewController: class {
    var router: IMyWalletRouter? { get set }
    func showWalletResponse(response: MyWalletModel.Wallet)
    func showErrorAlert(title: String, msg: String)
}

class MyWalletViewController: UIViewController {
    var interactor: IMyWalletInteractor?
    var router: IMyWalletRouter?
    
    var wallet: MyWalletModel.Wallet?
    lazy var backBtn: UIBarButtonItem = {
           return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtnTapped))
       }()
       
    var sectionTitle = ""
    var dates: [String] = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var avalableBalance: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableCell()
        setupNavigationBar()
        centerView.dropShadow(color: .lightGray, opacity: 0.9, offSet: CGSize(width: 1.0, height: 1.0), radius:
     
        3.0, scale: false)
    }
    override func viewWillAppear(_ animated: Bool) {
        interactor?.showWallet(view: self)
    }
}

extension MyWalletViewController: IMyWalletViewController {
       func showWalletResponse(response: MyWalletModel.Wallet) {
        wallet = response
        
        for date in wallet?.data?.transactions ?? [] {
            dates.append(date.date!)
        }
        let unique = Array(Set(dates))
               dates = unique
        total.text = "\(response.data?.meta?.totalRefund ?? 0 )$"
        tableView.reloadData()
         }
         
         func showErrorAlert(title: String, msg: String) {
             
         }
}

extension MyWalletViewController : UITableViewDelegate , UITableViewDataSource {
    func registerTableCell() {
        let cell = UINib(nibName: "WalletTransActionsTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "WalletTransActionsTableViewCell")
        self.tableView.register(MyHeaderView.self,
        forHeaderFooterViewReuseIdentifier: "header")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dates.count
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(
        withIdentifier: "header")
        let title = dates[section]
               view?.textLabel?.isHidden = false
               view?.textLabel?.text = title
        return view
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  wallet?.data?.transactions?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WalletTransActionsTableViewCell") as! WalletTransActionsTableViewCell
        let transaction = wallet?.data?.transactions?[indexPath.row]
        var sign = "+"
        if transaction?.transactionType == "refund"{
            sign = "+"
        }
        else {
            sign = "-"
        }
        let d = dates[indexPath.section]
        
            cell.cost.text = sign +  "\(String(describing: transaction?.refund ?? 0))$ "
            cell.date.text = transaction?.time
            cell.from.text =  "\(transaction?.transactionType ?? "")  " + (transaction?.type ?? "" )
            if let requrst = transaction?.id {
                cell.request.text = "\(transaction?.type ?? "") #\(requrst)"
            }
        if transaction?.date != d {
            cell.isHidden = true
        }
        
    
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let d = dates[indexPath.section]
        let transaction = wallet?.data?.transactions?[indexPath.row]
        if transaction?.date != d {
                   return 0
               }
        return 70
    }
}

extension MyWalletViewController {
       func setupNavigationBar() {
         navigationItem.title = "Wallet"
        let image = UIImage(named: "loginBackground")
        navigationController?.navigationBar.setBackgroundImage(image,
                                                               for: .default)
         navigationItem.setLeftBarButton(backBtn, animated: true)
         navigationItem.leftBarButtonItem?.tintColor = .white
         let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
         navigationController?.navigationBar.titleTextAttributes = textAttributes
     }
    @objc func backBtnTapped() {
         router?.navigateToTabBar()
     }
}
class MyHeaderView : UITableViewHeaderFooterView {
      @IBOutlet weak var lab : UILabel!
}
