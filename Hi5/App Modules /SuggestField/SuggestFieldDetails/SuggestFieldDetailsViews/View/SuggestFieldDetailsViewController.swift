//
//  SuggestFieldDetailsViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISuggestFieldDetailsViewController: class {
	var router: ISuggestFieldDetailsRouter? { get set }
    func showAlert(title: String, msg: String)
    func showResponse(response: SuggestFieldDetailsModel.SuggestFieldDataResponse)
    func removeLoadingIndicator()
}

class SuggestFieldDetailsViewController: UIViewController  {
	var interactor: ISuggestFieldDetailsInteractor?
	var router: ISuggestFieldDetailsRouter?
    var lat: Double = 23.8859
    var long: Double = 45.0792
    var sportId: Int = 12
    var param: [String: Any] = [:]
    
    //MARK: - Properties
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtnTapped))
    }()
    
    @objc func backBtnTapped() {
        router?.navigateToSuggestField()
    }
    var primarySport: [SuggestFieldDetailsModel.Sport] = []
    var floorType: [SuggestFieldDetailsModel.Floor] = []
    var fieldPhoto: [UIImage] = []
    var fieldName: String?
    //MARK: - Outlets
    @IBOutlet weak var bestFor9x9Btn: UIButton!
    @IBOutlet weak var bestFor8x8Btn: UIButton!
    @IBOutlet weak var fieldTypeIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bestFor7x7Btn: UIButton!
    @IBOutlet weak var fieldTypeCollectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var contaimerView: UIView!
    @IBOutlet weak var fieldNameTxtField: UITextField!
    @IBOutlet weak var sportCollectionView: UICollectionView!
    @IBOutlet weak var LoadingIndicator: UIActivityIndicatorView!
    //MARK: - ViewLifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
        LoadingIndicator.isHidden = false
        fieldTypeIndicator.isHidden = false
        self.interactor?.suggestFieldData(view: self)
        initView()
        setupNavigationBar()
        sportCollectionView.delegate = self
        sportCollectionView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        fieldTypeCollectionView.delegate = self
        fieldTypeCollectionView.dataSource = self
        fieldNameTxtField.delegate = self
        registerCollectionCell()
        registerSportCollectionViewCell()
        registerFieldTypeCollectionView()
    }
    //MARK: - Actions
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        if (fieldNameTxtField.text?.count == 0 || fieldNameTxtField.text == "") {
            showAlert(title: "Attention", msg: "Please enter field Name")
        } else {
            param["latitude"] = "\(lat)"
            param["longitude"] = "\(long)"
            param["sport_type_id"] = sportId
            param["field_name"] = fieldNameTxtField.text
            print(param)
            if param.keys.contains("floor_type_id") {
                router?.navigateToFieldOwnerDetails(param: param, images: fieldPhoto)
            } else {
                showAlert(title: "Attention", msg: "Please select field type")
            }
        }
    }
    
    @IBAction func x7BtnTapped(_ sender: UIButton) {
        if (sender.titleLabel?.textColor == UIColor.darkGray) {
            sender.setTitleColor(.orange, for: .normal)
            sender.borderColor = .orange
            bestFor8x8Btn.setTitleColor(.darkGray, for: .normal)
            bestFor8x8Btn.borderColor = .lightGray
            bestFor9x9Btn.setTitleColor(.darkGray, for: .normal)
            bestFor9x9Btn.borderColor = .lightGray
            param["best_for"] = "7x7"
        } else {
            sender.setTitleColor(.darkGray, for: .normal)
            sender.borderColor = .lightGray
            param.removeValue(forKey: "best_for")
        }
    }
    
    @IBAction func x8BtnTapped(_ sender: UIButton) {
        if (sender.titleLabel?.textColor == UIColor.darkGray) {
            sender.setTitleColor(.orange, for: .normal)
            sender.borderColor = .orange
            bestFor7x7Btn.setTitleColor(.darkGray, for: .normal)
            bestFor7x7Btn.borderColor = .lightGray
            bestFor9x9Btn.setTitleColor(.darkGray, for: .normal)
            bestFor9x9Btn.borderColor = .lightGray
            param["best_for"] = "8x8"
        } else {
            sender.setTitleColor(.darkGray, for: .normal)
            sender.borderColor = .lightGray
            param.removeValue(forKey: "best_for")
        }
    }
    
    @IBAction func x9BtnTapped(_ sender: UIButton) {
        if (sender.titleLabel?.textColor == UIColor.darkGray) {
            sender.setTitleColor(.orange, for: .normal)
            sender.borderColor = .orange
            bestFor7x7Btn.setTitleColor(.darkGray, for: .normal)
            bestFor7x7Btn.borderColor = .lightGray
            bestFor8x8Btn.setTitleColor(.darkGray, for: .normal)
            bestFor8x8Btn.borderColor = .lightGray
            param["best_for"] = "9x9"
        } else {
            sender.setTitleColor(.darkGray, for: .normal)
            sender.borderColor = .lightGray
            param.removeValue(forKey: "best_for")
        }
    }
    
    @IBAction func addFieldPhotoBtnTapped(_ sender: UIButton) {
        addFieldPhotoAction()
    }
    
}

 //MARK: - Extensions
extension SuggestFieldDetailsViewController: ISuggestFieldDetailsViewController {
    func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    func showResponse(response: SuggestFieldDetailsModel.SuggestFieldDataResponse) {
        guard let sport = response.data?.sports , let floor = response.data?.floors else {return}
        self.primarySport = sport
        self.floorType = floor
        self.sportCollectionView.reloadData()
        self.fieldTypeCollectionView.reloadData()
    }
    func removeLoadingIndicator() {
        self.LoadingIndicator.isHidden = true
        self.fieldTypeIndicator.isHidden = true
    }
}

 //MARK: - CollectionViewMethods
extension SuggestFieldDetailsViewController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func registerCollectionCell() {
            let cell = UINib(nibName: "PhotoFieldCell", bundle: nil)
            collectionView.register(cell, forCellWithReuseIdentifier: "PhotoFieldCell")
    }
    
    func registerSportCollectionViewCell() {
        let cell = UINib(nibName: "SportCell", bundle: nil)
        sportCollectionView.register(cell, forCellWithReuseIdentifier: "SportCell")
    }
    
    func registerFieldTypeCollectionView() {
        let cell = UINib(nibName: "FieldTypeCell", bundle: nil)
        fieldTypeCollectionView.register(cell, forCellWithReuseIdentifier: "FieldTypeCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.collectionView){
            return fieldPhoto.count
        } else if (collectionView == self.sportCollectionView){
            return primarySport.count
        } else {
            return floorType.count
        }
            
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == self.collectionView) {
            let photo = fieldPhoto[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoFieldCell", for: indexPath) as! PhotoFieldCell
            cell.fieldImg.image = photo
            cell.delegate = self
            return cell
        } else if(collectionView == self.sportCollectionView){
            let sport = primarySport[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportCell", for: indexPath) as! SportCell
            cell.sportImg.image = UIImage(named: sport.icon ?? "Football")
            cell.sportTitle.text = sport.name
            return cell
        } else {
            let floor = floorType[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FieldTypeCell", for: indexPath) as! FieldTypeCell
            cell.floorTypeBtn.setTitle(floor.name, for: .normal)
            cell.delegate = self
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == self.fieldTypeCollectionView) {
            return CGSize(width: 170, height: 50)
        }
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == self.sportCollectionView) {
            let sport = primarySport[indexPath.row]
            let cell = collectionView.cellForItem(at: indexPath) as! SportCell
            cell.isSelected = true
            if let id = sport.id {
               self.sportId = id
            }
            print(sportId)
        } else if (collectionView == self.fieldTypeCollectionView) {
            let floor = floorType[indexPath.row]
            let cell = collectionView.cellForItem(at: indexPath) as! FieldTypeCell
            cell.isSelected = true
            param["floor_type_id"] = floor.id
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if (collectionView == self.sportCollectionView) {
            let cell = collectionView.cellForItem(at: indexPath) as! SportCell
            cell.isSelected = false
        } else if (collectionView == self.fieldTypeCollectionView) {
            let cell = collectionView.cellForItem(at: indexPath) as! FieldTypeCell
            cell.isSelected = false
            param.removeValue(forKey: "floor_type_id")
        }
    }

}
 //MARK: - extension
extension SuggestFieldDetailsViewController {
    func initView() {
 
    }
    func setupNavigationBar() {
        navigationItem.title = "Field Details"
        navigationController?.navigationBar.barTintColor = .orange
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
}

//MARK: - Extension UIImage Picker
extension SuggestFieldDetailsViewController: UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func addFieldPhotoAction() {
        if (fieldPhoto.count < 4) {
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
        } else {
            showAlert(title: "Attention", msg: "The Max Number to insert field photo is 4 if you want to add photo remove one")
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                self.fieldPhoto.append(image)
                self.collectionView.reloadData()
            }
            dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
  }

//MARK: - Extension PhotoCellDelegate
extension SuggestFieldDetailsViewController: PhotoCellDelegate {
    func didTap(_ button: UIButton, cell: UICollectionViewCell) {
        guard let index = collectionView.indexPath(for: cell) else {return}
        fieldPhoto.remove(at: index.row)
        collectionView.reloadData()
    }
}

//MARK: - Extension FieldTypeCellDelegate
extension SuggestFieldDetailsViewController: fieldTypeCellDelegate {
    func didTap(_ button: UIButton, cell: UICollectionViewCell, selected: Bool) {
        guard let index = fieldTypeCollectionView.indexPath(for: cell) else {return}
        if selected {
            let floorId = (index.row) + 1
            param["floor_type_id"] = floorId
        } else {
            param.removeValue(forKey: "floor_type_id")
        }
    }
}
extension SuggestFieldDetailsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
      }
      
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          self.view.endEditing(true)
          return false
      }
}
