//
//  InfoViewController.swift
//  Someone Like Me
//
//  Created by Sharon Borges-Bango on 23/07/2018.
//  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
//

import UIKit
let reuseIdentifier = "articleCell"



class InfoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var articleTableView: UITableView!
    @IBOutlet weak var headerBlurrEffect: UIVisualEffectView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.articleTableView.dataSource = self
        self.articleTableView.delegate = self
        navigationController?.setNavigationBarHidden(true, animated: true)
        headerBlurrEffect.alpha = 0
        // Do any additional setup after loading the view.
    }

}

extension InfoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCell

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.bounds.origin.y/150
//        print(offsetY)
        headerBlurrEffect.alpha = offsetY
        
        if offsetY > 1 {
            navigationController?.setNavigationBarHidden(false, animated: true)
            
        } else {
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
        
        
        
        
    }

    
    
    
    
}

