---
title: "imports-85-dictionary"
author: "Shi Fan Jin"
date: "2/17/2018"
output: html_document
---
Typically we include:
1) a description of the data
2) the original source(s), 
3) who collected the data
4) when it was collected. 

More important, we include the 
5) description of each variable (or field) specifying the measurement units (if any)
6) and possibly the class of variable (e.g. quantitative, qualitative) and/or the ideal associated data type (e.g. integer, real, character, logical). 
7) Also, we can specify codification values, special meaning of some characters, or what value(s) represent missing values.


        'symboling': quantitative
        'normalized_losses': 
        'make': categorical
        'fuel_type': categorical
        'aspiration': categorical
        'num_of_doors': categorical
        'body_style': categorical
        'drive_wheels': categorical
        'engine_location': categorical
        'wheel_base': quantitative
        'length': quantitative
        'width': quantitative
        'height': quantitative
        'curb_weight': quantitative
        'engine_type': categorical
        'num_of_cylinders': categorical
        'engine_size': quantitative
        'fuel_system': categorical
        'bore': quantitative
        'stroke': quantitative
        'compression_ratio': quantitative
        'horsepower': quantitative
        'peak_rpm': quantitative
        'city_mpg': quantitative
        'highway_mpg': quantitative
        'price': quantitative

numbers of Rows: 205
numbers of Columns: 26

'?' represents the missing values

main source: https://archive.ics.uci.edu/ml/machine-learning-databases/autos/imports-85.data
Data is collected by Jeffrey C. Schlimmer
 -- Description
      This data set consists of three types of entities: (a) the
      specification of an auto in terms of various characteristics, (b)
      its assigned insurance risk rating, (c) its normalized losses in use
      as compared to other cars.  The second rating corresponds to the
      degree to which the auto is more risky than its price indicates.
      Cars are initially assigned a risk factor symbol associated with its
      price.   Then, if it is more risky (or less), this symbol is
      adjusted by moving it up (or down) the scale.  Actuarians call this
      process "symboling".  A value of +3 indicates that the auto is
      risky, -3 that it is probably pretty safe.

      The third factor is the relative average loss payment per insured
      vehicle year.  This value is normalized for all autos within a
      particular size classification (two-door small, station wagons,
      sports/speciality, etc...), and represents the average loss per car
      per year.



```