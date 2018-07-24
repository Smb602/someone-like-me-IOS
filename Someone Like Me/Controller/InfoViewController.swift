/*
  InfoViewController.swift
  Someone Like Me

  This is class the InfoViewController - created as a homepage for the app, it's the first screen the user arrives to after they login
 
  Created by Sharon Borges-Bango on 23/07/2018.
  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
*/

import UIKit
import Firebase
let reuseIdentifier = "articleCell"



class InfoViewController: UIViewController, UIScrollViewDelegate {

    //creating connection for the UITableView and the UIVisualEffectView
    @IBOutlet weak var articleTableView: UITableView!
    @IBOutlet weak var headerBlurrEffect: UIVisualEffectView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.articleTableView.dataSource = self
        self.articleTableView.delegate = self
        navigationController?.setNavigationBarHidden(true, animated: true)  //hides the navigation bar
        headerBlurrEffect.alpha = 0
        // Do any additional setup after loading the view.

    }

}
  //this returns 5 cells containing the maximum cells on this page and refreshes corresponding to number //of articles
extension InfoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    //setting properties of the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCell

        return cell
    }
     //setting properties of the table view
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.bounds.origin.y/150
        //150 is a random number but big enough to keep the offset
     
        //print(offsetY) to check the offset value while scrolling so I have a value to make the
        //navigation controller reapper once the offsetY value at the height I liked which was 1.0
        
        headerBlurrEffect.alpha = offsetY     //blurred effect for the pain bear image on the homepage
        
        if offsetY > 1 {
            navigationController?.setNavigationBarHidden(false, animated: true)
            //if offsetY is larger than 1 make the navigation bar reappear otherwise remain hidden
        } else {
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
    
        
        
        
    }

    
    
    
    
}

