# Exercise 2: using built-in string functions

# Create a variable `lyric` that contains the text "I like to eat apples and 
# bananas"

lyric <- "I like to eat apples and bananas"


# Use the `substr()` function to extract the 1st through 13th letters from the 
# `lyric`, and store the result in a variable called `intro`
# Use `?substr` to see more about this function

?substr

intro <- substr(lyric, 0, 13)
print(intro)

# Use the `substr()` function to extract the 15th through the last letter of the 
# `lyric`, and store the result in a variable called `fruits`
# Hint: use `nchar()` to determine how many total letters there are!

fruits<- substr(lyric, 15, nchar(lyric))
print(fruits)


# Use the `gsub()` function to substitute all the "a"s in `fruits` with "ee".
# Store the result in a variable called `fruits_e`
# Hint: see http://www.endmemo.com/program/R/sub.php for a simpmle example (or 
# use `?gsub`)
?gsub

fruits_e<- gsub("a","ee",lyric)
print(fruits_e)

# Use the `gsub()` function to substitute all the "a"s in `fruits` with "o".
# Store the result in a variable called `fruits_o`

fruits_o<- gsub("a","o",lyric)
print(fruits_o)

# Create a new variable `lyric_e` that is the `intro` combined with the new
# `fruits_e` ending. Print out this variable

lyric_e<- paste(lyric, fruits_e)
print(lyric_e)

# Without making a new variable, print out the `intro` combined with the new
# `fruits_o` ending

lyric_o<- paste(lyric, fruits_o)
print(lyric_o)
