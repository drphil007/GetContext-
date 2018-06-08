# GetContext
An app that allows the user to get semantic and cultural context of a word in another language.

## Problem and Solution
The goal of this app is to give the user a quick overview of the semantic and cultural usages of a word in different languages to emphasize it's differences. This will help to prevent misunderstanding in communication and translation and hopes to advance understanding and learning of different language and apricate it's differences. The uses of this can be for learning a language, a situation in which knowledge of contextual differences of a word are needed: communication between two different language users (e.g. travellers or for business purposes) or simply curiosity. 

## Visual Sketch 
![Visual interaction of controllers, displaying the app's MVP: entering a word and loading it's word usage and social usage] (doc/image.png)

## Main Features 
* The start screen will allow the user to enter his name trough Firebase Database, see the word of the day and input a word. 
* Selecting one or more languages to see the context of the chosen word.
* Displays the translation of the word in the selected languages next to each other.
* Enables the user to see semantic or cultural context: word usage or social usage.
* Word Usage returns common phrases with the inputted word and illustrates different usages for the selected languages. The API that returns this query allows the following languages: English, Spanish, Italian, German, Russian and French. 
* Social Usage returns top trending information the inputted word and demonstrates the social usages of said word in the following formats (from it's API): headlines, videos, images, phrases and hashtags posted to the social media platforms on the same topic. 
* Users can save particular phrases from word usage and trending information in every format for the entered word. 

## Data Sources
* API Documentation for word translation: https://cloud.google.com/translate/docs/
* API Documentation for Word Usage:  http://www.pressmon.com/en/docs
* API Documentation for Social Usage: http://trendspottr.com/api/v1.5/searchAPIDoc

## External Components
Firebase Database: https://firebase.google.com/docs/database/

## Similar mobile apps
Currently there is nothing combining the semantic and cultural aspect of word usage, but there are apps and sites displaying separate components. 
* Platform that allows translation of text into different multiple languages: https://translatr.varunmalhotra.xyz/
* Vocabology is an app which demonstrates usages of words with example phrases, synonyms and a quick description. This app also has a word of the day. http://appcrawlr.com/ios/vocabology-word-of-the-day#authors-description
* Currently there are mainly search engines for social media on websites, https://www.social-searcher.com/ is a search engine that allows you to monitor quickly what people have recently said about the topic of the user's choosing.

## Hardest parts
Implementing the app in a way that has a good user interface and attracts people to the app. Furthermore, implementing all the API's in an elegant way. Finally, implementing Firebase Database will be the hardest part as it requires to save the username, the word's that the user saves and the social topics and phrases for each particular word.

