//
//  ChooseContextViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 07/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class ChooseContextViewController: UIViewController {
    
    @IBOutlet weak var generalDiscriptionLabel: UILabel!
    @IBOutlet weak var phrasesDiscriptionLabel: UILabel!
    @IBOutlet weak var socialDiscriptionLabel: UILabel!
    

    //    var storeWordInfo = [StoreWordInfo]()
    var storeTranslation = [StoreTranslation]()
    
    var myString = "Everyday phrases with \(currentWord)!"
    var myMutableString = NSMutableAttributedString()
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // set Labels to relevent word info
       generalDiscriptionLabel.text = "\(currentWord.uppercased()): \(currentDiscription)"
       phrasesDiscriptionLabel.text = "Everyday phrases with \(currentWord.uppercased())"
       socialDiscriptionLabel.text = "Social Topics with \(currentWord.uppercased())"
    
       //  Fetch data for Word Translation
//        ContextController.shared.fetchWordTranslation( completion: { (wordTranslation) in
//            if let wordTranslation = wordTranslation {
//                print(wordTranslation)
//                //self.wordTranslation = self.wordTranslation + wordTranslation
//                //print(wordTranslation)
//                //print("--------------------------------------------------------")
//            }
//        })
        
        //        // Fetch data for Word Info
        //        ContextController.shared.fetchWordInfo( completion: { (storeWordInfo) in
        //            if let storeWordInfo = storeWordInfo {
        //                print(storeWordInfo)
        //                //self.storeWordInfo = self.storeWordInfo + storeWordInfo
        //                //print(storeWordInfo)
        //                //print("--------------------------------------------------------")
        //            }
        //        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
