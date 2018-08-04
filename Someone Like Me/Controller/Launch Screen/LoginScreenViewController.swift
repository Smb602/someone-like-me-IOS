/*
  LoginScreenViewController.swift
  Someone Like Me

  This swift class LoginScreenViewController is the view controller/screen for users that login
 
  Created by Sharon Borges-Bango on 19/07/2018.
  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
*/

import UIKit
import Firebase
import SVProgressHUD

class LoginScreenViewController: UIViewController {

    @IBOutlet var enterEmailTextField: UITextField!
    @IBOutlet var enterPasswordTextField: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

//        // Do any additional setup after loading the view.
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show(withStatus: "Logging you in..") //pop up loading for user as indicator so they know they're logging in using the SV cocoa pod
        
        //firebase method
        Auth.auth().signIn(withEmail: enterEmailTextField.text!, password: enterPasswordTextField.text!) { (user, error) in
        //handling errors - if error print else
            if error != nil {
                print("Login unsuccessful, please see error below")
                print(error!)
                SVProgressHUD.dismiss()
                SVProgressHUD.showError(withStatus: "You have entered an incorrect password or email")
                SVProgressHUD.dismiss(withDelay: 1)
            }else{
                print("Login was successful")
                
                SVProgressHUD.dismiss()
                SVProgressHUD.showSuccess(withStatus: "Login was successful")
                SVProgressHUD.dismiss(withDelay: 1)
            }
            
        }
    }
}
//closing the iOS keyboard by touching anywhere using Swift was taken from:
// https://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift?noredirect=1&lq=1
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


