//
//  SignupProfileViewController.swift
//  ImagePicker
//
//  Created by Phoenix on 2017/4/26.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit
import Photos

class SignupProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var containerView: UIView!

    @IBOutlet weak var userProfileImageVie: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    
    fileprivate var profileImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.becomeFirstResponder()
        
        userProfileImageVie.layer.cornerRadius = userProfileImageVie.bounds.width / 2
        userProfileImageVie.layer.masksToBounds = true
        
        let ges = UITapGestureRecognizer(target: self, action: #selector(pickProfileImage(_:)))
        userProfileImageVie.addGestureRecognizer(ges)
    }
    
    func pickProfileImage(_ tap: UITapGestureRecognizer) {
        let authorization = PHPhotoLibrary.authorizationStatus()
        if authorization == .notDetermined {
            PHPhotoLibrary.requestAuthorization({ (status) in
                DispatchQueue.main.async(execute: { 
                    self.pickProfileImage(tap)
                })
            })
        }
        
        if authorization == .authorized {
            if !UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                return;
            }
            
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: nil)
        
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        self.userProfileImageVie.image = image
    }
    
    func presentCamera() {
        
    }

}
