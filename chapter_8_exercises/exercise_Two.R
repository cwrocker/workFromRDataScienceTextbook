# Exercise 2: using `*apply()` functions

# Create a *list* of 10 random numbers. Use the `runif()` function to make a 
# vector of random numbers, then use `as.list()` to convert that to a list
randomNumbers <- c(runif(10, 0, 1000))
randomNumbers
as.list(randomNumbers)

# Use `lapply()` to apply the `round()` function to each number, rounding it to 
# the nearest 0.1 (one decimal place)
lapply(randomNumbers, round)

# Create a variable 'sentence' that contains a sentence of text (something 
# longish). Make the sentence lowercase; you can use a function to help.
sentence <- 'i am making a sentence because the magical textbook people told me to.'

# Use the `strsplit()` function to split the sentence into a vector of letters.
# Hint: split on `""` to split every character
# Note: this will return a _list_ with 1 element (which is the vector of letters)
splitString<-strsplit(sentence,"")

# Extract the vector of letters from the resulting list
letters <- splitString[[1]]
letters

# Use the `unique()` function to get a vector of unique letters
uniqueLetters <- unique(letters)
uniqueLetters

# Define a function `count_occurrences` that takes in two parameters: a letter 
# and a vector of letters. The function should return how many times that letter
# occurs in the provided vector.
# Hint: use a filter operation!
count_occurrences <- function(characterVal =" ", letterVector)
{
  normalizeLetters <- tolower(letterVector)
  splitletterVector <- strsplit(letterVector, "")
  allTheLetters <- splitletterVector[[1]]
  
  trueandFalseTimes <- characterVal == allTheLetters
  trueTimes <- allTheLetters[trueandFalseTimes]
  
  totalTrueTimes <- length(trueTimes)
  totalTrueTimes
  
}


# Call your `count_occurrences()` function to see how many times the letter 'e'
# is in your sentence.
count_occurrences("e", sentence)

# Use `sapply()` to apply your `count_occurrences()` function to each unique 
# letter in the vector to determine their frequencies.
# Convert the result into a list (using `as.list()`).
newSentenceList = as.list(sapply(uniqueLetters, count_occurrences, sentence))

# Print the resulting list of frequencies
print(newSentenceList)
