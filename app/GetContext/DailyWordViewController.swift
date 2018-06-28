//
//  DailyWordViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 13/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class DailyWordViewController: UIViewController {

    var storeRandomWord = [StoreRandomWords]()
    var storeWordDescription = [StoreWordDescription]()
    
    // Set var for randomWord, which will be the dailyWord.
    var randomWord: String = ""
    
    // Set var for word description of randomword.
    var wordDescription: String = ""
    
    // Definition in JSON struct.
    var longDefinition: String = ""
    
    // Final definition extracted from struct.
    var longFinal: String = ""
    
    // Short definition in JSON struct.
    var shortDefinition: String = ""
    
    // Final short definition extracted from struct.
    var shortFinal: String = ""
    
    // Sub definition in JSON struct.
    var subDefinition: String = ""
    
    // Final sub definition extracted from struct.
    var subFinal: String = ""
    
    @IBOutlet weak var dailyWordLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var getContextButton: UIButton!
    
    // Sent randomWord to ChooseContext as currentWord when buttonPressed.
    @IBAction func getContextButtonPressed(_ sender: Any) {
        //currentWord = self.randomWord
        currentDescription = self.shortFinal
        
        // Go to Context View
         self.performSegue(withIdentifier: "getContext", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set border for getContextButton, specifies layout styles.
        getContextButton.layer.borderWidth = 1
        getContextButton.layer.borderColor = UIColor.white.cgColor
        getContextButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)

        // Fetch data for Daily Word.
        ContextController.shared.fetchRandomWord { (storeRandomWord) in
            if let storeRandomWord = storeRandomWord {
                self.randomWord = (storeRandomWord.results.first?.word)!
                print(self.randomWord)
                self.updateUI(with: self.storeRandomWord)
            }
        }
        
        // Fetch data for Description.
        ContextController.shared.fetchWordDescription { (storeWordDescription) in
            if let storeWordDescription = storeWordDescription {
                // Long Definition
                for longDefinition in (storeWordDescription.results.first?.lexicalEntries
                    .first?.entries.first?.senses.first?.definitions)! {
                    self.longFinal = longDefinition
                }
                print(self.longFinal)
                
                // Short definition
                for shortDefinition in (storeWordDescription.results.first?.lexicalEntries
                    .first?.entries.first?.senses.first?.shortDefinitions)! {
                    self.shortFinal = shortDefinition
                }
                print(self.shortFinal)
                
                // Sub definitions
                for subDefinition in (storeWordDescription.results.first?.lexicalEntries
                    .first?.entries.first?.senses.first?.subsenses?.first?.definitions)! {
                    self.subFinal = subDefinition
                }
                print(self.subFinal)
                
                self.updateUI(with: self.storeWordDescription)
            }
        }

    }

    // Update UI with showRandomWord.
    func updateUI(with storeRandomWord: [StoreRandomWords]) {
        DispatchQueue.main.async {
            self.showRandomWord(with: storeRandomWord)
        }
    }

    // Update the user interface with storeRandomWord from api.
    func updateUI(with storeWordDescription: [StoreWordDescription]) {
        DispatchQueue.main.async {
          self.showWordDescription(with: storeWordDescription)
        }
    }
    
    // Function to show a randomword.
    func showRandomWord (with storeRandomWords: [StoreRandomWords]) {
        //dailyWordLabel.text = self.randomWord
        dailyWordLabel.text = "best"
    }
    
    // Function to show the word description of randomWord.
    func showWordDescription (with storeWordDescription: [StoreWordDescription]) {
        descriptionLabel.text = self.longFinal
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
