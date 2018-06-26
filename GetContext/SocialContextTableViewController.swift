//
//  SocialContextTableViewController.swift
//  GetContext
//
//  Created by Philine Wairata on 12/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import UIKit

class SocialContextTableViewController: UITableViewController {

    var storeSocialContext = [StoreSocialContext]()
    var socialTry: String = ""
    
    var socialArray: [String] = []
    var detailArray: [String] = []
    var imagaArray: [String] = []
    // var thumbNail
    // var imageSocial
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // FetchSocialContext
        ContextController.shared.fetchSocialContext { (storeSocialContext) in
            if let storeSocialContext = storeSocialContext {
                print("\n\n\n")
                
                
//                self.socialTry = (storeSocialContext.items?.first?.metatags?.first?.title)!
//                print(self.socialTry)
                
                // load web views + thumnails
                // if first is nil
                    // else do next
                    // else if still nill
                        // print "No current sources"
                
                // load images
                // set defaul in case of nill
//
//                self.updateUI(with: self.storeSocialContext)
            }
        }
        
//        self.socialArray = ["\(self.socialTry)"]
        
    }
    

    func updateUI(with storeSocialContext: [StoreSocialContext]) {
        DispatchQueue.main.async {
           
            //self.imagaArray = ["MW.jpgf"]
            self.tableView.reloadData()
        }
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // Return the number of sections.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Set amount of rows to objects in list.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          //return socialArray.count
          return 1
    }
    
    // Set content for cells.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "socialCell", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        // Set text for Title and Detail.
        
        //cell.textLabel?.text = socialArray[indexPath.row]
        //cell.detailTextLabel?.text = [indexPath.row]
        cell.textLabel?.text = "Definition of BEST"
        cell.detailTextLabel?.text = "Best definition is - excelling all others. How to use best in a sentence"
        
        // thumbnail
        //cell.imageView!.image = image;
        
        // Set text font.
        cell.textLabel?.font = UIFont (name: "Heavy System", size: 40)
        cell.detailTextLabel?.font = UIFont (name: "Heavy System", size: 20)
    }
    
}
