#install.packages('tidyverse')
#install.packages('pscl')
library("dplyr")
library("pscl")
View(presidentialElections)

#select the year and demVotes (percentage of votes won by the Democrat) from the presidential elections dataframe
votes <- select(presidentialElections, year, demVote)
View(votes)

#select columns `state` through `year`
View(select(presidentialElections, state:year))

#select all columns except for south
View(select(presidentialElections, -south))

#filter function allows a person to choose what rows they desire 
votes_2008 <- filter(presidentialElections, year ==2008)
View(votes_2008)

#filter will extract rows that match ALL given conditions 
votes_Colorado_2008 <- filter(presidentialElections, year ==2008, state=='Colorado')
View(votes_Colorado_2008)

#note: dlpyr library does not keep row names, if those are neded, make the row names a column (feature)
#of the data, this can be done via the mutate() function

#add an `other_parties_vote` column that is a percentage of the votes for other parties
#also add an `abs_vote_difference ` column of the differences between percentages
presidentialElections <- mutate(
  presidentialElections,
  other_parties_vote = 100 - demVote,
  abs_vote_difference = abs(demVote - other_parties_vote)  
)
#note: mutate() does not change the original data frame, but instead creates a new data frame
presidentialElections

#Use arrange to sort the rows of a data fram by some feature (column value)

#arrange rows in decreasing order by year, then demVote within each Year
presidentialElections <- arrange(presidentialElections, -year, demVote)
View(presidentialElections) #again like mutate, the data is stored in a new data frame rather than old one

#compute summary statistics for the `presidentialElections` Data frame
average_votes <- summarize(
  presidentialElections,
  mean_dem_vote = mean(demVote),
  mean_other_parties = mean(other_parties_vote)
  
)
average_votes

#how to find the state with the highest 2008 `demVote` percentage

#filter down to 2008 vote
votes_2008 <- filter(presidentialElections, year ==2008)

#filter to state with highest demVote
most_dem_votes <- filter(votes_2008, demVote ==max(demVote))

#select name of state
most_dem_state <- select(most_dem_votes, state)
most_dem_state

#a better way to do it to avoid having to change the algorithm frequently later:
most_dem_state <- select(
  filter(
    filter(
      presidentialElections,
      year == 2008
    ),
    demVote == max(demVote)
  ),
  state
) 
#process above uses `anonymous variables` result values not assgined to variables but instead immediately
#used as arguments to other functions

#dplyer pipe operator, written as %>%, takes the result from one operation and passes it
#to the next function as the function's first argument

most_dem_state <- presidentialElections %>%
  filter(year==2008) %>%
  filter(demVote==max(demVote)) %>%
  select(state)

most_dem_state

#another interesting piece of dplyer functions is that they can by applied to groups of rows
#in a data set

#can use the group_by() function to create associations among groups of rows
#so you can easily perform aggregations
grouped <- group_by(presidentialElections, state)
grouped 
#group_by allows you to apply operations to groups of data without breaking the data into different
#variables, essently, group_by splits the data into different groups of data corresponding to different values in a column

#for example: create summary statistics by state: average percentages across the years
state_voting_summary <- presidentialElections %>%
  group_by(state) %>%
  summarize(
    mean_dem_vote = mean(demVote),
    mean_other_parties = mean(other_parties_vote)
  )
View(state_voting_summary)

#Joins
#sometimes you may want to access data from multiple data frames, basically, combining the frames
#via a reference to both tables through a column that corresponds to both tables 
#the columns are used as identifiers to determine which rows correspond to one another

#left_join() looks for the matching columns in question, and returns a new data frame consisting
#of the data frame from the first argument (the `left` one) with extra columns from the right (the second) argument

#you can specify which columns you want to match via the 'by' argument
