# ===================================================================
# Title: regex-functions.R
# Description:
#   This script is basically writing functions to deal with string
#   and characters
# Author: Shi Fan Jin
# Date: 4-11-2018
# ===================================================================

library(stringr)
library(dplyr)


#' @title single character elements
#' @description takes a character string, and splits the content into one single character elements.
#' @param str the string to be split
#' @return the single charater elements
split_chars <- function(str) {
  ele = str_split(str, "")
  ele = unlist(ele)
  return(ele)
}


#' @title number of vowels
#' @description find the number of vowels in a character vector
#' @param ch_vec a vector in which each element is a single character
#' @return the number of vowels
num_vowels <- function(ch_vec) {

  count_a <- sum(grepl('a',ch_vec,ignore.case = TRUE))
  count_e <- sum(grepl('e',ch_vec,ignore.case = TRUE))
  count_i <- sum(grepl('i',ch_vec,ignore.case = TRUE))
  count_o <- sum(grepl('o',ch_vec,ignore.case = TRUE))
  count_u <- sum(grepl('u',ch_vec,ignore.case = TRUE))
  
  table <- c(count_a,count_e,count_i,count_o,count_u)
  names(table) <- c("a", "e", "i", "o", "u")
  return(table)

}


#' @title count vowels
#' @description computes the number of vowels of a character string
#' @param ch_str a character string
#' @return the number of vowels
count_vowels <- function(ch_str) {
  
  ch_vec = split_chars(ch_str)
  tbl = num_vowels(ch_vec)
  return(tbl)
}


#' @title reverse characters
#' @description reverses a string by characters
#' @param x a character vector
#' @return the character vector with the reversed characters
reverse_chars <- function(x) {
  x = split_chars(x)
  x <- rev(x)
  x = paste(x, collapse = "")
  return(x)
} 


#' @title reverse words
#' @description reverses a string by words
#' @param x a string
#' @return the string with the reversed words
reverse_words <- function(x) {
  split <- lapply(str_split(x, ' '), rev)
  reversed <- sapply(split,function(x) paste(x, collapse = ' ') )
  return(reversed)
}

