#  Report

# Description
An app that allows the user to get semantic and cultural context of a word in another language.
![Word of The Day, shows word of the day and description of the word. Allows to user te get more context such as: general info, everyday phrases in different languages and social context.](doc/DailyWord.png)

# Technical Design
* High Level Overview and Navigation
At first the user in enabled to enter a word and get context or see the word of the day and get context, which are both controlled by a tab bar controller. Whichever the user chooses, the word will be stored under currentWord and send to the API. Next the user will be send to another tab bar controller which controlls the view controllers with the API's: General Info, Phrases and Social Context. 
An API will then be called with currentWord whenever the user calls upon a ViewController with said functionality. For Example: when the user clicks the tab bar for General Info the API will load currentWord with the needed info (description, etymologies, etc.) from the API oxforddictionary. The same api will be called for different info when the viewController Phrases is visited. The Google Search API will be called whenever social context is opened. The user in enabled to go back to the first tab bar controller by clicking a tab bar item and enter a new word or see the word of the day.
* Detail: modules/classes, files/functions
The most important files als ContextData and ContextController. ContextData contains all the structs for JSON data. ContextController is the file that sends
the GET requests for the API's. ContextControllers contains the four core functions:
fetchRandomWord, fetchWordDescription, fetchWordTranslation and fetchSocialContext. The files DailyWordController, GeneralTableviewController, LanguagesTableViewController and SocialTableViewController all make use of these functions. DailyWordController uses fetchRandomWord and fetchWordDescription. 
GeneralTableViewController uses fetchWordDescription and LanguagesTableViewController uses fetchDailyWordDescription and fetchWordTranslation. Whenever the user is one of the TableViews they are enabled
to click the cell or row which will give them either a phrase in whatever language they'v chosen (LanguagesController) or more info about a linguistic term in general info (GeneralTabController), which is enabled trough DidSelectRow. 

# Challenges
The first obstacle were the API'S. The API used for the random word generator, which I had found using
a site containing domains for API's turned out not to work. This was API Documentation for random word generator:  https://apifort-random-word-v1.p.mashape.com/v1/generate/randomword. On top of that API Documentation for Word Usage:  http://www.pressmon.com/en/docs allowed me to generate a key and run a test trial on their site, but 
as soon I tried it with the app it turned out I needed to register while the register function on the site didn't work. 
The cherry on top was the final API for social usage. The API worked on XCODE and on the webstie bur turned
out not to give a lot of relevant data in relation to the word query. 
    After above challenges I finally found an API which could help me with both the random word generator and 
phrases in different languages (API: https://developer.oxforddictionaries.com/documentation). While the registration and trial on the site of the JSON were spotless the same couldn't be said for the JSON in the app. First it turned out the API didn't have any random word generator - and the old API seems to have been the only one- but there was a function which allowed the user to look up a random word in a domain, again, not every domain generated a word which was very frustrating. The solution seemed to be a list of common words an/or domains which would always return data and not nil. The downside was: all of this needed testing by hand, and this was during second week in which I had a high fever for several day and fell back to having migraines. Nevertheless it all worked out. 
Secondly, the new API for social usage (which turned out te be Google API; because it was very safe and was guarenteed to work and searched for relevant data I wanted) seemed to be giving very big JSON data and structures -likewise for the oxford API. Not only consumed this a lot of time: figuring out how to get all the needed data from such a big structure, calling all the data but also displaying it on the screens correctly.

# Decisions
 All of the above resulted in having to spend a lot on time on the API and even deciding to skip FireBase. This was during the end of the third week. As it was: I didn't have time to even implement it (and if I had, it would have been messy and not even guarenteed to work) and after consideration and discussion at the last presentation I decided it wasn't mandetory for this particular app or version, but could have been a nice feature for future versions. All in all, i've learned a lot of problem-solving and code writing - even for functions i didn't even used in the end, but researched for design or in consideration for basic functions. But more importantly i've learned to let go of problems that couldn't be solved, make trade-offs and to make more use of the recources I have to get an anwser on a quesiton. I've also valued the constructive feedback of peers during weekly presentation, not only did their feedback helped me with decision making, seeing their struggles and helping them in turn did relieve me a bit of the anxiety I felt by taking on such a big project. I'm not perfectly happy about the Final State, because it could have been smoother and the loading of the API takes times (also no firebase), but i'm statisfied about what i've learned: which is coding trough problem-solving, research and using my recourses. For others it may not be a huge complex app, but i am happy with the progress i've made looking back from i ended with App Studio.

# Final state
The app allows you the enter a word or check up the word of the day and get context.
Context consists of General Info, Phrases and Social Context. 
* General info about said word: Word, Definitions, Example Phrase,Grammatical Features, Etymologies, Lexical Category, Phonetic Spelling
* Phrases with everyday sentences in several languages: English, Spanish, Pedi, Zulu, Malay, Indonesion, Tswana, Urdu, German.
* Social Context: Google search returns with entered word including, headline, thumbnail, description. 


