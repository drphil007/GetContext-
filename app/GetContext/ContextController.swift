//
//  ContextController.swift
//  GetContext
//
//  Created by Philine Wairata on 12/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import Foundation

class ContextController {
    
    // currentWord is word input from user or daily word
    static let shared = ContextController()
    
    //App id for API https://developer.oxforddictionaries.com/
    let appId = "95c26713"
    
    // App key for API https://developer.oxforddictionaries.com/
    let appKey = "0541f5d55a33a989697d99e8947353e1"

//    let chooseWords = [ "able",
                //        bad
                //        best
                //        better
                //        big
                //        black
                //        certain
                //        clear
                //        different
                //        early
                //        easy
                //        economic
                //        federal
                //        free
                //        full
                //        good
                //        great
                //        hard
                //        high
                //        human
                //        important
                //        international
                //        large
                //        late
                //        little
                //        local
                //        long
                //        low
                //        major
                //        military
                //        national
                //        new
                //        old
                //        only
                //        other
                //        political
                    //    possible
                    //    public
                    //    real
                    //    recent
                    //    right
                    //    small
                    //    social
                    //    special
                    //    strong
                    //    sure
                    //    true
                    //    white
                    //    whole
                    //    young]


    // MARK - Function to get a (random) word from oxforddictionaries API.
    func fetchRandomWord(completion: @escaping (StoreRandomWords?) -> Void) {
        
        // Variables for request.
        let language = "en"
        let filters = "registers%3DRare%3Bdomains%3DArt?"
        let limit = "limit=1"
       
        // Build url for request.
        let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v1/wordlist/\(language)/\(filters)\(limit)")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")

        // Fetch data.
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                let storeRandomWords = try JSONDecoder().decode(StoreRandomWords.self, from: data)
                //print(storeRandomWords)
                completion(storeRandomWords)
                } catch {
                    print(error)
                }
            } else {
                print(error as Any)
                print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue)!)
            }
        }
        task.resume()
    }

    // MARK: - Function to get Word Info from oxforddictionaries API.
    func fetchWordDescription(completion: @escaping (StoreWordDescription?) -> Void) {
        
        // Variables for request.
        let language = "en"
        currentWord = "best" // Demo word.
        let word = "\(currentWord)"
        print(currentWord)
        let word_id = word.lowercased() //word id is case sensitive and lowercase is required
        let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v1/entries/\(language)/\(word_id)")!
        var request = URLRequest(url: url)
        
        // Build url for request.
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")
       
        // Fetch data.
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let storeWordDiscription = try JSONDecoder().decode(StoreWordDescription.self, from: data)
                    //print(storeWordDiscription)
                    completion(storeWordDiscription)
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                print(error as Any)
                print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue)!)
            }
        }
        task.resume()
    }
    
    // MARK: - Function to get Word Translation from oxforddictionaries API.
    func fetchWordTranslation(completion: @escaping (StoreTranslation?) -> Void) {
       
        // Variables for request.
        let language = "en"
        currentTargetLanguage = "es"
        let target_lang = "\(currentTargetLanguage)"
        let word = "change"
        let word_id = word.lowercased() //word id is case sensitive and lowercase is required
       
        
        // Build url for request.
        let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v1/entries/\(language)/\(word_id)/translations=\(target_lang)")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")
        
        // Fetch data.
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let storeTranslation = try JSONDecoder().decode(StoreTranslation.self, from: data)
                    print(storeTranslation)
                    completion(storeTranslation)
                } catch {
                    print(error)
                }
            } else {
                print(error as Any)
                print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue)!)
            }
        }
        task.resume()
    }
    
    // MARK: - Social Context from Google Search Custom API.
    func fetchSocialContext(completion: @escaping (StoreSocialContext?) -> Void) {
        
        // Variables to build request.
        let apiKey = "AIzaSyA9yV1lOOWbUv0RLNZ_M_XVuNXmTsU1x0I"
        let bundleID = "com.mprog.GetContext"
        let searchKey = "006207088670286226506:ci6ag3ipfoi"
        let query = "Best"
        
        // Build url for request.
        let serverAddress = String(format: "https://www.googleapis.com/customsearch/v1?q=\(query)&key=\(apiKey)&cx=\(searchKey)")
        let url = serverAddress.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let finalUrl = URL(string: url!)
        let request = NSMutableURLRequest(url: finalUrl!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        request.httpMethod = "GET"
        request.setValue(bundleID, forHTTPHeaderField: "X-Ios-Bundle-Identifier")
        
        let session = URLSession.shared
        //        let jsonString = ""
        
        // Fetch data.
        let datatask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            do {
                                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary{
                                    print("asyncResult\(jsonResult)")
                                }
                //                if let jsonData = jsonString.data(using: .utf8)
                //                {
                //                    let obj = try? JSONDecoder().decode(StoreSocialContext.self, from: jsonData)
                //                    print(obj?.items as Any)
                //                }
//                let storeSocialContext = try?
//                    JSONDecoder().decode(StoreSocialContext.self, from: data!)
//                print(storeSocialContext?.items as Any)
//                completion(storeSocialContext)
                print("social test")
            }
            catch let error as NSError{
                print(error.localizedDescription)
            }
        }
        datatask.resume()
    }
}
