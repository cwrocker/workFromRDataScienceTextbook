#Lists
#Like vectors, they are one dimensional collections of data
#However, they can hold elements of different types in the list
#They can also be tagged with names that can eaily be used to refer to them
#Similar to a dictionary in Python

#creating a list with tagged elements
programmer <- list(
  userName = 'cwrocker',
  futureGoal = 'Data_Scientist',
  faith = 'Christianity',
  guitarStringsNeeded = 50,
  likeMachineLearning = TRUE
)
programmer

#creating a list without tagged elements
badlist <- list('cwrocker', 'Data_Scientist', 'Christianity', 50, TRUE)
badlist

#create a list such that it has a list within it
programmer <- list(
  userName = 'cwrocker',
  futureGoal = 'Data_Scientist',
  faith = 'Christianity',
  guitarStringsNeeded = 50,
  guitarsUsed = list(
    main_Electric =  'Gibson_Les_Paul',
    backUpElectric ='Dean_Zelinsky_Telecaster'
  ),
  likeMachineLearning = TRUE
)
programmer

#referencing elements in a list
programmer$userName
programmer$guitarsUsed$backUpElectric

#also can accessing them with numbers
programmer[[2]]
programmer[[6]]

#or using brackets with the tag
programmer[['faith']]
programmer[['guitarStringsNeeded']]

#note lists can contain complex values such as other vectors
resume <- list(
  qualifications = list(
    education = "Bachelors of Science in Information Technology: Application Development",
    research = "Using Machine Learning for Image Recognition of Microcracks"
    ),
  skills = c("Tableau", "Python", "R", "C#")
  
)
#store qualifications elements in variable
currentQualifications <-resume$qualifications

#can acces the qualifications list Now
currentQualifications$education

#can also access vectors elements
resume$skills[3]

#can also modify list elements as if they were vectors
programmer <- list(
  userName = 'cwrocker',
  futureGoal = 'Data_Scientist',
  faith = 'Christianity',
  guitarStringsNeeded = 50,
  likeMachineLearning = TRUE
)

#no element containing favoriteFood
programmer$favoriteFood

#can add that to the list
programmer$favoriteFood <- "Pizza"
programmer

#reassign guitarStringNeeded value
programmer$guitarStringsNeeded <- 100
programmer

#remove the value for username
programmer$userName <- NULL
programmer

#compare single to double brackets
programmer <- list(
  userName = 'cwrocker',
  futureGoal = 'Data_Scientist',
  faith = 'Christianity',
  guitarStringsNeeded = 50,
  likeMachineLearning = TRUE
)

#single brackets return a list
#this essentially is a tool to filter of a collection
#creating a filtered sublist in the process
programmer['userName']
is.list(programmer['userName'])

#double brackets return vector
programmer[['userName']]
is.vector(programmer[['userName']])

is.list(programmer[['userName']])

#can use this to create vector column names to create a filtered sublist
programmer[c('userName', 'futureGoal', 'faith', 'likeMachineLearning', 'guitarStringsNeeded')]

#applying function to lists using lapply()

#since most functions are vectorized, you can use them as an argument and the function
#will be applied to each item in a list

#start with an untagged list
untaggedList <- list('cwrocker', 'Data_Scientist', 'Christianity')

#apply the toupper function to eachlement in the untaggedlist
lapply(untaggedList, toupper)

#add in the paste function using lapply with the phrase 'is cool'
lapply(untaggedList, paste, 'is cool!')

#note: this also works with custom functions

#also note: lapply is apart of the *apply function family including sapply
#which works on vectors
