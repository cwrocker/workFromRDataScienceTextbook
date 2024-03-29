# Exercise 8: exploring data sets

# Load the `dplyr` library
library(dplyr)


# Read in the data (from `data/pupulitzer-circulation-data.csv`). Remember to 
# not treat strings as factors!
pulitzer <- read.csv("https://raw.githubusercontent.com/programming-for-data-science/book-exercises/master/chapter-11-exercises/exercise-8/data/pulitzer-circulation-data.csv", stringsAsFactors = FALSE)


# View in the data set. Start to understand what the data set contains
View(pulitzer)

# Print out the names of the columns for reference
colnames(pulitzer)

# Use the 'str()' function to also see what types of values are contained in 
# each column (you're looking at the second column after the `:`)
# Did any value type surprise you? Why do you think they are that type?
str(pulitzer)

# Add a column to the data frame called 'Pulitzer.Prize.Change` that contains 
# the difference in the number of times each paper was a winner or finalist 
# (hereafter "winner") during 2004-2014 and during 1990-2003
prizeChange <- mutate(pulitzer, Pulitzer.Prize.Change = Pulitzer.Prize.Winners.and.Finalists..2004.2014 - Pulitzer.Prize.Winners.and.Finalists..1990.2003)
prizeChange

# What was the name of the publication that has the most winners between 
# 2004-2014?
most2k04To2k14Winners <- pulitzer %>%
  filter(
    Pulitzer.Prize.Winners.and.Finalists..2004.2014 == max(Pulitzer.Prize.Winners.and.Finalists..2004.2014)
  )%>%
  select(Newspaper, Pulitzer.Prize.Winners.and.Finalists..2004.2014)

most2k04To2k14Winners

# Which publication with at least 5 winners between 2004-2014 had the biggest
# decrease(negative) in daily circulation numbers?
worstOfTheBest <- pulitzer %>%
  filter(
    Pulitzer.Prize.Winners.and.Finalists..2004.2014 >= 5
  )%>%
  filter(
    min(Change.in.Daily.Circulation..2004.2013) == Change.in.Daily.Circulation..2004.2013
  ) %>%
  select(Newspaper, Pulitzer.Prize.Winners.and.Finalists..2004.2014, Change.in.Daily.Circulation..2004.2013)
  
View(worstOfTheBest)
