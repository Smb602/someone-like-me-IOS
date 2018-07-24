/*
  LoginScreenViewController.swift
  Someone Like Me

  This swift class LoginScreenViewController is the view controller/screen for users that login
 
  Created by Sharon Borges-Bango on 19/07/2018.
  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
*/

import UIKit
import Firebase

class LoginScreenViewController: UIViewController {

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
    
    @IBAction func loginButtonPressed(_ sender: AnyObject) {
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
