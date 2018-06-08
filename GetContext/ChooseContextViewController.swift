//
//  ChooseContextViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 07/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class ChooseContextViewController: UIViewController {

    @IBOutlet weak var choosePhrasesButton: UIButton!
    @IBOutlet weak var chooseSocialTopicsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        choosePhrasesButton.layer.borderWidth = 1
        choosePhrasesButton.layer.borderColor = UIColor.white.cgColor
        choosePhrasesButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        
        chooseSocialTopicsButton.layer.borderWidth = 1
        chooseSocialTopicsButton.layer.borderColor = UIColor.white.cgColor
        chooseSocialTopicsButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)

        // Do any additional setup after loading the view.
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
