//
//  DailyWordViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 13/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class DailyWordViewController: UIViewController {

    var storeRandomWord = [StoreRandomWords]()
    var storeWordDescription = [StoreWordDescription]()
  
    @IBOutlet weak var dailyWordLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var getContextButton: UIButton!
    
    @IBAction func getContextButtonPressed(_ sender: Any) {
        // Go to Context View
         self.performSegue(withIdentifier: "getContext", sender: self)
    }
    
     // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set border for getContextButton, specifies layout styles.
        getContextButton.layer.borderWidth = 1
        getContextButton.layer.borderColor = UIColor.white.cgColor
        getContextButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        
//        // Fetch data for Daily Word.
//        ContextController.shared.fetchRandomWord( completion: { (storeRandomWord) in
//            if let storeRandomWord = storeRandomWord {
//                print(storeRandomWord)
////                self.storeRandomWord = self.storeRandomWord + storeRandomWord
////                self.updateUI(with: self.storeRandomWord)
//                print(storeRandomWord)
//                print("--------------------------------------------------------")
//            }
//        })
//
//        // Fetch data for Description.
//        ContextController.shared.fetchWordDescription(completion: { (storeWordDescription) in
//            print(storeWordDescription)
//            if let storeWordDescription = storeWordDescription {
//                print(storeWordDescription.metadata)
////                 self.storeWordDescription = String(self.storeWordDescription) + String(storeWordDescription)
////                 self.updateUI(with: self.storeWordDescription)
//                 //print(storeWordDescriptionA)
//                print("--------------------------------------------------------")
//            }
//        })
//    }
    }

    // Update the user interface with storeRandomWord from api.
    func updateUI(with storeRandomWord: [StoreRandomWords]) {
        DispatchQueue.main.async {
            //self.showRandomWord(with: storeRandomWords)
            //self.showWordDescription(with: storeWordDescription)
        }
    }

    func showRandomWord(with storeRandomWord: [StoreRandomWords]) {
        // if
    }
    
    func showWordDescription(with storeWordDescription: [StoreWordDescription]) {
        // if
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
