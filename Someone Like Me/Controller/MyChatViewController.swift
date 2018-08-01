/*
  MyChatViewController.swift
  Someone Like Me
 
  This class is the swift file/class for the chats storyboard.
 
  Created by Sharon Borges-Bango on 28/07/2018.
  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
*/

import UIKit
import Firebase
import ChameleonFramework
import SVProgressHUD

//below adopting 2 protocols properties (ones after UIViewController(this becomes the delegate and the datasource))
class MyChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
 
    
    //decleration of instance varaible array populated with message objects
    var messagesArray : [Messages] = [Messages]()
    
    //IBOutlets
    @IBOutlet var messagesTableView: UITableView!
    @IBOutlet var sendButtonPressed: UIButton!
    @IBOutlet var typeMessageTextfield: UITextField!
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
        
        //Setting self as the datasource and the delegate
        messagesTableView.dataSource = self
        messagesTableView.delegate = self
        //Setting self as the delegate - text field
        typeMessageTextfield.delegate = self
        //Registering the MessageCell.xib file containing a cell with the table view under a specifies identifier
        messagesTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "TailoredMessageCell")
        
        //Tap gesture is registered
        let thisTapGesture = UITapGestureRecognizer(target: self, action: #selector (thisTableViewTapped))
        
        messagesTableView.addGestureRecognizer(thisTapGesture)

        //adding the configureTheTableView method here that customizes the cell size in relation to message sent size
        configureTheTableView()

        getMessages() //getting messages using this method
        
        messagesTableView.separatorStyle = .none //no seperation line between messages so more seamless like a messageapp
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    ///////////////////////////////////////////
    
    //THE TABLEVIEW - DATASOURCE METHODS
    
    
    
    //Declaration of the cellForRowAtIndexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //tableview method to create cell and index path is the location identifier for the cell of type chatmessagescell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TailoredMessageCell", for: indexPath) as! ChatMessagesCell

        // Below is two lines for adding dummy/test data
//        let chatMessageArray = ["1st Message", "2nd Message", "3rd Message"]
//        cell.theMessageBody.text = chatMessageArray[indexPath.row] //going to go thru message array and populate by row
        
        cell.theMessageBody.text = messagesArray[indexPath.row].theMessageBody
        cell.theSendersUsername.text = messagesArray[indexPath.row].sender
        cell.displayPicture.image = UIImage(named: "default-picture.png")
        
        //messages sent by us, change the imageview to xxx colour
        if cell.theSendersUsername.text == Auth.auth().currentUser?.email as String! { //or replace everything after = to = "Me"
            cell.displayPicture.backgroundColor = UIColor.flatPowderBlue() //set colours to these
            cell.theMessageBackground.backgroundColor = UIColor.flatLime()
            
        }else{ //messages not sent by us
            cell.displayPicture.backgroundColor = UIColor.flatSand()
            cell.theMessageBackground.backgroundColor = UIColor.flatYellow()
            cell.displayPicture.image = UIImage(named: "users")
        }
        
        return cell //output for UITableView cell
    }
    
    //Declaration of numberOfRowsInSection number of cell I want
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    
    //The thisTableViewTapped method used in tap gesture is declared here
    @objc func thisTableViewTapped() {
        typeMessageTextfield.endEditing(true)
    }
    
    
    // This method is to configure the TableView so that the message cell is created based on the size of the content and resize based on this
    
    func configureTheTableView() {
        messagesTableView.rowHeight = UITableViewAutomaticDimension
        messagesTableView.estimatedRowHeight = 120.0
        
    }
    
    
    ///////////////////////////////////////////
    
    //METHODS: TEXTFIELD DELEGATE METHODS
    
    
    //This method will be triggered when user is about to type in textField, so tells delegate editing began in specified textfield
    func textFieldDidBeginEditing(_ textField: UITextField) {

        //        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)

        UIView.animate(withDuration: 0.6) {
            //this is so the textfield view is still visible once keyboard comes up
            self.heightConstraint.constant = 308 //textfield=50 keyboard=258 50+258=308
            //call method on view to call on autolayout to update all views
            self.view.layoutIfNeeded() //redraw the whole thing
        }
    }
    
//    //Get Keyboard Height and Animation When Keyboard Shows Up
//    @objc func keyboardWillShow(notification: Notification) {
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            let keyboardHeight = keyboardSize.height
//            //iPhone X has Safe Area Insets
//            if #available(iOS 11.0, *) {
//                heightConstraint.constant = keyboardHeight - view.safeAreaInsets.bottom + 50
//            } else {
//                // Fallback on earlier versions
//                heightConstraint.constant = keyboardHeight + 50
//            }
//            view.layoutIfNeeded()
//        }
//
//    }
//
    //This method tells the delegate when editing has stopped in specified textfield and requires a tap gesture to register when user moves away
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.6) {
            self.heightConstraint.constant = 308 //back to 50 after keyboard is gone
            self.view.layoutIfNeeded()
        }
    }
    
    
    ///////////////////////////////////////////
    
    // SENDING AND RECIVING FROM FIREBASE
    
    
    @IBAction func sendButtonPressedAction(_ sender: Any) {
    
    //Collapses keyboard after done typing and presses send
       typeMessageTextfield.endEditing(true)
    
        
    //This method is to send the message to Firebase and save in the database
        
        //disabling some UI elements :
        typeMessageTextfield.isEnabled = false
        sendButtonPressed.isEnabled = false
        
        //messages database within firebase just for messages using child method for creating this child database within the original database
        let messageDB = Database.database().reference().child("MessagesDatabase")
        
        //the users messages will be stored as a Dictionary collection of two key value pairs first the sender which is the email of the current user and the second is the message body
        let dictionaryMessages = ["TheSender": Auth.auth().currentUser?.email,"TheMessageBody": typeMessageTextfield.text!]

        //firebase method for custom unique key for each message so they're saved to that identifier
        messageDB.childByAutoId().setValue(dictionaryMessages) {
            (error, reference) in
            if error != nil {
                print(error!)
            }else{
                print("The message has been saved successfully")
            }
            //Enabling message textfield and the send button and reset the textfield so its clear and a new message can be sent by user
            self.typeMessageTextfield.isEnabled = true
            self.sendButtonPressed.isEnabled = true
            self.typeMessageTextfield.text = ""
            
        }
    }
    
    //firebase method to retrieve messages
    func getMessages() {
        let messageDB = Database.database().reference().child("MessagesDatabase")
        
        //observing for event types of child added, when new message is added to the database then get that result
        messageDB.observe(.childAdded, with: {  (snapshot) in
            
         let theSnapshotValue = snapshot.value as! Dictionary<String, String>
             //^ the snapshot value
            let theText = theSnapshotValue["TheMessageBody"]!
            let theSender = theSnapshotValue["TheSender"]!
            //DELETE FOLLOWING 3 LINES
            print("====================================")
            print("\(theSender): \(theText)")
            print("====================================\n")
            
            //print(theText,theSender)  <use this to test that it's retrieving the messages sent 
            
            //creating message object which will be appended to messagesArray
            let messages = Messages()
            messages.theMessageBody = theText
            messages.sender = theSender
            
            self.messagesArray.append(messages)
            //call configure tableview to reformat the table view and reload the data in the table view
            self.configureTheTableView()
            self.messagesTableView.reloadData()
        })
    }
    
    //Here I am logging the user out and sending them to the welcomeScreenController
    @IBAction func logOutButtonPressed(_ sender: AnyObject) {
    
        do {
            try Auth.auth().signOut() //firebase method for signing out
            SVProgressHUD.show(withStatus: "You are logging out")
            SVProgressHUD.showSuccess(withStatus: "You have logged out successfully")
            SVProgressHUD.dismiss(withDelay: 1)
            navigationController?.popToRootViewController(animated: true)
            print("You have logged out sucessfully")
       }
        catch { //error handling using try catch
            print("ERROR! There was a problem signing you out. Please try again.")
        }
    }
    

}
