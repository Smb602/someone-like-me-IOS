/*
  MyChatViewController.swift
  Someone Like Me
 
  This class is the swift file/class for the chats storyboard.
 
  Created by Sharon Borges-Bango on 28/07/2018.
  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
*/

import UIKit
import Firebase

//below adopting 2 protocols properties (ones after UIViewController(this becomes the delegate and the datasource))
class MyChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 

    @IBOutlet var messagesTableView: UITableView!
    @IBOutlet var sendButtonPressed: UIButton!
    @IBOutlet var typeMessageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Setting self as the datasource and the delegate
        messagesTableView.dataSource = self
        messagesTableView.delegate = self
        
        
        
        
        //TODO: Set yourself as the delegate of the text field here:
        
        
        
        //TODO: Set the tapGesture here:
        
        
        
        //Registering the MessageCell.xib file containing a cell with the table view under a specifies identifier
        messagesTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "TailoredMessageCell")

        //adding the configureTheTableView method here that customizes the cell size in relation to message sent size
        configureTheTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    //Declaration of the cellForRowAtIndexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //tableview method to create cell and index path is the location identifier for the cell of type chatmessagescell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TailoredMessageCell", for: indexPath) as! ChatMessagesCell
        
        let chatMessageArray = ["1st Message", "2nd Message", "3rd Message"]
        
        cell.theMessageBody.text = chatMessageArray[indexPath.row] //going to go thru message array and populate by row
        
        return cell //output for UITableView cell
    }
    
    //Declaration of numberOfRowsInSection number of cell I want
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    
    //TODO: Declare tableViewTapped here:
    
    
    
    // This method is to configure the TableView so that the message cell is created based on the size of the content and resize based on this
    
    func configureTheTableView() {
        messagesTableView.rowHeight = UITableViewAutomaticDimension
        messagesTableView.estimatedRowHeight = 125.0
        
    }
    
    
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
    
    
    
    //TODO: Declare textFieldDidBeginEditing here:
    
    
    
    
    //TODO: Declare textFieldDidEndEditing here:
    
    
    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    
    
    
    
//  @IBAction func sendPressed(_ sender: AnyObject) {
        
        
        //TODO: Send the message to Firebase and save it in our database
        
        
 //   }
    
    //TODO: Create the retrieveMessages method here:
    
    
    
    
    //Here I am logging the user out and sending them to the welcomeScreenController
    @IBAction func logOutButtonPressed(_ sender: Any) {
    
        do {
            try Auth.auth().signOut() //firebase method for signing out
            
            navigationController?.popToRootViewController(animated: true)
       }
        catch { //error handling using try catch
            print("ERROR! There was a problem signing you out. Please try again.")
        }
    }
    

}
