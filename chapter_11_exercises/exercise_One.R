# Exercise 1: working with data frames (review)

# Install devtools package: allows installations from GitHub
install.packages("devtools")

# Install "fueleconomy" dataset from GitHub
devtools::install_github("hadley/fueleconomy")

# Use the `libary()` function to load the "fueleconomy" package
library(fueleconomy)

# You should now have access to the `vehicles` data frame
# You can use `View()` to inspect it
View(vehicles)

# Select the different manufacturers (makes) of the cars in this data set. 
# Save this vector in a variable
manufacturers <- c(vehicles$make)
manufacturers
# Use the `unique()` function to determine how many different car manufacturers
# are represented by the data set
unique(manufacturers)

# Filter the data set for vehicles manufactured in 1997
vechicles1997 <- vehicles[vehicles$year ==1997,]
View(vechicles1997)

# Arrange the 1997 cars by highway (`hwy`) gas milage
# Hint: use the `order()` function to get a vector of indices in order by value
# See also:
# https://www.r-bloggers.com/r-sorting-a-data-frame-by-the-contents-of-a-column/
vechicles1997 <- vechicles1997[order(vechicles1997$hwy), ]
View(vechicles1997)

# Mutate the 1997 cars data frame to add a column `average` that has the vechicles1997
# gas milage (between city and highway mpg) for each car
library(dplyr)
vechicles1997 <- mutate(
  vechicles1997,
  avg_gas_mileage <- (vechicles1997$hwy + vechicles1997$cty)/2
)
View(vechicles1997)

# Filter the whole vehicles data set for 2-Wheel Drive vehicles that get more
# than 20 miles/gallon in the city. 
# Save this new data frame in a variable.
twoWheelVehicles <- filter(
  vehicles, 
  drive == '2-Wheel Drive',
  cty >20
)
View(twoWheelVehicles)

# Of the above vehicles, what is the vehicle ID of the vehicle with the worst 
# hwy mpg?
# Hint: filter for the worst vehicle, then select its ID.
worstHwyMpg <- select(
  filter(
    twoWheelVehicles,
    hwy == min(twoWheelVehicles$hwy)
  ) ,
  id
)
worstHwyMpg
# Write a function that takes a `year_choice` and a `make_choice` as parameters, 
# and returns the vehicle model that gets the most hwy miles/gallon of vehicles 
# of that make in that year.
# You'll need to filter more (and do some selecting)!

#this would work if I was not getting an error regarding the dataset in question
#even upon using the solution option I was getting a similar error to below
best_vehicle <- function(modelYear, modelMake)
{
  best_Model <- vehicles %>%
    filter(year == modelYear) %>%
    filter(make == modelMake) %>%
    filter(hwy == max(vehicles$hwy)) %>%
    select(model)
  
}

# What was the most efficient Honda model of 1995?
best_vehicle(1995, 'Honda')
print(best_vehicle)
