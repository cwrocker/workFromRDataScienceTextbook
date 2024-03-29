# Exercise 4: external data sets: Gates Foundation Educational Grants

# Use the `read.csv()` functoin to read the data from the `data/gates_money.csv`
# file into a variable called `grants` using the `read.csv()`
# Be sure to set your working directory in RStudio, and do NOT treat strings as 
# factors!
grants <- read.csv('chapter_10_exercises/gates_money.csv' , stringsAsFactors=FALSE)


# Use the View function to look at the loaded data
View(grants)

# Create a variable `organization` that contains the `organization` column of 
# the dataset
organization <- grants$organization

# Confirm that the "organization" column is a vector using the `is.vector()` 
# function. 
# This is a useful debugging tip if you hit errors later!
is.vector(organization)

## Now you can ask some interesting questions about the dataset

# What was the mean grant value?
mean(grants$total_amount)

# What was the dollar amount of the largest grant?
max(grants$total_amount)

# What was the dollar amount of the smallest grant?
min(grants$total_amount)

# Which organization received the largest grant?
grants[which(grants$total_amount == max(grants$total_amount)), 'organization']

# Which organization received the smallest grant?
grants[which(grants$total_amount == min(grants$total_amount)), 'organization']

# How many grants were awarded in 2010?
grant2010Subset <- subset(grants$start_year, grants$start_year ==2010)

sum(grant2010Subset)
