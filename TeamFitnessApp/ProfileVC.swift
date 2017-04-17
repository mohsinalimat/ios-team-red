//
//  ProfileView.swift
//  TeamFitnessApp
//
//  Created by Lawrence Herman on 4/6/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.


import UIKit
import Foundation

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ProfileViewDelegate {

    let profileView = ProfileView()
    var userEmail: String!
    var userPassword: String!
    var uid: String!
    var gender: String!
    var userImage: UIImage = #imageLiteral(resourceName: "people")
    
    override func loadView() {
        self.view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        profileView.delegate = self
        self.hideKeyboardWhenTappedAround()
        print(userEmail)
    }
    
    
    func setGoalsButton() {
        
        guard let name = profileView.nameTextField.text else  {
            alert(message: "Please enter name first")
            return
        }

        guard let weight = Int(profileView.weightTextField.text!) else {
            alert(message: "Please enter your weight first")
            return
        }
        
        guard let feet = Float(profileView.heightFeetTextField.text!) else {
            alert(message: "Please enter Feet")
            return
        }
        
        guard let inches = Float(profileView.heightInchesTextField.text!) else {
            alert(message: "Please enter inches")
            return
        }
        
        let height = (feet * 12) + inches
        
        guard let gender = profileView.genderButton.currentTitle else {
            alert(message: "Please select a gender.")
            return
        }
            
        let vc: GoalsViewController = GoalsViewController()
        
        vc.userEmail = userEmail
//        vc.userPassword = userPassword
        vc.name = name
        vc.gender = gender
        vc.height = height
        vc.weight = weight
        vc.uid = uid
        
        print("ProfileVC email\(userEmail)")
        print("ProfileVC password\(userPassword)")
        print("ProfileVC name\(name)")
        print("ProfileVC gender\(gender)")
        print("ProfileVC height\(height)")
        print("ProfileVC weight\(weight)")
        
            
      self.navigationController?.pushViewController(vc, animated: true)
    }

    func displayImagePickerButtonTapped() {
        
        
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self

        let selectPhotoAlert = UIAlertController(title: "Photo Source", message: "Choose a Source", preferredStyle: .actionSheet)
        
        selectPhotoAlert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                myPickerController.sourceType = .camera
                self.present(myPickerController, animated: true, completion: nil)

            } else {
                print("No camera")
            }
        }))
        
        selectPhotoAlert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
            myPickerController.sourceType = .photoLibrary
            self.present(myPickerController, animated: true, completion: nil)

        }))
        
        selectPhotoAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:  nil))
        
        self.present(selectPhotoAlert, animated: true, completion: nil)
        
     }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        profileView.myImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        profileView.myImageView.backgroundColor = UIColor.clear
        profileView.myImageView.contentMode = UIViewContentMode.scaleAspectFit
        let userImage = profileView.myImageView.image!
        navigationController?.dismiss(animated: true, completion: nil)

        FirebaseStoreageManager.upload(userImage: userImage, withUserID: self.uid) { (response) in
            
            switch response {
            case let .successfulLogin(user):
                print(user.uid)
         
            case let .failure(failString):
                print(failString)
                self.alert(message: failString)
                
            default:
                print("Firebase login failure")
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

    func pressGenderButton () {
        
        let alertController = UIAlertController(title: "Gender", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        let maleAction = UIAlertAction(title: "Male", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("OK")
            self.gender = "Male"
            self.profileView.genderButton.setTitle("Male", for: .normal)
            
        }
        let femaleAction = UIAlertAction(title: "Female", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("ok")
            self.gender = "Female"
            self.profileView.genderButton.setTitle("Female", for: .normal)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(maleAction)
        alertController.addAction(femaleAction)
        

        self.present(alertController, animated: true)
        
    }

}



