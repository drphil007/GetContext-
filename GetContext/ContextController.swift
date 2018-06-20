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
    
    
    //own app id and app key
    let appId = "95c26713"
    let appKey = "0541f5d55a33a989697d99e8947353e1"
//
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


    // Function to get a (random) word from oxforddictionaries API, category: Art.https://developer.oxforddictionaries.com/documentation
    func fetchRandomWord(completion: @escaping (StoreRandomWords?) -> Void) {
        let language = "en"
//        let filters = "registers=Rare;domains=Art"
        let filters = "registers%3DRare%3Bdomains%3DArt?"
        let limit = "limit=1"
        let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v1/wordlist/\(language)/\(filters)\(limit)")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")

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

    // Function to get Word Info from oxforddictionaries API https://developer.oxforddictionaries.com/documentation.
    func fetchWordDescription(completion: @escaping (StoreWordDescription?) -> Void) {
        // Set language is languge from inputed word. For now set to Eng.
        let language = "en"
        // Set word is currentWord from input or from daily word.
        let word = "best"
        let word_id = word.lowercased() //word id is case sensitive and lowercase is required
        let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v1/entries/\(language)/\(word_id)")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")
       
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
    
    // Function to get Word Translation from oxforddictionaries API https://developer.oxforddictionaries.com/documentation.
    func fetchWordTranslation(completion: @escaping (StoreTranslation?) -> Void) {
        // Set language is languge from inputed word. For now set to Eng.
        let language = "en"
        // Target language should be any possible translations.
        let target_lang = "es"
        let word = "Change"
        let word_id = word.lowercased() //word id is case sensitive and lowercase is required
        let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v1/entries/\(language)/\(word_id)/translations=\(target_lang)")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")
        
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
    
    // Social Context
//    func fetchSocialContext(completion: @escaping (StoreSocialContext?) -> Void) {
//    }
}
