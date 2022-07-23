#Chapter Thirteen Work
install.packages("dbplyr")
install.packages("RSQLite")
install.packages("RPostgreSQL")

# Exercise 1: accessing a relational database

# Install and load the `dplyr`, `DBI`, and `RSQLite` packages for accessing
# databases
library(dplyr)
library(DBI)
library(RSQLite)

# Create a connection to the `Chinook_Sqlite.sqlite` file in the `data` folder
# Be sure to set your working directory!
db_Connection <-  dbConnect(SQLite(), dbname = "Chinook_Sqlite.sqlite")

# Use the `dbListTables()` function (passing in the connection) to get a list
# of tables in the database.
dbListTables(db_Connection)

# Use the `tbl()`function to create a reference to the table of music genres.
# Print out the the table to confirm that you've accessed it.
genre_Table <- tbl(db_Connection, "Genre")

print(genre_Table)
# Try to use `View()` to see the contents of the table. What happened?
View(genre_Table)

# Use the `collect()` function to actually load the genre table into memory
# as a data frame. View that data frame.
genreDF <- collect(genre_Table)

View(genreDF)
# Use dplyr's `count()` function to see how many rows are in the genre table
count(genreDF)


# Use the `tbl()` function to create a reference the table with track data.
# Print out the the table to confirm that you've accessed it.
track_Table <- tbl(db_Connection, "Track")

tableDF <- collect(track_Table)

View(tableDF)

# Use dplyr functions to query for a list of artists in descending order by
# popularity in the database (e.g., the artist with the most tracks at the top)
# - Start by filtering for rows that have an artist listed (use `is.na()`), then
#   group rows by the artist and count them. Finally, arrange the results.
# - Use pipes to do this all as one statement without collecting the data into
#   memory!
artistsWithMostTracks <- tableDF %>%
  filter(is.na(Composer)== FALSE) %>%
  group_by(Composer) %>%
  count(Composer) %>%
  arrange(-n)

View(artistsWithMostTracks)
# Use dplyr functions to query for the most popular _genre_ in the library.
# You will need to count the number of occurrences of each genre, and join the
# two tables together in order to also access the genre name.
# Collect the resulting data into memory in order to access the specific row of
# interest
mostPopularGenre <- tableDF %>%
  filter(is.na(GenreId)== FALSE) %>%
  group_by(GenreId) %>%
  count(GenreId) %>%
  arrange(-n) %>%
  left_join(
    genreDF,
    by = "GenreId"
  ) 

View(mostPopularGenre)

# Remember to disconnect from the database once you are done with it!
dbDisconnect(db_Connection)
