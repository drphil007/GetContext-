//
//  ContextData.swift
//  GetContext
//
//  Created by Philine Wairata on 12/06/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import Foundation
import UIKit

// Set variabel for randomWord.
var randomWord: String = ""

// Set variabel for currentWord.
var currentWord: String = ""

// Set Variabel for currentWord
var currentDiscription: String = ""

// Set variabel for randomWordIndex.
var randomWordIndex = 0

// Struct RandomWords
struct StoreRandomWords: Codable {
    let results: [RandomResult]
}

struct RandomResult: Codable {
    let word: String
}

// Struct Description of word, word-info.
struct StoreWordDescription: Codable {
    let results: [Result]
}

struct Result: Codable {
    let id, language: String
    let lexicalEntries: [LexicalEntry]
    let type, word: String
}

struct LexicalEntry: Codable {
    let entries: [Entry]
    let language, lexicalCategory: String
    let pronunciations: [Pronunciation]
    let text: String
}

struct Entry: Codable {
    let etymologies: [String]?
    let grammaticalFeatures: [GrammaticalFeature]
    let homographNumber: String
    let senses: [Sense]
}

struct GrammaticalFeature: Codable {
    let text, type: String
}

struct Sense: Codable {
    let definitions: [String]
    let domains: [String]?
    let examples: [SenseExample]
    let id: String
    let shortDefinitions: [String]
    let registers: [String]?
    let subsenses: [Subsense]?
    let thesaurusLinks: [ThesaurusLink]?
    let regions: [String]?
    
    enum CodingKeys: String, CodingKey {
        case definitions, domains, examples, id
        case shortDefinitions = "short_definitions"
        case registers, subsenses, thesaurusLinks, regions
    }
}

struct SenseExample: Codable {
    let registers: [String]?
    let text: String
}

struct Subsense: Codable {
    let definitions: [String]?
    let domains: [String]?
    let examples: [SubsenseExample]
    let id: String
    let shortDefinitions: [String]
    let registers: [String]?
    let notes: [GrammaticalFeature]?
    
    enum CodingKeys: String, CodingKey {
        case definitions, domains, examples, id
        case shortDefinitions = "short_definitions"
        case registers, notes
    }
}

struct SubsenseExample: Codable {
    let text: String
}

struct ThesaurusLink: Codable {
    let entryID, senseID: String
    
    enum CodingKeys: String, CodingKey {
        case entryID = "entry_id"
        case senseID = "sense_id"
    }
}

struct Pronunciation: Codable {
    let phoneticNotation, phoneticSpelling: String
}

// Store Translations
struct StoreTranslation: Codable {
    let results: [TranslationResult]
}

struct TranslationResult: Codable {
    let id, language: String
    let lexicalEntries: [LexicalEntryTrans]
    let type, word: String
}

struct LexicalEntryTrans: Codable {
    let entries: [EntryTrans]
    let language, lexicalCategory, text: String
}

struct EntryTrans: Codable {
    let grammaticalFeatures: [GrammaticalFeatureTrans]
    let homographNumber: String
    let senses: [SenseTrans]
}

struct GrammaticalFeatureTrans: Codable {
    let text, type: String
}

struct SenseTrans: Codable {
    let id: String
    let subsenses: [SubsenseTrans]?
    let notes: [GrammaticalFeature]?
    let examples: [SenseExampleTrans]?
    let translations: [SenseTranslation]?
    let domains: [String]?
}

struct SenseExampleTrans: Codable {
    let text: String
    let translations: [SenseTranslation]
}

struct SenseTranslation: Codable {
    let language, text: String
}

struct SubsenseTrans: Codable {
    let examples: [SubsenseExampleTrans]?
    let id: String
    let notes: [GrammaticalFeature]?
    let translations: [SubsenseTranslation]
    let domains: [String]?
}

struct SubsenseExampleTrans: Codable {
    let text: String
    let translations: [SubsenseTranslation]
}

struct SubsenseTranslation: Codable {
    let language: Language
    let text: String
    let regions, registers: [String]?
}

enum Language: String, Codable {
    case es = "es"
}

// Struct SocialContext
struct StoreSocialContext: Codable {
    let title: String
    let url: URL
    let thumbnail_url: URL
    let thumbnail_width: Int
    let thumbnail_height: Int
}


