//
//  CommentViewController.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
import Cosmos

protocol ICommentViewController: class {
	var router: ICommentRouter? { get set }
    func showAlert(title: String, msg: String)
     func showComment(response: CommentModel.LastComment)
}

class CommentViewController: UIViewController {
	var interactor: ICommentInteractor?
	var router: ICommentRouter?
    lazy var backBtn: UIBarButtonItem = {
            return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtntapped))
        }()
    var counter = 0
    var fieldId: Int?
    var sessionId: Int?
    var date: String?
    var params: [String: Any] = ["": ""]

    @IBOutlet weak var placeholder: UILabel!
    @IBOutlet weak var counterlbl: UILabel!
    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var comment: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
		setupNavigationBar()
        interactor?.lastComment()
    }
    
  
    @IBAction func leaveComment(_ sender: UIButton) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let selectedDay = dateFormatter.string(from: date)
        
        params["description"] =  comment.text
        params["rate"] =  rate.rating
        params["field_id"] = fieldId
        params["session_id"] = sessionId
        params["date"] = selectedDay
        interactor?.parameters = params
        interactor?.addComment()
    }
    
      @objc func backBtntapped() {
        self.dismiss()
      }
}

extension CommentViewController: ICommentViewController {
    func showAlert(title: String, msg: String) {
        ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    
    func showComment(response: CommentModel.LastComment){
        if response.status != false {
            commentButton.setTitle("Update comment", for: .normal)
            counterlbl.text = "\(response.comment?.commentDescription?.count ?? 1)"
            rate.rating = Double((response.comment?.rate)!)!
            comment.text = response.comment?.commentDescription
            placeholder.isHidden = true
        }
        else {
            commentButton.setTitle("Leave comment", for: .normal)
             placeholder.isHidden = false
        }
    }

}

extension CommentViewController{
	
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

extension CommentViewController: UITextViewDelegate   {
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholder.isHidden = true
    }
    func textViewDidChange(_ textView: UITextView) {
        
        counter = comment.text.count
        counterlbl.text = "\(counter)"
        if counter >= 300 {
            comment.isEditable = false
        }
        else {
            comment.isEditable = true
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           self.view.endEditing(true)
           return false
       }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText newText: String) -> Bool {
               return textView.text.count + (newText.count - range.length) <= 300
           }
       
}
