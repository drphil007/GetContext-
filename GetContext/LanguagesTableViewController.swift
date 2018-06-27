//
//  LanguagesTableViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 19/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

// Font extension.
extension UIFont {
    // Source: https://stackoverflow.com/questions/4713236/how-do-i-set-bold-and-italic-on-uilabel-of-iphone-ipad
    var italic: UIFont {
        return with(traits: .traitItalic)
    } // italic
    
    func with(traits: UIFontDescriptorSymbolicTraits) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(traits) else {
            return self
        } // guard
        
        return UIFont(descriptor: descriptor, size: 0)
    } // with(traits:)
}

class LanguagesTableViewController: UITableViewController {
    
    var storeTranslation = [StoreTranslation]()
    
    var languagesTitle = ["English",
                          "Spanish",
                          "Pedi; Northen Sotho; Africa",
                          "Zulu; South Africa",
                          "Malay",
                          "Indonesion",
                          "Tswana; South Africa",
                          "Urdu; Pakistan",
                          "German"]
    
    // Change to countries
    let languagesCodes = ["en",
                          "es",
                          "nso",
                          "zu",
                          "ms",
                          "id",
                          "tn",
                          "ur",
                          "de"]
    
    var esTranslation: String = ""

    var esTranslated: String = ""
    
    var nsoTranslation: String = ""
    
    var nsoTranslated: String = ""
    
    var zuTranslation: String = ""
    
    var zuTranslated: String = ""
    
    var msTranslation: String = ""
    
    var msTranslated: String = ""
    
    var idTranslation: String = ""
    
    var idTranslated: String = ""
    
    var tnTranslation: String = ""
    
    var tnTranslated: String = ""
    
    var urTranslation: String = ""
    
    var urTranslated: String = ""
    
    var deTranslation: String = ""
    
    var deTranslated: String = ""
    
    var engPairs: [String] = []
    
    var transPairs: [String] = []
    
    var demoEngPairs = ["EN: ",
                        "EN: she gave her best ever performance",
                        "EN: Who is your best friend?",
                        "EN: Who is your best friend?",
                        "EN: No English translation",
                        "EN: that's the best film",
                        "EN: of the most excellent kind",
                        "EN: nil",
                        "EN: be best of all \n "]
    
    var demoTransPairs = ["EN: ",
                          "ES: actuó mejor que nunca",
                          "NSO: Mogwera wa gago yo kaonekaone ke mang?",
                          "ZU: Ubani umngane wakho obadlula bonke?",
                          "MS: paling baik",
                          "ID: itu film yang paling baik, itu film yang terbaik",
                          "TN: mo go gaisang",
                          "UR: No current translation",
                          "DE: am allerbesten sein"]

    var cellOn: Bool = true

    var textToBeSent: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch data for Description.
        ContextController.shared.fetchWordTranslation { (storeTranslation) in
            if let storeTranslation = storeTranslation{
                
                // code for "if nil"
                // Example phrase in English
                
                // Translation English
                self.esTranslation = (storeTranslation.results.first?.lexicalEntries
                    .first?.entries.first?.senses.first?.subsenses!.first?.examples?.first?.text)!
                print(self.esTranslation)
                
                // Translation Other language (Spanish)
//                currentTargetLanguage = "es"
                self.esTranslated = (storeTranslation.results.first?.lexicalEntries
                    .first?.entries.first?.senses.first?.subsenses!.first?.examples?.first?.translations.first?.text)!
                print(self.esTranslated)
                
                // Translation English
                self.zuTranslation = (storeTranslation.results.first?.lexicalEntries
                    .first?.entries.first?.senses.first?.subsenses!.first?.examples?.first?.text)!
                print(self.zuTranslation)

                // Translation Other language (Pedi)
                currentTargetLanguage = "nso"
                self.nsoTranslated = (storeTranslation.results.first?.lexicalEntries
                    .first?.entries.first?.senses.first?.subsenses!.first?.examples?.first?.translations.first?.text)!
                print(self.nsoTranslated)
                
                // self.updateUI(with: self.storeTranslation)
            }
        }
    }
    
    func updateUI(with storeTranslation: [StoreTranslation]) {
        DispatchQueue.main.async {
            var engPairs = ["EN: \(self.esTranslation)",
                "EN: \(self.nsoTranslation)",
                "EN: \(self.zuTranslation)",
                "EN: \(self.msTranslation)",
                "EN: \(self.idTranslation)",
                "EN: \(self.tnTranslation)",
                "EN: \(self.urTranslation)",
                "EN: \(self.deTranslation)"]
            
            var transPairs = ["EN:: ",
                "ES: \(self.esTranslated)",
                "NSO: \(self.nsoTranslated)",
                "ZU: \(self.zuTranslated)",
                "MS: \(self.msTranslated)",
                "ID: \(self.idTranslated)",
                "TN: \(self.tnTranslated)",
                "UR: \(self.urTranslated)",
                "DE: \(self.deTranslated)"]
    
            //self.tableView.reloadData()
        }
    }
    
    // Change content cell when row selected.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Set indexpath to current row
        let indexPath = tableView.indexPathForSelectedRow

        // Set currentcell to current indexpath
        let currentCell = tableView.cellForRow(at: indexPath!) as UITableViewCell?
        
        // Set cell text. Bool now works for every cell: set bool to one row.
        if cellOn == true {
            currentCell?.textLabel?.text = demoEngPairs[(indexPath?.row)!]
            currentCell?.detailTextLabel?.text = demoTransPairs[(indexPath?.row)!]
            currentCell?.textLabel?.font = currentCell?.textLabel?.font.withSize(15)
            currentCell?.detailTextLabel?.font = currentCell?.textLabel?.font.withSize(21)
            cellOn = false
            print(cellOn)
        } else {
            self.tableView.reloadData()
            currentCell?.textLabel?.font = currentCell?.textLabel?.font.withSize(26)
            currentCell?.detailTextLabel?.font = currentCell?.textLabel?.font.withSize(15)
            cellOn = true
            print(cellOn)
        }
        tableView.deselectRow(at: indexPath!, animated: true)
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
    
    // Configure cell content.
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        
        // Set text for Title and detail.
        cell.textLabel?.text = languagesTitle[indexPath.row]
        cell.detailTextLabel?.text = languagesCodes[indexPath.row]
    }
}
