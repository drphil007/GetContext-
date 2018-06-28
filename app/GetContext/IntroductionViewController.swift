//
//  ViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 04/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    @IBOutlet weak var startNow: UIButton!
    
    // Do any additional setup after loading the view, typically from a nib.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set border for startNow, specifies layout styles.
        startNow.layer.borderWidth = 1
        startNow.layer.borderColor = UIColor.white.cgColor
        startNow.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
    }
    
    // Go to Tab Bar when button pressed.
    @IBAction func startNowPressed(_ sender: Any) {
         self.performSegue(withIdentifier: "startContext", sender: self)
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
