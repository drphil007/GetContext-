//
//  PhrasesTableViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 19/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class GeneralTableViewController: UITableViewController {
    
    var storeWordDescription = [StoreWordDescription]()
    var examplePhrase: String = ""
    var subExamplePhrase: String = ""
    var grammaticalFeature: String = ""
    var etymologies: String = ""
    var lexicalCategory: String = ""
    var phoneticSpelling: String = ""

    var etymolFinal: String = ""
    
    let generalTitle = ["Word","Definitions","Example Phrase","Grammatical Features","Etymologies","Lexical Category","Phonetic Spelling"]
    
    var detail: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ContextController.shared.fetchWordDescription { (storeWordDescription) in
            if let storeWordDescription = storeWordDescription {
                
                // Definitions
                
                // Example phrase
                self.examplePhrase = (storeWordDescription.results.first?.lexicalEntries.first?.entries.first?.senses.first?.examples.first?.text)!
                print(self.examplePhrase)

                // Alternative Example phrase
                self.subExamplePhrase = (storeWordDescription.results.first?.lexicalEntries.first?.entries.first?.senses.first?.subsenses?.first?.examples.first?.text)!
                print(self.subExamplePhrase)

                // Grammatical F
                self.grammaticalFeature = (storeWordDescription.results.first?.lexicalEntries.first?.entries.first?.grammaticalFeatures.first?.text)!
                print(self.grammaticalFeature)
  
                // Etymologies
                for etymologies in (storeWordDescription.results.first?.lexicalEntries.first?.entries.first?.etymologies)! {
                    self.etymolFinal = etymologies
                    //print(self.etymolFinal)
                }
                print(self.etymolFinal)
      
                // Lexical Category
                self.lexicalCategory = (storeWordDescription.results.first?.lexicalEntries.first?.lexicalCategory)!
                print(self.lexicalCategory)

                // Phonetic spelling
                self.phoneticSpelling = (storeWordDescription.results.first?.lexicalEntries.first?.pronunciations.first?.phoneticSpelling)!
                print(self.phoneticSpelling)

                self.updateUI(with: self.storeWordDescription)
                //print(self.storeWordDescription)
            }
        }
    }
    
    func updateUI(with storeWordDescription: [StoreWordDescription]) {
        DispatchQueue.main.async {
            self.detail = ["test","\(self.examplePhrase)","\(self.subExamplePhrase)","\(self.grammaticalFeature)","\(self.etymolFinal)","\(self.lexicalCategory)","\(self.phoneticSpelling)"]
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Set section to 1.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Set amount of rows to objects in list.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detail.count
    }
    
    // Set content for cells.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "generalCell", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        // Set text for Title and Detail.
        cell.textLabel?.text = generalTitle[indexPath.row]
        cell.detailTextLabel?.text = detail[indexPath.row]
        
        // Set text font.
        cell.textLabel?.font = UIFont (name: "Heavy System", size: 40)
        cell.detailTextLabel?.font = UIFont (name: "Heavy System", size: 20)
    }
}
