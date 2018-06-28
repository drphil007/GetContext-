//
//  ChooseContextViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 07/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class ChooseContextViewController: UIViewController {
    
    // Set var for short description.
    var shortFinal: String = ""
    
    // Set var for sub definition.
    var subDefinition: String = ""
    
    var storeWordDescription = [StoreWordDescription]()
    
    @IBOutlet weak var generalDiscriptionLabel: UILabel!
    @IBOutlet weak var phrasesDiscriptionLabel: UILabel!
    @IBOutlet weak var socialDiscriptionLabel: UILabel!
    
    // Set var for general info title.
    var gereneralString = "BEST: \(currentDescription)"
   
    // Set var for phrases title.
    var phraseString = "Everyday phrases with BEST"
    
    // Set var for social title.
    var socialString = "Social Topics with BEST"
    
    // Turned off for demo.
    //var gereneralString =  "\(currentWord.uppercased()): \(currentDescription)"
    //var phraseString = "Everyday phrases with \(currentWord.uppercased())"
    //var socialString = "Social Topics with \(currentWord.uppercased())"
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch data for Word Info
        self.generalDiscriptionLabel.text = self.gereneralString
        print(self.generalDiscriptionLabel.text!)
        self.phrasesDiscriptionLabel.text = self.phraseString
        self.socialDiscriptionLabel.text = self.socialString
    }
    
      // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
