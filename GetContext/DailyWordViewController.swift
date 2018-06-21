//
//  DailyWordViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 13/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class DailyWordViewController: UIViewController {

    var randomWord: String = ""
    var wordDescription: String = ""
    var storeRandomWord = [StoreRandomWords]()
    
    var longDefinition: String = ""
    var longFinal: String = ""
    var shortDefinition: String = ""
    var shortFinal: String = ""
    var subDefinition: String = ""
    var subFinal: String = ""
    var storeWordDescription = [StoreWordDescription]()
  
    @IBOutlet weak var dailyWordLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var getContextButton: UIButton!
    
    @IBAction func getContextButtonPressed(_ sender: Any) {
        // Sent randomWord to ChooseContext as currentWord
        currentWord = self.randomWord
        currentDescription = self.shortFinal
        // Go to Context View
         self.performSegue(withIdentifier: "getContext", sender: self)
    }
    
     // Do any additional setup after loading the view.
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
                for longDefinition in (storeWordDescription.results.first?.lexicalEntries.first?.entries.first?.senses.first?.definitions)! {
                    self.longFinal = longDefinition
                }
                print(self.longFinal)
                
                // Short definition
                for shortDefinition in (storeWordDescription.results.first?.lexicalEntries.first?.entries.first?.senses.first?.shortDefinitions)! {
                    self.shortFinal = shortDefinition
                }
                print(self.shortFinal)
                
                // Sub definitions
                for subDefinition in (storeWordDescription.results.first?.lexicalEntries.first?.entries.first?.senses.first?.subsenses?.first?.definitions)! {
                    self.subFinal = subDefinition
                }
                print(self.subFinal)
                
                self.updateUI(with: self.storeWordDescription)
            }
        }

    }

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
    
    func showRandomWord (with storeRandomWords: [StoreRandomWords]) {
        dailyWordLabel.text = self.randomWord
    }
    
    func showWordDescription (with storeWordDescription: [StoreWordDescription]) {
        descriptionLabel.text = self.longFinal
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
