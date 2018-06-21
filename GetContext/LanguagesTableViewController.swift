//
//  LanguagesTableViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 19/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class LanguagesTableViewController: UITableViewController {

    var wordTranslation: String = ""
    var wordTranslated: String = ""
    var storeTranslation = [StoreTranslation]()
    var languagesTitle = ["English", "Spanish","Pedi; Northen Sotho; Africa","Zulu; South Africa","Malay","Indonesion","Tswana; South Africa","Urdu; Pakistan","German"]
    let languagesCodes = ["en","es","nso","zu","ms","id","tn","ur","de"]
    var allTransPairs : [String] = []

    var textToBeSent: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch data for Description.
        ContextController.shared.fetchWordTranslation { (storeTranslation) in
            if let storeTranslation = storeTranslation{
                
                // code for "if nil"
                
                // Translation English
                self.wordTranslation = (storeTranslation.results.first?.lexicalEntries.first?.entries.first?.senses.first?.subsenses!.first?.examples?.first?.text)!
                print(self.wordTranslation)
                
                // Translation Other language (Spanish)
//                currentTargetLanguage = "es"
                self.wordTranslated = (storeTranslation.results.first?.lexicalEntries.first?.entries.first?.senses.first?.subsenses!.first?.examples?.first?.translations.first?.text)!
                print(self.wordTranslated)
                
                self.updateUI(with: self.storeTranslation)
            }
        }
            
        // Fetch data for Translation.
//        ContextController.shared.fetchWordTranslation { (storeTranslation) in
//            if let storeTranslation = storeTranslation{
//
//                // code for "if nil"
//
//                // Translation English
//                self.wordTranslation = (storeTranslation.results.first?.lexicalEntries.first?.entries.first?.senses.first?.subsenses!.first?.examples?.first?.text)!
//                print(self.wordTranslation)
//
//                // Translation Other language (Pedi)
//                currentTargetLanguage = "nso"
//                self.wordTranslated = (storeTranslation.results.first?.lexicalEntries.first?.entries.first?.senses.first?.subsenses!.first?.examples?.first?.translations.first?.text)!
//                print(self.wordTranslated)
//
//                self.updateUI(with: self.storeTranslation)
//            }
//        }
    }
    
    func updateUI(with storeTranslation: [StoreTranslation]) {
        DispatchQueue.main.async {
            self.allTransPairs = ["\(self.wordTranslation)","\(self.wordTranslated)","test","","","","","","test"]
            
            
            //self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//       currentTargetLanguage = "es"
       languagesTitle = self.allTransPairs
       self.tableView.reloadData()
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
        return languagesTitle.count
    }
    
    // Set content for cells.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        // Set text for Title and detail.
        cell.textLabel?.text = languagesTitle[indexPath.row]
        cell.detailTextLabel?.text = languagesCodes[indexPath.row]
        
        // Set text font.
        cell.textLabel?.font = UIFont (name: "Heavy System", size: 40)
        cell.detailTextLabel?.font = UIFont (name: "Heavy System", size: 20)
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        textToBeSent = languagesTitle[indexPath.section][indexPath.row]
//    }
}
