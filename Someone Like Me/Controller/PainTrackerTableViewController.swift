//
//  PainTrackerTableViewController.swift
//  Someone Like Me
//
//  Created by Sharon Borges-Bango on 02/08/2018.
//  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
//

import UIKit

class PainTrackerTableViewController: UITableViewController {

    var painItemArray = ["Monday", "Tuesday", "Wednesday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    // MARK: - Methods for Table view data source
    //data source method, creating cells in the table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return painItemArray.count
    }
    //asking the data source for a cell to insert in a particular location of the table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creating reuseable cell with and the identifier name that i gave to the prototype cells, index path is the current index path the tableview wants to populate
        let cell = tableView.dequeueReusableCell(withIdentifier: "PainTrackerItemCell", for: indexPath)
        
        // Setting the textlabel thats in every cell and setting the text properties = itemarray of the current index path populating
        cell.textLabel?.text = painItemArray[indexPath.row]
        return cell
    }
    
    
    // MARK: - Methods for tableview delegate
    //tells the delegate the specified rows selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(painItemArray[indexPath.row])
        
        //check if cell row has an accessory bookmark if so change it to no accessory(untick) else add a checkmark
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark //adding checkmark to cell row
        }
        
        tableView.deselectRow(at: indexPath, animated: true) //deselects row after clicked so it doesn't stay grey ui improvement 
        }
    
    
    // MARK - Methods for adding new pain items to the pain tracker
    @IBAction func additionButtonPressed(_ sender: UIBarButtonItem) {
        
        var localTextField = UITextField() //this local varaible within the IBaction is available to all in additionButtonPressed method
        
        //UI alert and append to end of my painItemArray
        let thisAlert = UIAlertController(title: "Add New Pain Date", message: "", preferredStyle: .alert)
        
        //this will occur once a user selects the add icon on the UIAlert
        let action = UIAlertAction(title: "Add Entry", style: .default) { (action) in
            self.painItemArray.append(localTextField.text!) //inside closure (in keyword) specify self so compiler knows where it exists in this class
            
            self.tableView.reloadData() // so new data added to item array appears on tableview
        }
        thisAlert.addTextField { (thisAlertTextField) in
            thisAlertTextField.placeholder = "Enter the date" //placeholder within textfield to enter new additions
            localTextField = thisAlertTextField //extending scope of this textfield in the closure
        }
        
        thisAlert.addAction(action) //adding action to alert
        present(thisAlert, animated: true, completion: nil) //showing alert
        
    }
    
    
}
