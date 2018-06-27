//
//  ViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 04/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    @IBOutlet weak var enterNameField: UITextField!
    @IBOutlet weak var startContextButton: UIButton!
    
    @IBAction func enterNameTapped(_ sender: UITextField) {
        // Set user Index
        userIndex += 1
        
        // set username to entered text
        userName = enterNameField.text!
        //print(userName)
        
        // send to firebase and log in (for mywords)
    }
    
    // Do any additional setup after loading the view, typically from a nib.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set border for startContextButton, specifies layout styles.
        startContextButton.layer.borderWidth = 1
        startContextButton.layer.borderColor = UIColor.white.cgColor
        startContextButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
       
//        // Set name field.
//        enterNameField.delegate = self as? UITextFieldDelegate
    }
    
    @IBAction func startPressed(_ sender: Any) {
        if (userName.isEmpty) {
            // Create Alert with function createAlert
            nameAlert(title: "Name missing", message: "Enter your name to continue")
        }
        else {
            // Go to next view of game
            print(userName)
            startAlert(title: "All Set", message: "Remember username next time?")
            
            //self.performSegue(withIdentifier: "startContext", sender: self)
        }
    }
    
    // Function to create Alert message.
    func nameAlert(title: String, message: String) {
        
        // Create alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // add Cancel button
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // add Text Field
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter name here..."
        })
        
        // add Ok button
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            // print name when entered
            if let name = alert.textFields?.first?.text {
                print("Your name: \(name)")
                self.performSegue(withIdentifier: "startContext", sender: self)
            }
        }))
        // show alert
        self.present(alert, animated: true)
    }
    
    func startAlert(title: String, message: String) {
        
        // Create alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // add Cancel button
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // add Ok button
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            // print name when entered
            if let name = alert.textFields?.first?.text {
                print("Your name: \(name)")
                self.performSegue(withIdentifier: "startContext", sender: self)
            }
        }))
        // show alert
        self.present(alert, animated: true)
        
        
    }
    
//    // Set textfield to entered text.
//    func textFieldSet(_ textField: UITextField) -> Bool {
//        if textField == enterNameField {
//            textField.resignFirstResponder()
//        }
//        return true
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

