# ===================================================================
# Title: make-shots-charts-script.R
# Description:
#   This script is dealing with shot charts.
# Input(s): data file 'shots-data.csv', jpg file 'nba-court.jpg'
# Output(s): pdf file 'andre-iguodala-shot-chart.pdf', 'draymond-green-shot-chart.pdf',
#                     'kevin-durant-shot-chart.pdf', 'klay-thompson-shot-chart.pdf',
#                     'stephen-curry-shot-chart.pdf', 'gsw-shot-charts.pdf'
# Author: Shi Fan Jin
# Date: 3-7-2018
# ===================================================================

library(dplyr)
library(ggplot2)
library(jpeg)
library(grid)

dat <- read.csv(file = "../data/shots-data.csv", stringsAsFactors = FALSE)
iguodala <- filter(dat, name == "Andre Iguodala")
green <- filter(dat, name == "Graymond Green")
durant <- filter(dat, name == "Kevin Durant")
thompson <- filter(dat, name == "Klay Thompson")
curry <- filter(dat, name == "Stephen Curry")

# court image (to be used as background of plot)
court_file <- "../images/nba-court.jpg"
# create raste object
court_image <- rasterGrob(
  readJPEG(court_file), 
  width = unit(1, "npc"), 
  height = unit(1, "npc"))


iguodala_shot_chart <- ggplot(data = iguodala) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + 
  theme_minimal()

green_shot_chart <- ggplot(data = green) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Graymond Green (2016 season)') + 
  theme_minimal()

durant_shot_chart <- ggplot(data = durant) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + 
  theme_minimal()

# shot chart with court background
thompson_shot_chart <- ggplot(data = thompson) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + 
  theme_minimal()


curry_shot_chart <- ggplot(data = curry) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + 
  theme_minimal()


pdf(file = "../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
iguodala_shot_chart
dev.off()
pdf(file = "../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
green_shot_chart
dev.off()
pdf(file = "../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
durant_shot_chart
dev.off()
pdf(file = "../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
thompson_shot_chart
dev.off()
pdf(file = "../images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
curry_shot_chart
dev.off()


all_shot_chart <- ggplot(data = dat) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') + 
  theme_minimal() +
  facet_wrap(~ name)

ggsave(filename = "../images/gsw-shot-charts.pdf", plot = all_shot_chart, width = 8, height = 7)


