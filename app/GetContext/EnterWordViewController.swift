//
//  EnterWordViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 07/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class EnterWordViewController: UIViewController {
 
    var storeWordDescription = [StoreWordDescription]()
    
    // Short definition in JSON struct.
    var shortDefinition: String = ""
    
    // Final short definition extracted from struct.
    var shortFinal: String = ""
    
    @IBOutlet weak var wordField: UITextField!
    @IBOutlet weak var getContextButton: UIButton!
    
    // Set word to input user.
    @IBAction func wordFieldChanged(_ sender: UITextField) {
        currentWord = wordField.text!
    }
    
    // When button pressed without word create alert.
    @IBAction func getContextPressed(_ sender: Any) {
        // make sure user enters word
        if (currentWord.isEmpty) {
            createAlert(title: "Word Missing", message: "Enter a Word to continue")
        }
        else {
            setDescription()
            
            // Sent currentWord to ChooseContextViewController.
            //let vc = self.tabBarController?.viewControllers![0] as! ChooseContextViewController
            //vc.currentWord = currentWord

            // Perform segue, go to ChooseContextViewController.
            self.performSegue(withIdentifier: "getWord", sender: self)
        }
    }
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set border for getContextButton, specifies layout styles.
        getContextButton.layer.borderWidth = 1
        getContextButton.layer.borderColor = UIColor.white.cgColor
        getContextButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
    }
    
    // Function to set description for currentWord.
    func setDescription() {
        // Fetch data for Description.
        ContextController.shared.fetchWordDescription { (storeWordDescription) in
            if let storeWordDescription = storeWordDescription {
                // Short definition
                for shortDefinition in (storeWordDescription.results.first?.lexicalEntries.first?.entries.first?.senses.first?.shortDefinitions)! {
                    self.shortFinal = shortDefinition
                }
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
            
            // Sent to next controller when word filled in.
            if (alert.textFields?.first?.text) != nil {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ChooseContextViewController {
            // push currenWord to ChooseContextViewController
        }
    }
}
