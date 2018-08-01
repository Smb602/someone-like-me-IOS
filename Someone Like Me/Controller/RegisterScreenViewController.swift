/*
  RegisterScreenViewController.swift
  Someone Like Me

    This swift file is the Register Screen View Controller that the new users can register
 
  Created by Sharon Borges-Bango on 19/07/2018.
  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
*/

import UIKit
import Firebase
import SVProgressHUD

class RegisterScreenViewController: UIViewController {

    
    @IBOutlet var enterEmailTextField: UITextField!
    @IBOutlet var enterPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonPressed(_ sender: AnyObject) {
        
       SVProgressHUD.show(withStatus: "Logging you in..") //triggers the loading indicator as soon as the user has pressed the register button
        
        //Using a prebuilt method called createuserwithemailandpassword found in the firebase API that creates a new user on the firebase database, also using completion handler and closures
        //so if there is an error with creating a user that would print error, if successful -> home page
        
        Auth.auth().createUser(withEmail: enterEmailTextField.text!, password: enterPasswordTextField.text!) { (user, error) in
            
            if error != nil {
                 print("Registration Unsuccessful")
                print(error!)
                SVProgressHUD.dismiss()
                SVProgressHUD.showError(withStatus: "Registration Unsuccessful")
                SVProgressHUD.dismiss(withDelay: 1)
            } else {
               print("Your Registration Was Successful")
                SVProgressHUD.dismiss()
                SVProgressHUD.showSuccess(withStatus: "Login successful")
                SVProgressHUD.dismiss(withDelay: 1)
            }
            
        }
    }
        

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
