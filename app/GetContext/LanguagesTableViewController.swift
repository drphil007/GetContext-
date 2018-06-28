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
    
    var bold: UIFont {
        return with(traits: .traitBold)
    } // bold
    
    func with(traits: UIFontDescriptorSymbolicTraits) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(traits) else {
            return self
        } // guard
        
        return UIFont(descriptor: descriptor, size: 0)
    } // with(traits:)
}

class LanguagesTableViewController: UITableViewController {
    
    var storeTranslation = [StoreTranslation]()
    
    // Languages to choose from.
    var languagesTitle = ["English",
                          "Spanish",
                          "Pedi",
                          "Zulu",
                          "Malay",
                          "Indonesion",
                          "Tswana",
                          "Urdu",
                          "German"]
    
    // Spoken language countries.
    let languagesCodes = ["US, UK, Canada, Australia, Ireland, New Zealand",
                          "Mexico, Colombia, Spain, Argentina",
                          "Northern Sotho; Africa",
                          "South Africa",
                          "Brunei, Indonesia, Malaysia",
                          "Indonesia",
                          "South Africa",
                          "Pakistan",
                          "Germany"]
    
    //  English sentence for Spanish translation.
    var esTranslation: String = ""

    // Spanish translation.
    var esTranslated: String = ""
    
    // English sentence for Pedi translation.
    var nsoTranslation: String = ""
    
    // Pedi translation.
    var nsoTranslated: String = ""
    
    // English sentence for Zulu translation.
    var zuTranslation: String = ""
    
    // Zulu translation.
    var zuTranslated: String = ""
    
    // English sentence for Malay translation.
    var msTranslation: String = ""
    
    // Malay translation.
    var msTranslated: String = ""
    
    // English sentence for Indonesion translation.
    var idTranslation: String = ""
    
    // Indonesion translation.
    var idTranslated: String = ""
    
    // English sentence for Tswana translation.
    var tnTranslation: String = ""
    
    // Tswana translation.
    var tnTranslated: String = ""
    
    // English sentence for Urdu translation.
    var urTranslation: String = ""
    
    // Urdu translation.
    var urTranslated: String = ""
    
    // English sentence for German translation.
    var deTranslation: String = ""
    
    // German translation.
    var deTranslated: String = ""
    
    // Set array for English sentences.
    var engPairs: [String] = []
    
    // Set array for translation.
    var transPairs: [String] = []
    
    // Demo array for English sentences.
    var demoEngPairs = ["EN: English Example Phrase ",
                        "EN: she gave her best ever performance",
                        "EN: Who is your best friend?",
                        "EN: Who is your best friend?",
                        "EN: No English translation",
                        "EN: that's the best film",
                        "EN: of the most excellent kind",
                        "EN: nil",
                        "EN: be best of all"]
    
    // Demo array for translation array.
    var demoTransPairs = ["TR: Translated Example Phrase",
                          "ES: actuó mejor que nunca",
                          "NSO: Mogwera wa gago yo kaonekaone ke mang?",
                          "ZU: Ubani umngane wakho obadlula bonke?",
                          "MS: paling baik",
                          "ID: itu film yang paling baik, itu film yang terbaik",
                          "TN: mo go gaisang",
                          "UR: No current translation",
                          "DE: am allerbesten sein"]
    
    // Bool for cell when clicked.
    var cellOn: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch data for Description.
        ContextController.shared.fetchWordTranslation { (storeTranslation) in
            if let storeTranslation = storeTranslation{
                
                // code for "if nil"
                // Example phrase in English
                // Example phrase
                
                // Translation English
                self.esTranslation = (storeTranslation.results.first?.lexicalEntries
                    .first?.entries.first?.senses.first?.subsenses!.first?.examples?.first?.text)!
                print(self.esTranslation)
                
                // Translation Other language (Spanish)
                // currentTargetLanguage = "es"
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

// Turned off for Demo.
//        // Set array with fetched data english sentences.
//        var engPairs = ["EN: \(self.esTranslation)",
//            "EN: \(self.nsoTranslation)",
//            "EN: \(self.zuTranslation)",
//            "EN: \(self.msTranslation)",
//            "EN: \(self.idTranslation)",
//            "EN: \(self.tnTranslation)",
//            "EN: \(self.urTranslation)",
//            "EN: \(self.deTranslation)"]
//
//        // Set array with fetched data translated sentences.
//        var transPairs = ["EN: ",
//            "ES: \(self.esTranslated)",
//            "NSO: \(self.nsoTranslated)",
//            "ZU: \(self.zuTranslated)",
//            "MS: \(self.msTranslated)",
//            "ID: \(self.idTranslated)",
//            "TN: \(self.tnTranslated)",
//            "UR: \(self.urTranslated)",
//            "DE: \(self.deTranslated)"]
    }
    
    func updateUI(with storeTranslation: [StoreTranslation]) {
        DispatchQueue.main.async {
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
            // Set Text.
            currentCell?.textLabel?.text = demoEngPairs[(indexPath?.row)!]
            currentCell?.detailTextLabel?.text = demoTransPairs[(indexPath?.row)!]
            
            // Set Font.
            currentCell?.textLabel?.font = currentCell?.textLabel?.font.withSize(21)
            currentCell?.detailTextLabel?.font = currentCell?.textLabel?.font.withSize(21)
            currentCell?.detailTextLabel?.font = currentCell?.textLabel?.font.bold
            cellOn = false
            print(cellOn)
        } else {
            // Set Text.
            currentCell?.textLabel?.text = languagesTitle[(indexPath?.row)!]
            currentCell?.detailTextLabel?.text = languagesCodes[(indexPath?.row)!]
            //self.tableView.reloadData()
            
            // Set Font.
            currentCell?.textLabel?.font = currentCell?.textLabel?.font.withSize(26)
            currentCell?.detailTextLabel?.font = currentCell?.textLabel?.font.withSize(21)
            cellOn = true
            print(cellOn)
        }
        //tableView.deselectRow(at: indexPath!, animated: true)
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
