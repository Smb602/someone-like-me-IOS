//
//  PainTrackerTableViewController.swift
//  Someone Like Me
//
//  Created by Sharon Borges-Bango on 02/08/2018.
//  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
//

import UIKit

class PainTrackerTableViewController: UITableViewController {

    let painItemArray = ["Monday", "Tuesday", "Wednesday"]
    
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

    
}
