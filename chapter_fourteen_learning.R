#CHAPTER 14 STUFF
#install.packages("httr")
library(httr)

url <- "https://api.github.com/search/repositories?q=dplyr&sort=forks"
response <- GET(url)

print(response)
#Restructure the previous request to make it easier to read and update. 

# make a GET request to the GitHub API's "search/repositories" endpoint
# Request repositories that match the search "dplyr", sorted by forks

# Construct your `resource_uri` from a reusable `base_uri` and an `endpoint`
base_uri <- "https://api.github.com"
endpoint <- "/search/repositories"
resource_uri <- paste0(base_uri, endpoint)

# Store any query parameters you want to use in a list
query_params <- list(q = "dplyr", sort = "forks")

# Make your request, specifying the query parameters via the `query` argument
response2 <- GET(resource_uri, query = query_params)

print(response2)
#extract content from `response` as a text string
response_text <- content(response, type = "text")
print(response_text)

#PARSING JSON
#install.packages("jsonlite")
library(jsonlite)

#convert a  JSON string to a list
response_data <- fromJSON(response_text)

#check if it is a data frame already
is.data.frame(response_data)

#inspect the data
str(response_data)
names(response_data)

#extract useful data
items <- response_data$items
is.data.frame(items)

#store yelp api key in variable
yelp_key <- "yelp_key_here"

# Construct a search query for the Yelp Fusion API's Business Search endpoint
base_uri <- "https://api.yelp.com/v3"
endpoint <- "/businesses/search"
search_uri <- paste0(base_uri, endpoint)

# Store a list of query parameters for Cuban restaurants around Seattle
query_params <- list(
  term = "restaurant",
  categories = "cuban",
  location = "Seattle, WA",
  sort_by = "rating",
  radius = 8000 # measured in meters, as detailed in the documentation
)

# Make a GET request, including the API key (as a header) and the list of
# query parameters
response <- GET(
  search_uri,
  query = query_params,
  add_headers(Authorization = paste("bearer", yelp_key))
)

# Parse results and isolate data of interest
response_text <- content(response, type = "text")
response_data <- fromJSON(response_text)

# Inspect the response data
names(response_data) # [1] "businesses" "total" "region"

# Flatten the data frame stored in the `businesses` key of the response
restaurants <- flatten(response_data$businesses)


# Modify the data frame for analysis and presentation
# Generate a rank of each restaurant based on row number
restaurants <- restaurants %>%
  mutate(rank = row_number()) %>%
  mutate(name_and_rank = paste0(rank, ". ", name))

View(restaurants)
