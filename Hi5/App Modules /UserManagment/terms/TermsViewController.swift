//
//  TermsViewController.swift
//  Hi5
//
//  Created by Adam on 7/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit
import WebKit

protocol ITermsViewController: class {
	var router: ITermsRouter? { get set }
}

class TermsViewController: UIViewController {
	var interactor: ITermsInteractor?
	var router: ITermsRouter?

    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtntapped))
    }()
    
    @objc func backBtntapped() {
        self.dismiss()
    }
    
    
    var url: String?
    override func viewDidLoad() {
        super.viewDidLoad()
         setupNavigationBar()
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.view.addSubview(webView)
        guard let link = url  else {
            return
        }
        guard  let url = URL(string: link)else {
            return
        }
        webView.load(URLRequest(url: url))
    
    }
}

extension TermsViewController: ITermsViewController {
	// do someting...
}

extension TermsViewController {
	    func setupNavigationBar() {
        navigationItem.title = "Terms and Conditions"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}

extension TermsViewController {
	// do someting...
}
