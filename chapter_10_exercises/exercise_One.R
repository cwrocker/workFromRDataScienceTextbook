# Exercise 1: creating data frames

# Create a vector of the number of points the Seahawks scored in the first 4 games
# of the season (google "Seahawks" for the scores!)
seahawksPoints <- c(28, 30, 17, 28)

# Create a vector of the number of points the Seahwaks have allowed to be scored
# against them in each of the first 4 games of the season
pointsAgainstSeaHawks <- c(16, 33, 30, 21)

# Combine your two vectors into a dataframe called `games`
games <- data.frame(seahawksPoints, pointsAgainstSeaHawks, stringsAsFactors = FALSE)

# Create a new column "diff" that is the difference in points between the teams
# Hint: recall the syntax for assigning new elements (which in this case will be
# a vector) to a list!
diff <- c(12, 3, 13, 7)
games$diff <- diff

# Create a new column "won" which is TRUE if the Seahawks won the game
games$won <- seahawksPoints > pointsAgainstSeaHawks


# Create a vector of the opponent names corresponding to the games played
opponentNames <- c('Colts', 'Titans', 'Vikings', '49ers')

# Assign your dataframe rownames of their opponents
rownames(games) <- opponentNames

# View your data frame to see how it has changed!
View(games)
