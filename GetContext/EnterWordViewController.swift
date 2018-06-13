//
//  EnterWordViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 07/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class EnterWordViewController: UIViewController {
 
    @IBOutlet weak var wordField: UITextField!
    @IBOutlet weak var getContextButton: UIButton!
    
    
    @IBAction func wordFieldChanged(_ sender: UITextField) {
        // Set text to entered word
        // keep CurrentWord and send to Context
        // make sure user enters word
    }
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set border for getContextButton, specifies layout styles.
        getContextButton.layer.borderWidth = 1
        getContextButton.layer.borderColor = UIColor.white.cgColor
        getContextButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
    }
    
    // Dispose of any recources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Pass data to the Context Views: Segue.
}
