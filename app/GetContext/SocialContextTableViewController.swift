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
    
    // MARK: - Variables for social titles.
    var socialTitle0: String = ""
    var socialTitle1: String = ""
    var socialTitle2: String = ""
    
    // MARK: - Variables for social description.
    var socialDescription0: String = ""
    var socialDescription1: String = ""
    var socialDescription2: String = ""
    
    // MARK: - Variables for social Images.
    var socialImage0: String = ""
    var socialImage1: String = ""
    var socialImage2: String = ""
    
    // Set array for cell title.
    var socialArray: [String] = []
    
    // Set array for cell detail.
    var detailArray: [String] = []
    
    // Set array for images.
    var imageArray: [String] = []
    
    // MARK: - DemoArrays
    var demoTitleArray = ["Definition of BEST","Best Countries for Buisness List"]
    var demoDetailArray = ["Best definition is - excelling all others. How to use best in a sentence",
                           "The U.S. continues its 6 year slide as Denmark repeats at the top in Forbes' annual Best Countries for Buisness."]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // FetchSocialContext. Fetch titles, descriptions and images.
        ContextController.shared.fetchSocialContext { (storeSocialContext) in
            if let storeSocialContext = storeSocialContext {
                
                // Turned off for demo.
          
                //  Set title when value not nill.
                if (storeSocialContext.items?[0].metatags?.first?.title) != nil {
                    
                    // Set title.
                    self.socialTitle0 = (storeSocialContext.items?[0].metatags?.first?.title)!
                    
                    // If description not nill, add value otherwise set message.
                    if (storeSocialContext.items?[0].metatags?.first?.description) != nil {
                        self.socialDescription0 = (storeSocialContext.items?[0].metatags?.first?.description)!
                    } else {
                        self.socialDescription0 = "currently not available."
                    }
                    
                    // If image nill, add value otherwise set message.
                    if (storeSocialContext.items?[0].metatags?.first?.image) != nil {
                        self.socialImage0 = (storeSocialContext.items?[0].metatags?.first?.image)!
                    } else {
                        self.socialImage0 = "currently not available."
                    }
                } else {
                    // Set values when title nill.
                    self.socialTitle0 = "currently not available."
                    self.socialDescription0 = "currently not available."
                    self.socialImage0 = "currently not available."
                }
                
                //  Set title when value not nill.
                if (storeSocialContext.items?[1].metatags?.first?.title) != nil  {
                    
                    //Set title.
                    self.socialTitle1 = (storeSocialContext.items?[1].metatags?.first?.title)!
                    
                    // If description not nill, add value otherwise set message.
                    if (storeSocialContext.items?[1].metatags?.first?.description) != nil {
                        self.socialDescription1 = (storeSocialContext.items?[1].metatags?.first?.description)!
                    } else {
                        self.socialDescription1 = "currently not available."
                    }
                    
                    // If image nill, add value otherwise set message.
                    if (storeSocialContext.items?[1].metatags?.first?.image) != nil {
                        self.socialImage1 = (storeSocialContext.items?[1].metatags?.first?.image)!
                    } else {
                        self.socialImage1 = "currently not available."
                    }
                } else {
                    // Set values when title nill.
                    self.socialTitle1 = "currently not available."
                    self.socialDescription1 = "currently not available."
                    self.socialImage1 = "currently not available."
                }
                
                //  Set title when value not nill.
                if (storeSocialContext.items?[2].metatags?.first?.title) != nil {
                
                    // Set title.
                    self.socialTitle2 = (storeSocialContext.items?[2].metatags?.first?.title)!
                    
                    // If description not nill, add value otherwise set message.
                    if (storeSocialContext.items?[2].metatags?.first?.description) != nil {
                        self.socialDescription2 = (storeSocialContext.items?[2].metatags?.first?.description)!
                    } else {
                        self.socialDescription2 = "currently not available."
                    }
                    
                    // If image nill, add value otherwise set message.
                    if (storeSocialContext.items?[2].metatags?.first?.image) != nil {
                        self.socialImage2 = (storeSocialContext.items?[2].metatags?.first?.image)!
                    } else {
                        self.socialImage2 = "currently not available."
                    }
                } else {
                    // Set values when title nill.
                    self.socialTitle2 = "currently not available."
                    self.socialDescription2 = "currently not available."
                    self.socialImage2 = "currently not available."
                }
                
            }
                //self.updateUI(with: self.storeSocialContext) // Turned of for demo.
        }
    }
    
    // Update UI with.
    func updateUI(with storeSocialContext: [StoreSocialContext]) {
        DispatchQueue.main.async {
            self.socialArray = ["\(self.socialTitle0)","\(self.socialTitle1)","\(self.socialTitle2)"]
            self.detailArray = ["\(self.socialDescription0)","\(self.socialDescription1)","\(self.socialDescription2)"]
            self.imageArray = ["\(self.socialImage0)","\(self.socialImage1)","\(self.socialImage2)"]
            //self.tableView.reloadData()
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
          return demoTitleArray.count
          // return 1
    }
    
    // Set content for cells.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "socialCell", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    // Configure cell content.
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        
        // Set text for Title and Detail.
        cell.textLabel?.text = demoTitleArray[indexPath.row]
        cell.detailTextLabel?.text = demoDetailArray[indexPath.row]
        
        // Turned of for Demo.
        //cell.textLabel?.text = socialArray[indexPath.row]
        //cell.detailTextLabel?.text = detailArray[indexPath.row]
        // cell.imageView!.image = image;
    }
}
