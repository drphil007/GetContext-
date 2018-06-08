//
//  EnterWordViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 07/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class EnterWordViewController: UIViewController {

    @IBOutlet weak var getContextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getContextButton.layer.borderWidth = 1
        getContextButton.layer.borderColor = UIColor.white.cgColor
        getContextButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)

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
