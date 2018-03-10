---
title: "data dictionary.md"
author: "Shi Fan Jin"
date: "3/4/2018"
output: html_document
---

Create a data dictionary—using markdown syntax—in a separate text file: data-dictionary.md. Include names of the variables, and a short description. Most of the variable names are self-descriptive: e.g. team_name, game_date. However, depending on how much you know about basketball, some variables may be a bit cryptic. So here’s a description for some of them:
• period: an NBA game is divided in 4 periods of 12 mins each. For example, a value for period = 1 refers to the first period (the first 12 mins of the game).
• minutes_remaining and seconds_remaining have to do with the amount of time in minutes and seconds, respectively, that remained to be played in a given period.
• shot_made_flag indicates whether a shot was made (y) or missed (n).
• action_type has to do with the basketball moves used by players, either to pass by defenders to gain access to the basket, or to get a clean pass to a teammate to score a two pointer or three pointer.
• shot_type indicates whether a shot is a 2-point field goal, or a 3-point field goal.
• shot_distance: distance to the basket (measured in feet).
• x and y refer to the court coordinates (measured in inches) where a shot occurred .

        'team_name': the team the player belongs to 
        'game_date': the date of the game
        'season': the basketball season year
        'period': a game has 4 period where each period is 12 minutes
        'minutes_remaining': the minutes remaining in one period
        'seconde_remaining': the seconds remaining in one period
        'shot_made_flag': whether a shot was made or not
        'action_type': the basketball move the player made
        'shot_type': whether a shot is 2 pt or 3 pt
        'shot_distance': the distance to the basket from where the shot was made
        'opponent': the opponent team
        'x': the x coordinate of the court
        'y': the y coordinate of the court
        'name': the name of the player
        'minute': the minute of the game when the shot was made
        
        
