#Date Preparation\
#Goal: to create a csv data file that will contain the required variables to be used in the ranking analysis\
#input: data file 'nba2018-players.csv'
#output: data file 'nba2018-teams.csv'

library(readr)   
library(dplyr)

data <- data.frame(read_csv("C:\\Users\\Annie Chen\\Desktop\\stat133\\workout1\\data\\nba2018.csv"), stringsAsFactors = FALSE)

#experience R to 0
typeof(data$experience)
data$experience <- as.integer(data$experience)
data$experience[is.na(data$experience)] <- 0
typeof(data$experience)
data$experience

#salary million conversion
data$salary <- data$salary / 1000000
summary(data$salary)

#position 
data$position <- as.factor(as.vector(data$position))
y <- c("center", "power_fwd", "point_guard", "small_fwd", "shoot_guard")
levels(data$position) <- y
data$position

#adding variables
data_new <- data %>% mutate(missed_field_goals = field_goals_atts - field_goals, 
                            missed_free_throws = points1_atts - points1,
                            rebounds = off_rebounds + def_rebounds,
                            mins_game = minutes / games,
                            efficiency = (points + rebounds + assists + steals + blocks - missed_field_goals - missed_free_throws - turnovers)/games)
data_new

#sink summary of efficiency
sink(file = 'C:\\Users\\Annie Chen\\Desktop\\stat133\\workout1\\output\\efficiency-summary.txt')
summary(data_new$efficiency)
sink()

#teams
data_teams <- data_new %>% select(team, experience,
                                 salary,
                                 points3,
                                 points2,
                                 points1,
                                 points,
                                 off_rebounds,
                                 def_rebounds,
                                 assists,
                                 steals,
                                 blocks,
                                 turnovers,
                                 fouls,
                                 efficiency)

teams <- data_teams %>% 
  group_by(team) %>% 
  summarise_all(funs(sum))
teams

#sink teams
sink(file = 'C:\\Users\\Annie Chen\\Desktop\\stat133\\workout1\\data\\teams-summary.txt')
summary(teams)
sink()
#csv
write.csv(teams, file = "C:\\Users\\Annie Chen\\Desktop\\stat133\\workout1\\data\\nba2018-teams.csv", row.names = FALSE)
