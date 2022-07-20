# Exercise 3: using the pipe operator

# Install (if needed) and load the "dplyr" library
#install.packages("dplyr")
library("dplyr")

# Install (if needed) and load the "fueleconomy" package
#install.packages('devtools')
devtools::install_github("hadley/fueleconomy")
library("fueleconomy")

# Which 2015 Acura model has the best hwy MGH? (Use dplyr, but without method
# chaining or pipes--use temporary variables!)
acura2015 <- filter(vehicles, make == "Acura", year == 2015)
bestAcura2015 <- filter(acura2015, hwy == max(hwy))
bestModel <- select(bestAcura2015, model)
bestModel
# Which 2015 Acura model has the best hwy MPG? (Use dplyr, nesting functions)
bestModel2 <- select(
  filter(
    filter(
      vehicles, 
      make == "Acura", 
      year == 2015
    ),
    hwy == max(hwy)
  ),
  model
)
bestModel2
# Which 2015 Acura model has the best hwy MPG? (Use dplyr and the pipe operator)
best_model3 <- vehicles %>%
  filter(make == "Acura", year == 2015) %>%
  filter(hwy == max(hwy)) %>%
  select(model)

best_model3