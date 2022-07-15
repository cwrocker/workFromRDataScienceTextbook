# Exercise 4: functions and conditionals

# Define a function `is_twice_as_long` that takes in two character strings, and 
# returns whether or not (e.g., a boolean) the length of one argument is greater
# than or equal to twice the length of the other.
# Hint: compare the length difference to the length of the smaller string

str1 <- "alpha"
str2 <- "beta"
str3 <- "alphaalpha"

is_twice_as_long <- function(string1, string2)
{
  genericBoolean <- FALSE
  if(nchar(string1)== 2* nchar(string2))
  {
    genericBoolean <- TRUE
  } else if (2* nchar(string1)== nchar(string2)){
    genericBoolean <- TRUE
  } else
  {
    genericBoolean <- FALSE
  }
}


# Call your `is_twice_as_long` function by passing it different length strings
# to confirm that it works. Make sure to check when _either_ argument is twice
# as long, as well as when neither are!

print(is_twice_as_long(str3, str1))

# Define a function `describe_difference` that takes in two strings. The
# function should return one of the following sentences as appropriate
#   "Your first string is longer by N characters"
#   "Your second string is longer by N characters"
#   "Your strings are the same length!"

describe_difference<-function(string1, string2)
{
  if(nchar(string1) > nchar(string2))
  {
    charDif <- nchar(string1) - nchar(string2)
    strStatement <- paste("Your first string is longer by", charDif, "characters")
    strStatement
  } else if (nchar(string1) < nchar(string2))
  {
    charDif <- nchar(string2) - nchar(string1)
    strStatement <- paste("Your second string is longer by", charDif, "characters")
    strStatement
  } else
  {
    strStatement <- "Your strings are the same length!"
    strStatement
  }
}

# Call your `describe_difference` function by passing it different length strings
# to confirm that it works. Make sure to check all 3 conditions1

print(describe_difference(str3,str3))
