# Exercise 7: using dplyr on external data

# Load the `dplyr` library
library('dplyr')

# Use the `read.csv()` function to read in the included data set. Remember to
# save it as a variable.
nbaStats <- read.csv("https://raw.githubusercontent.com/programming-for-data-science/book-exercises/master/chapter-11-exercises/exercise-7/data/nba_teams_2016.csv", stringsAsFactors = FALSE)

# View the data frame you loaded, and get some basic information about the 
# number of rows/columns. 
# Note the "X" preceding some of the column titles as well as the "*" following
# the names of teams that made it to the playoffs that year.
View(nbaStats)

# Add a column that gives the turnovers to steals ratio (TOV / STL) for each team
nbaWithTurnoverSteal <- mutate(nbaStats, turnoverStealRatio = TOV / STL)
View(nbaWithTurnoverSteal)

# Sort the teams from lowest turnover/steal ratio to highest
# Which team has the lowest turnover/steal ratio?
arrange(nbaWithTurnoverSteal, turnoverStealRatio)

maxTeam <- select(filter(nbaWithTurnoverSteal, turnoverStealRatio == max(turnoverStealRatio)), Team)
maxTeam

# Using the pipe operator, create a new column of assists per game (AST / G) 
# AND sort the data.frame by this new column in descending order.
topAssistsPerGame <- nbaStats %>%
  mutate(assistsPerGame = AST / G) %>%
  arrange(-assistsPerGame)

View(topAssistsPerGame)
# Create a data frame called `good_offense` of teams that scored more than 
# 8700 points (PTS) in the season
good_offense <- topAssistsPerGame %>%
  filter(PTS >8700)

View(good_offense)
# Create a data frame called `good_defense` of teams that had more than 
# 470 blocks (BLK)
good_defense <- topAssistsPerGame %>%
  filter(BLK >470)

View(good_defense)

# Create a data frame called `offense_stats` that only shows offensive 
# rebounds (ORB), field-goal % (FG.), and assists (AST) along with the team name.
offense_stats <- topAssistsPerGame %>%
  select(
    Team,
    ORB,
    FG.,
    AST
  )

View(offense_stats)

# Create a data frame called `defense_stats` that only shows defensive 
# rebounds (DRB), steals (STL), and blocks (BLK) along with the team name.
defense_stats <- topAssistsPerGame %>%
  select(
    Team,
    DRB,
    STL,
    BLK
  )

View(defense_stats)

# Create a function called `better_shooters` that takes in two teams and returns
# a data frame of the team with the better field-goal percentage. Include the 
# team name, field-goal percentage, and total points in your resulting data frame
better_shooters <- function(team1, team2)
{
  team1FG <- nbaStats %>%
    filter(Team == team1) %>%
    select(FG.)
  
  team2FG <- nbaStats %>%
    filter(Team == team2) %>%
    select(FG.)
  
  if(team1FG > team2FG)
  {
    team1Stats <- nbaStats %>%
      filter(Team == team1) %>%
      select(Team, FG., PTS)
    
    team1Stats
    
  } else
  {
    team2Stats <- nbaStats %>%
      filter(Team == team2) %>%
      select(Team, FG., PTS)
    
    team2Stats
  }
  
}
# Call the function on two teams to compare them (remember the `*` if needed)
better_shooters('Golden State Warriors*', 'Atlanta Hawks*')

better_shooters('Atlanta Hawks*', 'Golden State Warriors*')
