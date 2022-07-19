#Chapter Ten Learning
#Create a data frame by passing vectors to the `data.frame()`

#A vector of names
name <- c("cwrocker", "Slash", "Joe Perry", "Richie Sambora", "Bono Vox")

#a Vector of heights
height <- c(67, 75, 84, 22, 91)

#a Vector of weights
weight <- c(165, 178, 189, 132, 122)

#combine the vectors into a data frame
#Please note: names of variables become the names 
people <- data.frame(name, height, weight, stringsAsFactors = FALSE)

#alternative means to create data frames specifying which column to use
people <- data.frame(
  name <- c("cwrocker", "Slash", "Joe Perry", "Richie Sambora", "Bono Vox"),
  height <- c(67, 75, 84, 22, 91),
  weight <- c(165, 178, 189, 132, 122)
  
)

#because data frames act as lists, you can treat them as such and use the same notation

#this returns a vector
people_weights <- people$weight

#this also returns a vector
people_heights <- people[["height"]]

#create a column name vector
newColNames <- c('first name', "how tall", "how heavy")

#assign that vector to be the vector of column names
colnames(people) <- newColNames

#functions for inspecting data frames
nrow(people) #returns number of rows in the frame
ncol(people) #returns number of columns in the frame
dim(people) #returns dimensions in the data frame
colnames(people) #returns the names of the columns of the data name
rownames(people) #returns the names of the rows of the data name
head(people) # returns the first few rows of the data name (as a new data frame)
tail(people) # returns the last few rows of the data name (as a new data frame)
View(people) # displays the data frame (in RStudio)

#other ways to access data frames
people[1, "how heavy"] # element in row named 1 and the column named height
people [1,1] # element in row 1 and column 1
people[3, "how heavy"] #third element in the height column
people[2, ] #all column in second row
people[ ,1] #all rows in the column 1

#read data from the file file.
nbaDataFrame <- read.csv('data_files/nbaplayersdraft.csv', stringsAsFactors = FALSE)
View(nbaDataFrame)

#can also write to a csv file
#row names argument indicates if row names should be written to the file
write.csv(nbaDataFrame, 'data_files/nbaplayersdraftCOPY.csv', row.names = FALSE)

