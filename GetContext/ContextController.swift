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
//
//    // Function to get a (random) word from oxforddictionaries API, category: Art.
//    // Documentation instruction at https://developer.oxforddictionaries.com/documentation
//    func fetchRandomWord(completion: @escaping (StoreRandomWords?) -> Void) {
//        let language = "en"
////        let filters = "registers=Rare;domains=Art"
//        let filters = "registers%3DRare%3Bdomains%3DArt?"
//        let limit = "limit=1"
//        let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v1/wordlist/\(language)/\(filters)\(limit)")!
//        var request = URLRequest(url: url)
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.addValue(appId, forHTTPHeaderField: "app_id")
//        request.addValue(appKey, forHTTPHeaderField: "app_key")
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let response = response,
//                let data = data,
//                let jsonData = try? JSONDecoder().decode([StoreRandomWords].self, from: data) {
//                //let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {st
//      //          print(response)
//                print(jsonData)
//            } else {
//                print(error)
//                print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue)!)
//            }
//        }
//        task.resume()
//    }
//
//    // Function to get Word Info from oxforddictionaries API.
//    // Documentation instruction at https://developer.oxforddictionaries.com/documentation
//    func fetchWordDescription(completion: @escaping (StoreWordDescription?) -> Void) {
//        // Set language is languge from inputed word. For now set to Eng.
//        let language = "en"
//        // Set word is currentWord from input or from daily word.
//        let word = "eurhythmic"
//        let word_id = word.lowercased() //word id is case sensitive and lowercase is required
//        let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v1/entries/\(language)/\(word_id)")!
//        var request = URLRequest(url: url)
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.addValue(appId, forHTTPHeaderField: "app_id")
//        request.addValue(appKey, forHTTPHeaderField: "app_key")
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let response = response,
//                let data = data,
//                let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
//         //       print(response)
//        //      print(jsonData)
//            } else {
//                print(error!)
//                print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue)!)
//            }
//        }
//        task.resume()
//    }
    
    // Function to get Word Translation from oxforddictionaries API.
    // Documentation instruction at https://developer.oxforddictionaries.com/documentation
    func fetchWordTranslation(completion: @escaping (StoreTranslation?) -> Void) {
        // Set language is languge from inputed word. For now set to Eng.
        let language = "en"
        // Target language should be any possible translations.
        let target_lang = "zu"
        let word = "Change"
        let word_id = word.lowercased() //word id is case sensitive and lowercase is required
        let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v1/entries/\(language)/\(word_id)/translations=\(target_lang)")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response,
                let data = data,
                let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                print(response)
                print(jsonData)
            } else {
                print(error!)
                print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue)!)
            }
        }
        task.resume()
    }
    
    // Social Context
    func fetchSocialContext(completion: @escaping (StoreSocialContext?) -> Void) {
//        let query = "q=technology" // "q=\(currentWord)"
//        let limit = "n=1"
//        let expand = "true"
//        let url = URL(string: "http://api.trendspottr.com/v1.5/search?/\(qu")
//        var request = UR:
    }
    
}
