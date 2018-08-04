//
//  PainArticlesViewController.swift
//  Someone Like Me
//
//  Created by Sharon Borges-Bango on 04/08/2018.
//  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
//

import UIKit

class PainArticlesViewController: UIViewController {
    //MARK: - IBOUTLETS
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var articleTitleLabel: UILabel!

    
    //MARK: - PARAMETERS
    lazy var articleBody = ""
    lazy var articleTitle = ""
    
    //MARK: - CLASS METHODS
    
    //MARK: - EXTENSIONS

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        tableView.estimatedRowHeight = 125
        tableView.rowHeight = UITableViewAutomaticDimension

    }
    
    override func viewWillAppear(_ animated: Bool) {
        articleTitleLabel.text = articleTitle
    }


}

extension PainArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleBody", for: indexPath) as! ArticleBodyTableViewCell
        
        cell.articleBodyField.text = articleBody
        
        return cell
    }
    
}
