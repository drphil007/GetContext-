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
    
    // Set variabel for currentWord.
    var currentWord: String = ""
    
    var generalString: String = ""
    var phraseString: String = ""
    var socialString: String = ""
    
    @IBOutlet weak var generalDiscriptionLabel: UILabel!
    @IBOutlet weak var phrasesDiscriptionLabel: UILabel!
    @IBOutlet weak var socialDiscriptionLabel: UILabel!
    

    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set var for general info title.
        generalString = "BEST: \(currentDescription)"

        // Set var for phrases title.
        phraseString = "Everyday phrases with BEST"

        // Set var for social title.
        socialString = "Social Topics with BEST"
        
        // Turned off for demo.
//        generalString =  "\(currentWord.uppercased()): \(currentDescription)"
//        phraseString = "Everyday phrases with \(currentWord.uppercased())"
//        socialString = "Social Topics with \(currentWord.uppercased())"
    
        // Fetch data for Word Info
        self.generalDiscriptionLabel.text = self.generalString
        self.phrasesDiscriptionLabel.text = self.phraseString
        self.socialDiscriptionLabel.text = self.socialString
    }
    
      // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
