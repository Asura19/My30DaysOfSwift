//
//  ViewController.swift
//  WikiFace
//
//  Created by Phoenix on 2017/4/26.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var faceImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        self.faceImageView.alpha = 0
        self.faceImageView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        do {
            try WikiFace.faceForPerson(textField.text!, size: CGSize(width: 300, height: 400), completion: { (image: UIImage?, imageFound: Bool!) in
                if imageFound {
                    
                    DispatchQueue.main.async(execute: { 
                        self.faceImageView.image = image
                        
                        UIView.animate(withDuration: 0.8,
                                       delay: 0,
                                       usingSpringWithDamping: 0.7,
                                       initialSpringVelocity: 1,
                                       options: .curveEaseIn,
                                       animations: { () -> Void in
                            
                            self.faceImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                            self.faceImageView.alpha = 1
                            self.faceImageView.layer.shadowOpacity = 0.4
                            self.faceImageView.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
                            self.faceImageView.layer.shadowRadius = 15.0
                            self.faceImageView.layer.shadowColor = UIColor.black.cgColor
                            
                        }, completion: nil )
                        
                        WikiFace.centerImageViewOnFace(self.faceImageView)
                    })
                }
            })
        } catch WikiFace.WikiError.coundNotDownloadImage {
            print("coundNotDownloadImage")
        } catch {
            print("other error")
        }
        
        return true
    }

}

