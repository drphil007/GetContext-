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

    
    override func viewDidLoad() {
        super.viewDidLoad()

        startContextButton.layer.borderWidth = 1
        startContextButton.layer.borderColor = UIColor.white.cgColor
        startContextButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        
        dailywordButton.layer.borderWidth = 1
        dailywordButton.layer.borderColor = UIColor.white.cgColor
        dailywordButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        
        myWordsButton.layer.borderWidth = 1
        myWordsButton.layer.borderColor = UIColor.white.cgColor
        myWordsButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

