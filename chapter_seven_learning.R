#Learning about the most fundamental data type in R programming: vectors

#how to create a vector: use the c function

people <- c("John","Jacob","Jingleheimer","Schmidt")
print(people)

#vector of numeric values

numbers <- c(10,20,30,40,50)
print(numbers)

#determine elements in a vector
people_length <- length(people)
print(people_length)

print(length(numbers))

#seq() function takes arguments and produces a vector of integers between them

#make a vector from 13 - 330 inclusive
thirteen_to_three_hundred_thirty <-seq(13,330)
print(thirteen_to_three_hundred_thirty)

#make a vector of numbers 15-225, counting by 7.5
skip_count <- seq(15,225, 3.75)
print(skip_count)

#shorthand form
thirteen_to_three_hundred_thirty <-13:330
print(thirteen_to_three_hundred_thirty)

#vectorized operations
v1 <- c(4,8,2,1,7)
v2 <- c(9,3,5,8,6)

#arithmetic.......it is at this place I realized I do not need to use print every time
v1+v2
v1*v2
v1-v2
v1/v2

(v1 + v2)/(v1+v1)

#recycling: when two vectors are combined in an operation, and they have an unequal
#number of elements, then R will reuse elements from the smaller vector in that same order
v3 <- c(10,5)
v4 <- c(5,8,4,7,8,9)

v4*v3

#combining a vector and a scalar
v1+4

#note: 4 stores ALL values (numeric, character, string, Boolean)
#to confirm
is.vector(18)
is.vector("hello")
is.vector(TRUE)

#performing vectorized operation: any operation works on vectors

v5 <- c(5.425, 6.647, 3.6342, 8.987659, 1.1234057)
round(v5, 2)

#vectorized operations apply to string
intros <- c("hello","sorry","suckers")
nchar(intros)

#note: when you do a function on a vector, you are doing the function on each item, 

#you can do vectorized function such that each argument is a vector 

first_names <- c("Paul_", "John_", "George_")
last_names <- c("McCartnery","Lennon","Harrison")

beatles<-paste(first_names, last_names, sep="")
beatles

#in other words: the code inherently loops through each vector

# how to get subsets of vector data
#use bracket notation with a number in it to get the index of the vector
bassist <- beatles[1]
bassist

guitarist <- beatles[3]
guitarist

dated_yoko_ono <- beatles[2]
dated_yoko_ono

#can also use variables inside brackets
last_One <- length(beatles)
favorite_beatles <- beatles[last_One]
favorite_beatles

#can also put create a vector of indices that will tell you each specific element to
#access from another vector

programming_languages_I_Like <-c("R", "C", "C#", "C++", "Python","Java", "Matlab")
indices <- c(1,3,5,7)
favorites <- programming_languages_I_Like[indices]
favorites

#can also engage in vector filtering 
#which means you can use booleans to determine what elements are desired for return
filter <- c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE)
programming_languages_I_Like[filter]

#can be used to set conditions for falues to return
v5 <- c(5.425, 6.647, 3.6342, 8.987659, 1.1234057)

too_small <- v5 < 4
too_big <- v5 > 4

v5[too_small]
v5[too_big]

#can also modify vectors
v6 <- c(55,65, 75)
v6

#change first element
v6[1] <- 120
v6

#add a fourth element
v6[4] <- 1260
v6

# add anothetr element to the end
next_index<- length(v6) + 1
v6[next_index] <- 17
v6

#can replace multiple values
v6[c(3,5)] <- 19
v6

#can also combine elements including other vectors
larger_v6 <- c(v6, v1)
larger_v6

#and use vector filtering
larger_v6[larger_v6 > 10] <-"welp"
larger_v6

