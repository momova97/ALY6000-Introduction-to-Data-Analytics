
1
 
  
EXECUTIVE SUMMARY REPORT 3 
Module 3 assignment 
Mohammad Hossein Movahedi 
Movahedi.m@northeastern.edu 
Abstract 
In this assignment, I will create a summary of some data and learn how to use R 
Introduction 
In this summary, I will use the data from the inchBio.csv dataset and use the APA system for 
the bibliography. Also, the R code that I used to process the data is available on my GitHub 
account, which address is mentioned in the bibliography part. I also put my code in the 
appendix part.  
The objective is to firstly, Follow an introduction, provide an analysis of descriptive 
characteristics of the data set provided by your instructor. This includes pertinent statistics 
including counts, cumulative counts, frequency, percentages, etc. Include R console screen 
snippets to support your observations and conclusions. Secondly, Provide the executive with 
visualizations (at least 3) that help them see the key characteristics you want to highlight. 
Lastly, provide a clear two to three sentences paragraph summary of the key points. 
 
methodology 
1. first of all I add my name and imported libraries 
#printing my name 
print("mohammad Hossein Movahedi") 
#importing and loading required libraries 
install.packages("FSA") 
install.packages("FSAdata") 
install.packages("magrittr") 
install.packages("dplyr") 
install.packages("tidyr ") 
install.packages("plyr") 
install.packages("tidyverse") 
#loading installed libraries 
library(FSA) 
library(FSAdata) 
library(magrittr) 
library(dplyr) 
library(tidyr) 
library(plyr) 
library(tidyverse) 
2. then I imported the CSV file as a table named Bio using what I learnt from (Willems, 2018) 
#Import the inchBio.csv and name the table bio 
bio <- read_csv("/cloud/project/inchBio.csv") 
