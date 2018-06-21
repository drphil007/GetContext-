//
//  EnterWordViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 07/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class EnterWordViewController: UIViewController {
 
    var shortDefinition: String = ""
    var shortFinal: String = ""
    var storeWordDescription = [StoreWordDescription]()
    
    @IBOutlet weak var wordField: UITextField!
    @IBOutlet weak var getContextButton: UIButton!
    
    @IBAction func wordFieldChanged(_ sender: UITextField) {
        // Set text to entered word
        currentWord = wordField.text!
//        setDescription()
    }
    
    @IBAction func getContextPressed(_ sender: Any) {
        // make sure user enters word
        if currentWord.isEmpty {
            createAlert(title: "Word Missing", message: "Enter a Word to continue")
        }
        else {
            print(currentWord)
            // Description not yet in right place called, doesn't go trough 
            setDescription()
//            print(currentDescription)
            // Go to Context View
            self.performSegue(withIdentifier: "getWord", sender: self)
        }
        print(currentWord)
        print("hey",currentDescription)
    }
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set border for getContextButton, specifies layout styles.
        getContextButton.layer.borderWidth = 1
        getContextButton.layer.borderColor = UIColor.white.cgColor
        getContextButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
    }
    
    func setDescription() {
        // Fetch data for Description.
        ContextController.shared.fetchWordDescription { (storeWordDescription) in
            if let storeWordDescription = storeWordDescription {
                // Short definition
                for shortDefinition in (storeWordDescription.results.first?.lexicalEntries.first?.entries.first?.senses.first?.shortDefinitions)! {
                    self.shortFinal = shortDefinition
                }
                print(self.shortFinal)
            }
        }
        
        currentDescription = self.shortFinal
    }
    
    // Function to create Alert message.
    func createAlert(title: String, message: String) {
        
        // Create alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // add Cancel button
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // add Text Field
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter word here..."
        })
        
        // add Ok button
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            // print name when entered
            if let currentWord = alert.textFields?.first?.text {
                print("Word: \(currentWord)")
                self.performSegue(withIdentifier: "getWord", sender: self)
            }
        }))
        // show alert
        self.present(alert, animated: true)
    }
    
    // Dispose of any recources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Pass data to the Context Views: Segue.
}

