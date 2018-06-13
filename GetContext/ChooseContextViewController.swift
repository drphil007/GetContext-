//
//  ChooseContextViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 07/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class ChooseContextViewController: UIViewController {

//    var storeWordInfo = [StoreWordInfo]()
    var storeTranslation = [StoreTranslation]()
    
    @IBOutlet weak var choosePhrasesButton: UIButton!
    @IBOutlet weak var chooseSocialTopicsButton: UIButton!
    
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set border for choosePhrasesButton, specifies layout styles.
        choosePhrasesButton.layer.borderWidth = 1
        choosePhrasesButton.layer.borderColor = UIColor.white.cgColor
        choosePhrasesButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)

        // Set border for chooseSocialTopicsButton, specifies layout styles.
        chooseSocialTopicsButton.layer.borderWidth = 1
        chooseSocialTopicsButton.layer.borderColor = UIColor.white.cgColor
        chooseSocialTopicsButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
 
        // Fetch data for Word Translation
        ContextController.shared.fetchWordTranslation( completion: { (wordTranslation) in
            if let wordTranslation = wordTranslation {
                print(wordTranslation)
                //self.wordTranslation = self.wordTranslation + wordTranslation
                //print(wordTranslation)
                //print("--------------------------------------------------------")
            }
        })
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
