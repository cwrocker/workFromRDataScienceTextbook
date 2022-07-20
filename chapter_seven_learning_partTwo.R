#install.packages("nycflights13")
library("dplyr")
library("nycflights13")

#learning about the `flights` data set

?flights #documentation
dim(flights) #check number of rows and columns
colnames(flights) #inspect column names
View(flights) #look at the data frame in the RStudio viewer
#fun side note: when trying to find something, filter() works incredibly well

#identify the airline(carrier) that has the highest number of delayed flights

has_most_delays <- flights %>% #start with the flights
  group_by(carrier) %>% #group by airline carrier
  filter(dep_delay >0) %>% # find only the delays
  summarize(num_delay =n()) %>% # count the observations
  filter(num_delay == max(num_delay)) %>% #find most delayed
  select(carrier) #select the airline

#the problem with the solution above is that it is only gives an abbreviation: UA, 
#to get the name, do the following below

most_delayed_name <- has_most_delays %>% #start with previous answer
  left_join(airlines, by = 'carrier') %>% #join on airline ID
  select(name)  #select airline name

print(most_delayed_name$name) #access value

#calculate average delay by destination airport, omitting NA results
avg_delay <- flights %>%
  group_by(dest) %>%
  summarize(delay = mean(arr_delay, na.rm=TRUE)) #na.rm removes any NA (not available or null) values

avg_delay

#identify the destination where flights, on average, arrive most early
most_early <- flights %>%
  group_by(dest) %>%
  summarize(delay = mean(arr_delay, na.rm = TRUE)) %>% #compute mean delay and set it a column called `delay`
  filter(delay == min(delay, na.rm = TRUE)) %>% #filter for least delayed
  select(dest, delay) %>% #select the destination (and delay to store it)
  left_join(airports, by = c("dest" = "faa")) %>% #join on `airports` data
  select(dest, name, delay) #select output variables

print(most_early)

#identify the month in which flights tend to have the longest delays

flights %>% 
  group_by(month) %>% #group by selected feature
  summarize(delay = mean (arr_delay, na.rm=TRUE)) %>% #summarize delays
  filter(delay == max(delay)) %>% #filter for the record of interest
  select(month) %>% #select column that answers the question
  print() #print result directly (as a tibble, -> they all come out as tibbles)

#compute delay by month, adding month names for visual display
#note, `month.name` is a variable built into R
delay_by_month <- flights %>%
  group_by(month) %>%
  summarize(delay = mean (arr_delay, na.rm=TRUE)) %>%
  select(delay) %>%
  mutate(month = month.name)

#create a plot using ggplot 2 (which I will learn in a later chapter)
library(ggplot2)
ggplot(data = delay_by_month) +
  geom_point(
    mapping = aes(x = delay, y = month),
    color = "blue",
    alpha = .4,
    size = 3
  ) +
  geom_vline(xintercept = 0, size = .25) +
  xlim(c(-20,20)) +
  scale_y_discrete(limits = rev(month.name)) +
  labs(title = "Average Delay by Month", y = "", x ='Delay (minutes)')
