# Design Document

​# UI Sketch
​
​![advanced sketch of GetContext UI, shows ause of API and database access] (doc/UI.png)

​# Diagram

​![diagram of utility modules, classes and functions and how they interact] (doc/UML.png)

​# APIs and frameworks 

​* APIFORT API will be soley used to generate a random word for the 'Daily Word'.
​* PRESSMON API and GOOGLE TRANSLATE API will function as a class to show different phrases of different languages containg the inputed word from the user. PRESSMON API allows queries for the following languages:  English, Spanish, Italian, German, Russian and French.
​* PRESSMON API and TRENDSPOTTR API  will function in the framework of firebasedatabase under 'saved words', which can include social topics from the TRENDSPOTTR API and phrases from the PRESSMON API.
​* TRENDSPOTTR API will also be used to display social topics on a word alone in the folowing formatting:
​headlines, videos, images, phrases and hashtags posted to the social media platforms on the same topic. 
​* FireBase FrameWork to save the user's information which will include: username, all the saved words, and all the saved social topics and phrases for said word.
​
​# Data Sources
​* API Documentation for random word generation:  https://www.apifort.com/docs/generate/randomword/index.html
​* API Documentation for word translation: https://cloud.google.com/translate/docs/
​* API Documentation for Word Usage:  http://www.pressmon.com/en/docs
​* API Documentation for Social Usage: http://trendspottr.com/api/v1.5/searchAPIDoc

​Random word generation
​This API will be used to generate a random word for the Daily Word. Filter will be done using a HTTP request. If the request succeeds there will be a JSON response.
​* GET - https://apifort-random-word-v1.p.mashape.com/v1/generate/randomword

​Word Translation
​This API will be used to translate the inputed word from the user into the selected languages. If the request succeeds there qill be a JSON response which will be filtered according to all relevant languages and displayed to the used in a table view.

​Word Usage
​This API will be used to produce a recently used phrase from the net in the language the user has selected. 
​If the request succeeds there will be a JSON response which will be filtered according to the language the user has selected. 

​Social Usage
​This API will be used to produce recent social topics about the entered word. Formatting of the social topics will be in headlines, videos, images, phrases and hashtags posted to the social media platforms on the same topic. If the request succeeds there will be JSON respone, furthermore the information will be filtered and displayed as a thumbnail and title in a table view which will represent a social topic. 

​# Database tables and fields 

​External Components
​Firebase Database: https://firebase.google.com/docs/database/

​Datbase Field
​* username: String 
​* |---------savedWord: String
​* |-----------|--------savedPhrase: String
​* |-----------|--------savedSocialTopic: url, title, description: String

