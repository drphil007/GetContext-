//
//  PhrasesTableViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 19/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class PhrasesTableViewController: UITableViewController {

    let languagesTitle = ["Word","Definitions","Grammatical Features","Etyomoliges","Lexical category"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Set section to 1.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Set amount of rows to objects in list.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languagesTitle.count
    }
    
    // Set content for cells.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath)
        
        // edit layout text
        cell.textLabel?.text = languagesTitle[indexPath.row]
        
        cell.textLabel?.font = UIFont (name: "Heavy System", size: 40)
        
        return cell
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
let generalTitle = ["Word","Definitions","Grammatical Features","Etyomoliges","Lexical category"]