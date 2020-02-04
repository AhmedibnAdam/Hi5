//
//  EditProfileViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/20/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IEditProfileViewController: class {
	var router: IEditProfileRouter? { get set }
    func showAlert(title: String, msg: String)
}

class EditProfileViewController: UIViewController , UITextFieldDelegate{

	var interactor: IEditProfileInteractor?
	var router: IEditProfileRouter?
    var gender: String?
    var dateOfBirth: String?
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(dismissView))
    }()
    
    @objc func dismissView() {
        router?.navigateToProfile()
    }
//MARK:- Outlets
    @IBOutlet weak var dateOfBirthBtn: UIButton!
    @IBOutlet weak var genderBtn: UIButton!
    @IBOutlet weak var biographyTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var biographyContainerView: UIView!
    @IBOutlet weak var fullnameContainerView: UIView!
    @IBOutlet weak var locationContainerView: UIView!
    @IBOutlet weak var dateOfBirthContainerView: UIView!
    @IBOutlet weak var genderContainerView: UIView!
    @IBOutlet weak var saveBtn: UIButton!
    
//MARK:- View Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        fullNameTextField.delegate = self
        biographyTextField.delegate = self
        setupNavigationBar()
        initView()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let gend = defaults.string(forKey: "Gender")
        let dateOfBirth = defaults.string(forKey: "DateOfBirth")
        genderBtn.setTitle(gend, for: .normal)
        dateOfBirthBtn.setTitle(dateOfBirth, for: .normal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
//MARK:- Actions
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        saveBtnAction()
    }
    
    @IBAction func editPhotoBtnTapped(_ sender: UIButton) {
        editPhotoBtnAction()
    }
    
    @IBAction func locationBtnTapped(_ sender: UIButton) {
        locationBtnAction()
    }
    
    @IBAction func dateOfBirthBtnTapped(_ sender: UIButton) {
        dateOfBirthBtnAction()
        
    }
    
    @IBAction func genderBtnTapped(_ sender: UIButton) {
        genderBtnAction()
    }
}
//MARK:- Extensions
extension EditProfileViewController: IEditProfileViewController {
    func showAlert(title: String, msg: String) {
     ShowAlertView.showAlert(title: title, msg: msg, sender: self)
   }
}

extension EditProfileViewController {
    func setupNavigationBar() {
        navigationItem.title = "Edit Profile"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}

extension EditProfileViewController {
    func initView() {
        self.photoView = CreateCornerRauis.viewRaduis(view: self.photoView, number: (self.photoView.frame.size.height / 2))
        self.biographyContainerView = CreateCornerRauis.viewRaduis(view: self.biographyContainerView, number: 5)
        self.fullnameContainerView = CreateCornerRauis.viewRaduis(view: self.fullnameContainerView, number: 5)
        self.locationContainerView = CreateCornerRauis.viewRaduis(view: self.locationContainerView, number: 5)
        self.dateOfBirthContainerView = CreateCornerRauis.viewRaduis(view: self.dateOfBirthContainerView, number: 5)
        self.genderContainerView = CreateCornerRauis.viewRaduis(view: self.genderContainerView, number: 5)
          // MARK : - Button  raduis
        self.saveBtn = CreateCornerRauis.ButtonRaduis(button: self.saveBtn, number: 5)
    }
    
    func configure() {
        router = EditProfileRouter(view: self)
    }
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     func saveBtnAction() {
        let defaults = UserDefaults.standard
        let yearFlag = defaults.string(forKey: "yearFlag")
        let monthFlag = defaults.string(forKey: "monthFlag")
        let dayFlag = defaults.string(forKey: "dayFlag")
        
      }
    func editPhotoBtnAction() {
        let picker = UIImagePickerController()
        picker.delegate = self
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let uploadFromLibraryAction = UIAlertAction(title: "Upload From Library", style: .destructive) { (uploadFromLibrary) in
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
        }
        let takePhotoAction = UIAlertAction(title: "Take a Photo", style: .destructive) { (takePhoto) in
            picker.sourceType = .camera
            self.present(picker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(uploadFromLibraryAction)
        alert.addAction(takePhotoAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        //use image here!
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func locationBtnAction() {
        router?.navigateToLocation()
    }
    
    func dateOfBirthBtnAction() {
        router?.navigateToDateOfBirth()
    }
    
    func genderBtnAction() {
        router?.navigateToGender()
    }
   
    func setGender(gender: String?) {
        guard let gend = gender else {return}
        self.gender = gend

    }
    
    func setDateOfBirth(dateOfBirth: String?) {
        guard let date = dateOfBirth else {return}
        self.dateOfBirth = date

    }
}

//extension EditProfileViewController: GenderEnteredDelegate {
//    func userDidEnterGender(gender: String) {
//        genderBtn.setTitle(gender, for: .normal)
//    }
//    
//}

