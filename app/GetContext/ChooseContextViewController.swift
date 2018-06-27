//
//  ChooseContextViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 07/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class ChooseContextViewController: UIViewController {
    
    var shortFinal: String = ""
    var subDefinition: String = ""
    var storeWordDescription = [StoreWordDescription]()
    
    @IBOutlet weak var generalDiscriptionLabel: UILabel!
    @IBOutlet weak var phrasesDiscriptionLabel: UILabel!
    @IBOutlet weak var socialDiscriptionLabel: UILabel!
    
    //var gereneralString =  "\(currentWord.uppercased()): \(currentDescription)"
    var gereneralString = "BEST: \(currentDescription)"
    //var phraseString = "Everyday phrases with \(currentWord.uppercased())"
    var phraseString = "Everyday phrases with BEST"
    //var socialString = "Social Topics with \(currentWord.uppercased())"
    var socialString = "Social Topics with BEST"
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch data for Word Info
        self.generalDiscriptionLabel.text = self.gereneralString
        print(self.generalDiscriptionLabel.text!)
        self.phrasesDiscriptionLabel.text = self.phraseString
        self.socialDiscriptionLabel.text = self.socialString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Sent currentWord to next Controller. (General & Phrases)
}
