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
    @IBOutlet weak var dailywordButton: UIButton!
    @IBOutlet weak var myWordsButton: UIButton!

    
    @IBAction func enterNameTapped(_ sender: UITextField) {
        // Set user Index
        userIndex += 1
        
        // Set text to username of current player.
        if let text = sender.text {
            userName = text
            if userName.isEmpty {
                userName = "User \(userIndex)"
            }
        }
        print(userName)
    }
    
    // Do any additional setup after loading the view, typically from a nib.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set border for startContextButton, specifies layout styles.
        startContextButton.layer.borderWidth = 1
        startContextButton.layer.borderColor = UIColor.white.cgColor
        startContextButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        
        // Set border for dailywordButton, specifies layout styles.
        dailywordButton.layer.borderWidth = 1
        dailywordButton.layer.borderColor = UIColor.white.cgColor
        dailywordButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        
        // Set border for myWordsButton, specifies layout styles.
        myWordsButton.layer.borderWidth = 1
        myWordsButton.layer.borderColor = UIColor.white.cgColor
        myWordsButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
       
        // Set name field.
        enterNameField.delegate = self as? UITextFieldDelegate
        
    }
    
    // Set textfield to entered text.
    func textFieldSet(_ textField: UITextField) -> Bool {
        if textField == enterNameField {
            textField.resignFirstResponder()
        }
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

