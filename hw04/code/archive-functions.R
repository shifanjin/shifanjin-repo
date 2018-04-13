# ===================================================================
# Title: archive-functions.R
# Description:
#   This script is basically writing functions to clean data imported 
#   from the package website
# Author: Shi Fan Jin
# Date: 4-11-2018
# ===================================================================


library(XML)
library(stringr)
library(dplyr)
library(ggplot2)

#' @title imports table
#' @description imports the archive table from the website
#' @param package the package name 
#' @return the data frame from reading the HTML table with the archive data
read_archive <- function(package) {
  url = paste('http://cran.r-project.org/src/contrib/Archive/', package, sep = '')
  tbl_html = readHTMLTable(url)
  org_tbl = tbl_html[[1]]
  return(org_tbl)
}


#' @title clean up the archive table
#' @description clean up the data frame, and make an new table out of it
#' @param org_tbl the original data frame downloaded from the website (the output of read_archive())
#' @return returns a “tidy” table
clean_archive <- function(org_tbl) {
  # Take out the 1st, 2nd, and last row
  org_tbl = org_tbl[-c(1, 2, nrow(org_tbl)), -c(1, ncol(org_tbl))]
  name = version_names(org_tbl)
  version = version_numbers(org_tbl)
  date = as.Date(version_dates(org_tbl))
  size = as.numeric(version_sizes(org_tbl))
  
  df = data.frame(name, version, date, size, stringsAsFactors = FALSE)
  
  return(df)
}


#' @title extract name of the package
#' @description extracts the name of the package
#' @param org_tbl the original data frame
#' @return returns the name part of the “tidy” table
version_names <- function(org_tbl) {
  name_and_ver = str_replace(org_tbl$Name, pattern = '.tar.gz', replacement = '')
  list_name_ver = str_split(name_and_ver, pattern = '_')
  
  name_list = lapply(list_name_ver, function(x) x[1])
  name = as.character(unlist(name_list))
  
  return(name)
}

#' @title extracts the number of the version of the package
#' @description extracts the number of the version of the package
#' @param org_tbl the original data frame
#' @return returns the version part of the “tidy” table
version_numbers <- function(org_tbl) {
  name_and_ver = str_replace(org_tbl$Name, pattern = '.tar.gz', replacement = '')
  list_name_ver = str_split(name_and_ver, pattern = '_')
  
  ver_list = lapply(list_name_ver, function(x) x[2])
  ver = as.character(unlist(ver_list))
  
  return(ver)
}

#' @title extracts the dates of the package
#' @description extracts the dates of the package
#' @param org_tbl the original data frame
#' @return returns the date part of the “tidy” table
version_dates <- function(org_tbl) {
  date = str_sub(org_tbl[,2], start = 1, end = 10)
  return(date)
}

#' @title extracts the size of the package
#' @description extracts the size of the package
#' @param org_tbl the original data frame
#' @return returns the size part of the “tidy” table
version_sizes <- function(org_tbl) {
  size = str_replace(org_tbl$Size, pattern = 'K|M|G', replacement = '') 
  size = as.numeric(size)
  
  #Caution: some packages have size
  #values expressed in MB, these must be converted to KB
  for(i in 1 : length(org_tbl$Size)) {
    if (str_sub(org_tbl$Size, start = -1)[i] == 'M') {
      size[i] = 1000 * size[i]
    }
  }
  
  return(size)
}


#' @title step line chart
#' @description takes a clean archive table, and produces a step line chart
#' @param table the clean archive table
#' @return returns the step line chart
plot_archive <- function(table) {
  ggplot(table) +
    geom_step(aes(x = date, y = size)) + 
    geom_point(aes(x = date, y = size))
}





