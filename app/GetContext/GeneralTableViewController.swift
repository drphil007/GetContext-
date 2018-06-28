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
    
    // Definition in JSON struct.
    var longDefinition: String = ""
    
    // Final definition extracted from struct.
    var longFinal: String = ""
    
    // Set variable for Example Phrase.
    var examplePhrase: String = ""
    
    // Set variable for subExample Phrase.
    var subExamplePhrase: String = ""
    
    // Set variable for Grammatical Feature.
    var grammaticalFeature: String = ""
    
    // Etymologies in JSON struct.
    var etymologies: String = ""
    
    // Final etymologies extracted from struct.
    var etymolFinal: String = ""
    
    // Set variable for lexical category.
    var lexicalCategory: String = ""
    
    // Set variable for Phonetic Spelling.
    var phoneticSpelling: String = ""
    
    // Set bool for when cell clicked.
    var cellOn: Bool = true
    
    // Set array for cell Title.
    let generalTitle = ["Word",
                        "Definitions",
                        "Example Phrase",
                        "Grammatical Features",
                        "Etymologies",
                        "Lexical Category",
                        "Phonetic Spelling"]
    
    // Set array for cell Detail.
    var detail: [String] = []
    
    // Set array for Detail Info.Sources used for wordInfo description see list in READ.ME.
    var moreInfo = ["a single unit of language that has meaning and can be spoken or written",
                    "a statement of the exact meaning of a word",
                    "A phrase is a group or words that express a concept and is used as a unit within a sentence.",
                    "A grammatical category is a property of items within the grammar of a language",
                    "Etymology is the study of the history of words, their origins, and how their form and meaning have changed over time.",
                    "There are major and minor lexical categories. For example. Major: noun and verb. Minor: particles and conjunctions.",
                    "Phonetic spelling is the representation of vocal sounds which express pronunciations of words."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get general information of currentWord from API.
        ContextController.shared.fetchWordDescription { (storeWordDescription) in
            if let storeWordDescription = storeWordDescription {
                
                // Definitions
                for longDefinition in (storeWordDescription.results.first?.lexicalEntries
                    .first?.entries.first?.senses.first?.definitions)! {
                    self.longFinal = longDefinition
                }
                print(self.longFinal)
                
                // Example phrase
                self.examplePhrase = (storeWordDescription.results.first?.lexicalEntries
                    .first?.entries.first?.senses.first?.examples.first?.text)!
                print(self.examplePhrase)

                // Alternative Example phrase
                self.subExamplePhrase = (storeWordDescription.results.first?.lexicalEntries
                    .first?.entries.first?.senses.first?.subsenses?.first?.examples.first?.text)!
                print(self.subExamplePhrase)

                // Grammatical F
                self.grammaticalFeature = (storeWordDescription.results.first?.lexicalEntries
                    .first?.entries.first?.grammaticalFeatures.first?.text)!
                print(self.grammaticalFeature)
  
                // Etymologies
                for etymologies in (storeWordDescription.results.first?
                    .lexicalEntries.first?.entries.first?.etymologies)! {
                    self.etymolFinal = etymologies
                    //print(self.etymolFinal)
                }
                print(self.etymolFinal)
      
                // Lexical Category
                self.lexicalCategory = (storeWordDescription.results.first?
                    .lexicalEntries.first?.lexicalCategory)!
                print(self.lexicalCategory)

                // Phonetic spelling
                self.phoneticSpelling = (storeWordDescription.results.first?
                    .lexicalEntries.first?.pronunciations.first?.phoneticSpelling)!
                print(self.phoneticSpelling)

                self.updateUI(with: self.storeWordDescription)
            }
        }
    }
    
    // Update the view with.
    func updateUI(with storeWordDescription: [StoreWordDescription]) {
        DispatchQueue.main.async {
            self.detail = ["\(currentWord)","\(self.longFinal)","\(self.examplePhrase)","\(self.grammaticalFeature)",
                "\(self.etymolFinal)","\(self.lexicalCategory)","\(self.phoneticSpelling)"]
            self.tableView.reloadData()
        }
    }
    
    // If row get selected change content of cell.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Used source for info:https://stackoverflow.com/questions/26158768/how-to-get-textlabel-of-selected-row-in-swift.
        let indexPath = tableView.indexPathForSelectedRow
        
        let currentCell = tableView.cellForRow(at: indexPath!) as UITableViewCell?
        
        // Set cell to data when selected.
        if cellOn == true {
            // Set Content.
            currentCell?.detailTextLabel?.text = moreInfo[(indexPath?.row)!]
            
            // Set Font.
            currentCell?.detailTextLabel?.font = currentCell?.detailTextLabel?.font.bold
            currentCell?.textLabel?.font.withSize(21)
            
            // Set bool when clicked.
            cellOn = false
            print(cellOn)
        } else {
            // Change content back to original data.
            self.tableView.reloadData()
            
            // Set bool when clicked.
            cellOn = true
            print(cellOn)
        }
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
    
    // Configure content of cell.
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        // Set text for Title and Detail.
        cell.textLabel?.text = generalTitle[indexPath.row]
        cell.detailTextLabel?.text = detail[indexPath.row]
    }
}
