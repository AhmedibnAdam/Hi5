//
//  FieldOwnerDetailsViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFieldOwnerDetailsViewController: class {
	var router: IFieldOwnerDetailsRouter? { get set }
    func showAlert(title: String, msg: String)
}

class FieldOwnerDetailsViewController: UIViewController {
	var interactor: IFieldOwnerDetailsInteractor?
	var router: IFieldOwnerDetailsRouter?
    var param: [String: Any]?
    var images: [UIImage]?
    //MARK: - Properties
      lazy var backBtn: UIBarButtonItem = {
          return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtnTapped))
      }()
      
      @objc func backBtnTapped() {
        dismiss(animated: true, completion: nil)
      }
    //MARK: - Outlets
    @IBOutlet weak var ownerNameTextField: UITextField!
    @IBOutlet weak var ownerPhoneNumberTextField: UITextField!
    @IBOutlet weak var commentTextView: UITextView!
    
    //MARK: - ViewLifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
		setupNavigationBar()
        //print(images)
        ownerNameTextField.delegate = self
        ownerPhoneNumberTextField.delegate = self
    }
    //MARK: - Actions
    @IBAction func submitRequestBtnTapped(_ sender: UIButton) {
        if (ownerNameTextField.text?.count != 0){
           param?["owner_name"] = ownerNameTextField.text
        }
        if ownerPhoneNumberTextField.text?.count == 10 {
            param?["owner_phone_number"] = "966" + ownerPhoneNumberTextField.text!
        } else {
            showAlert(title: "Attention", msg: "Please insert valid phone number")
        }
        if (commentTextView.text.count != 0){
            param?["comments"] = commentTextView.text
        }
        print(param)
        if let param = param {
            interactor?.addSuggestFieldData(parameter: param, images: images ?? [UIImage(named: "Football")!], view: self)
        }
    }
}

 //MARK: - Extensions
extension FieldOwnerDetailsViewController: IFieldOwnerDetailsViewController {
    func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
}

extension FieldOwnerDetailsViewController {
    func setupNavigationBar() {
        navigationItem.title = "Owner Details"
        navigationController?.navigationBar.barTintColor = .orange
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
}

extension FieldOwnerDetailsViewController {
	// do someting...
}

extension FieldOwnerDetailsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
      }
      
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          self.view.endEditing(true)
          return false
      }
}
