#install packages
#install.packages('stringr')

#load package
library(stringr)

#squareRoot Function
print(sqrt(25))

#minimum function
print(min(1,6/8,4/3))

#note: you can learn the purpose of any built in function using ?FUNCTION_NAME

#other cool functions

sum_Function <- sum(1,5)
print(sum_Function)

roundFunction <- round(3.1415, 3)
print(roundFunction)

toupperFunction <- toupper('guitarplaying')
print(toupperFunction)

pasteFunction <- paste('electric, Guitar')
print(pasteFunction)

ncharFunction <- nchar('Can you tell I play guitar')
print(ncharFunction)

cFunction <- c(1,3,5,7,9)
print(cFunction)

seqFunction <- seq(1,200)
print(seqFunction)

#named arguments 
#optional arguments in a function in which you can specify that an argument value has
#a particular name. As a result, you do not need to remember the order of operational
#arguments, you just need to reference them by name

argumentsByNameEx <- paste('Gibson', 'Les Paul', sep = "-----")
print(argumentsByNameEx)

#because named arguments are optional, they can be included in any order

#the following all do the same thing
round(3.1415, 3)
round(3.1415, digits = 3)
round(digits = 3, 3.1415)

#also: mathematical operators are also functions

x <- '+'(5, 3)
print(x)

x <- '-'(5, 3)
print(x)

x <- '/'(5, 3)
print(x)

x <- '*'(5, 3)
print(x)

#using stringr package

#count characters in a string

strCountFunction <- str_count("Mississippi", "i")
print(strCountFunction)

#making a function

firstFunction <- function(radius)
{
  area = pi * radius * radius
  
  #functions return the value of the last line
  
  area
  
  #note: you can use a 'return()' function but it is best practice to only use that to return a value before the last statement is executed
  
}

circleAreaUsingCustomFunction <- firstFunction(2)

print(circleAreaUsingCustomFunction)

#remember, order matters in R programming

#conditional statements

if( circleAreaUsingCustomFunction > 12)
{
  print('yay')
}

if( circleAreaUsingCustomFunction < 6)
{
  print('yay')
} else if ( circleAreaUsingCustomFunction < 10)
{
  print('boo')
} else
{
  print('meh')
}




