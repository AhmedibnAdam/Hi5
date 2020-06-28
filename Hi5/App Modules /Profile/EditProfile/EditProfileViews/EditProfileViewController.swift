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
    func hideIndicator()
}

class EditProfileViewController: UIViewController , UITextFieldDelegate{

	var interactor: IEditProfileInteractor?
	var router: IEditProfileRouter?
    
    var photo = UIImage(named: "username")
    var gender: String = "male"
    var yearFlag = "public"
    var monthFlag = "public"
    var dayFlag = "public"
    var year = "2020"
    var month = "Jan"
    var day = "01"
    var countryFlag = "public"
    var cityFlag = "public"
    var stateFlag = "public"
    var country = "eg"
    var city = "cairo"
    var state = "nasrCity"
    var locationWords: [String] = []
    var parameters: [String: Any]?
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(dismissView))
    }()
    
    @objc func dismissView() {
        router?.navigateToProfile()
    }
//MARK:- Outlets
    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var dateOfBirthBtn: UIButton!
    @IBOutlet weak var genderBtn: UIButton!
    @IBOutlet weak var biographyTextField: UITextView!
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
        setupNavigationBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let gend = defaults.string(forKey: "Gender")
        let dateOfBirth = defaults.string(forKey: "DateOfBirth")
        let location = defaults.string(forKey: "location")
        let biography = defaults.string(forKey: "biography")
        let fullName = defaults.string(forKey: "FullName")
        if let data = defaults.object(forKey: "image") as? Data {
            let image = UIImage(data: data)
            profilePhoto.image = image
            photo = image
        }
        biographyTextField.text = biography
        fullNameTextField.text = fullName
        genderBtn.setTitle(gend, for: .normal)
        dateOfBirthBtn.setTitle(dateOfBirth, for: .normal)
        locationBtn.setTitle(location, for: .normal)
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
    func hideIndicator() {
        loadingIndicator.isHidden = true
        ShowAlertView.showAlert(title: "Alert", msg: "Profile information updated successfuly !", sender: self)

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

    }
    

    func configure() {
        router = EditProfileRouter(view: self)
    }
    
    func showIndicator() {
        loadingIndicator.isHidden = false
    }
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     func saveBtnAction() {
        showIndicator()
        let defaults = UserDefaults.standard
        yearFlag = defaults.string(forKey: "yearFlag") ?? "public"
        monthFlag = defaults.string(forKey: "monthFlag") ?? "public"
        dayFlag = defaults.string(forKey: "dayFlag") ?? "public"
        year = defaults.string(forKey: "year") ?? "2020"
        month = defaults.string(forKey: "month") ?? "Jan"
        day = defaults.string(forKey: "day") ?? "01"
        countryFlag = defaults.string(forKey: "countryFlag") ?? "public"
        cityFlag = defaults.string(forKey: "cityFlag") ?? "public"
        stateFlag = defaults.string(forKey: "stateFlag") ?? "public"
        gender = defaults.string(forKey: "gender") ?? "male"
        if let location = defaults.string(forKey: "location") {
           let locationWords = location.split(separator: ",")

            if locationWords.count == 1{
                country = String(locationWords[0])
                city = ""
                state = ""
            } else if locationWords.count == 2 {
                country = String(locationWords[0])
                city = String(locationWords[1])
                state = ""
            } else {
                country = String(locationWords[0])
                city = String(locationWords[1])
                state = String(locationWords[2])
            }
        }
        
        if city == ""{
            if let location = defaults.string(forKey: "location") {
                    let locationWords = location.split(separator: " ")

                     if locationWords.count == 1{
                         country = String(locationWords[0])
                         city = ""
                         state = ""
                     } else if locationWords.count == 2 {
                         country = String(locationWords[0])
                         city = String(locationWords[1])
                         state = ""
                     } else {
                         country = String(locationWords[0])
                         city = String(locationWords[1])
                         state = String(locationWords[2])
                     }
                 }
        }
        
        if(fullNameTextField.text?.isEmpty == false && biographyTextField.text?.isEmpty == true){
            guard let name = fullNameTextField.text else {return}
            parameters = ["yearFlag": yearFlag , "monthFlag": monthFlag , "dayFlag": dayFlag , "year": year,"month": month,"day": day, "countryFlag": countryFlag , "cityFlag": cityFlag , "stateFlag": stateFlag , "country": country , "city": city , "state": state , "name": name ]
        }
            
        else if(biographyTextField.text?.isEmpty == false && fullNameTextField.text?.isEmpty == true){
            guard let biography = biographyTextField.text else {return}
            parameters = ["yearFlag": yearFlag , "monthFlag": monthFlag , "dayFlag": dayFlag , "year": year,"month": month,"day": day, "countryFlag": countryFlag , "cityFlag": cityFlag , "stateFlag": stateFlag , "country": country , "city": city , "state": state , "biography": biography ]
            
        } else if(fullNameTextField.text?.isEmpty == false && biographyTextField.text?.isEmpty == false){
            guard let name = fullNameTextField.text else {return}
            guard let biography = biographyTextField.text else {return}
            parameters = ["yearFlag": yearFlag , "monthFlag": monthFlag , "dayFlag": dayFlag , "year": year,"month": month,"day": day, "countryFlag": countryFlag , "cityFlag": cityFlag , "stateFlag": stateFlag , "country": country , "city": city , "state": state , "biography": biography , "name": name ]
        }

        else { parameters = ["yearFlag": yearFlag , "monthFlag": monthFlag , "dayFlag": dayFlag ,"year": year,"month": month,"day": day, "countryFlag": countryFlag , "cityFlag": cityFlag , "stateFlag": stateFlag , "country": country , "city": city , "state": state , "gender": gender ]
        }
        interactor?.doEditProfile(view: self, editProfile: parameters , image: photo!)
      }
    func editPhotoBtnAction() {
        let picker = UIImagePickerController()
        picker.delegate = self
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let uploadFromLibraryAction = UIAlertAction(title: "Upload From Library", style: .destructive) { (uploadFromLibrary) in
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage
        self.profilePhoto.image = image
        self.photo = image
        let images = image!.pngData()
        UserDefaults().set(images, forKey: "image")
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
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
}

//extension UserDefaults {
//    func imageArray(forKey key: String) -> [UIImage]? {
//        guard let array = self.array(forKey: key) as? [Data] else {
//            return nil
//        }
//        return array.flatMap() { UIImage(data: $0) }
//    }
//
//    func set(_ imageArray: [UIImage], forKey key: String) {
//        self.set(imageArray.flatMap({ $0.pngData() }), forKey: key)
//    }
//}

