library(tidyverse)
library(tidyr)

getwd()
list.files("Temporary")

WomenChessPlayers = read.csv("Temporary/women_chess.csv")

head(WomenChessPlayers, 5)
dim(WomenChessPlayers)

SeperateNames <- WomenChessPlayers %>%
    filter(!is.na(WomenChessPlayers$Name)) %>%
    separate(Name, c("Last_Name", "First_Name"),",") %>%
    relocate(Last_Name, .after = "First_Name")

SeperateNames %>% head(10)
dim(SeperateNames)

GMs <- WomenChessPlayers %>% 
    filter(Title == "GM") 

CountGMs <- WomenChessPlayers %>% 
    filter(Title == "GM") %>%
    group_by(Year_of_birth) %>%
    count(Title == "GM") 

hist(CountGMs$Year_of_birth, xlab = 'Year of Birth', ylab = 'Number of GMs', main = 'GMs by Birth Year', col='yellow')

hist(WomenChessPlayers$Standard_Rating, xlab = 'Rating', ylab = 'Number of Players', main = 'Rating Distribution', col='green')