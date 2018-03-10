# ===================================================================
# Title: make-shots-data-script.R
# Description:
#   This script is basically organizing the five csv files of the five 
#   players, and making it into a single table and export it to a csv
#   file.
# Input(s): data file 'andre-iguodala.csv', 'draymond-green.csv',
#           'kevin-durant.csv', 'klay-thompson.csv', 'stephen-curry.csv'
# Output(s): data file 'shots-data.csv'
# Author: Shi Fan Jin
# Date: 3-7-2018
# ===================================================================

library(dplyr)

iguodala <- read.csv(file = "../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv(file = "../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv(file = "../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv(file = "../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

iguodala <- mutate(iguodala, name = 'Andre Iguodala')
green <- mutate(green, name = 'Graymond Green')
durant <- mutate(durant, name = 'Kevin Durant')
thompson <- mutate(thompson, name = 'Klay Thompson')
curry <- mutate(curry, name = 'Stephen Curry')

iguodala[iguodala$shot_made_flag == 'n', ]$shot_made_flag = 'missed shot'
iguodala[iguodala$shot_made_flag == 'y', ]$shot_made_flag = 'made shot'

green[green$shot_made_flag == 'n', ]$shot_made_flag = 'missed shot'
green[green$shot_made_flag == 'y', ]$shot_made_flag = 'made shot'

durant[durant$shot_made_flag == 'n', ]$shot_made_flag = 'missed shot'
durant[durant$shot_made_flag == 'y', ]$shot_made_flag = 'made shot'

thompson[thompson$shot_made_flag == 'n', ]$shot_made_flag = 'missed shot'
thompson[thompson$shot_made_flag == 'y', ]$shot_made_flag = 'made shot'

curry[curry$shot_made_flag == 'n', ]$shot_made_flag = 'missed shot'
curry[curry$shot_made_flag == 'y', ]$shot_made_flag = 'made shot'

iguodala <- mutate(iguodala, minute = (period * 12) - minutes_remaining)
green <- mutate(green, minute = (period * 12) - minutes_remaining)
durant <- mutate(durant, minute = (period * 12) - minutes_remaining)
thompson <- mutate(thompson, minute = (period * 12) - minutes_remaining)
curry <- mutate(curry, minute = (period * 12) - minutes_remaining)

sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

single_df <- rbind(iguodala, green, durant, thompson, curry)


write.csv(single_df, file = '../data/shots-data.csv')


sink(file = '../output/shots-data-summary.txt')
summary(single_df)
sink()
