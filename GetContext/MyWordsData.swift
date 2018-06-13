//
//  MyWordsData.swift
//  GetContext
//
//  Created by Philine Wairata on 12/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import Foundation
import Firebase

struct MyWordsItem {
    let username: String
    let savedWord: String
    let savedPhrase: String
    let savedSocialTopic: String
}


//​* username: String
//​* |---------savedWord: String
//​* |-----------|--------savedPhrase: String
//​* |-----------|--------savedSocialTopic: url, title, description: String

// Remember the user name entered at the home view
var userName: String = ""

// Remember the user name index
var userIndex: Int = 0
