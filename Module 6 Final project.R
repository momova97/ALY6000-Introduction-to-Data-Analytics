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
install.packages()
#loading installed libraries
library(FSA)
library(FSAdata)
library(magrittr)
library(dplyr)
library(tidyr)
library(plyr)
library(tidyverse)
library(arsenal)
#Import the csv and name the table woody
woody <- read_csv("/cloud/project/Thousand_Islands_NP_Forest_DownedWoodyDebris_2006-2019_Data.csv")
str(woody)
dim(woody)
#deleting the first row whitch is titles in french
woody <- woody[-1,]
#correcting rows formats
names(woody)
woody$Year <- as.numeric(woody$Year)
woody$`Date (dd-mm-yyyy)` <- as.Date(woody$`Date (dd-mm-yyyy)`,tryFormats = c("%d-%m-%Y","%d/%m/%Y"),optional = FALSE)
#changing chr to numbers
cols.num <- c("Easting (at SE Corner)","Northing (at SE Corner)",
              "Distance in meters","Diameter (cm)" )
woody[cols.num] <- sapply(woody[cols.num],as.numeric)
#changing chr to factors
cols.num <- c("Site Name","Plot Name","Species Code","Species Common Name","Species Scientific Name",
              "Type: Stump or Log","Covered in more than 50% moss","Burned","Hollow","Evidence of the presence of wildlife",
              "Cause of Origin for DWD Natural(N)/Human Caused(C)","Decomposition Class","Plot Number","Line Number")
woody %<>% mutate_at(cols.num, factor)
#getting summary and structure
str (woody)
head(woody,5)
woody <- replace(woody,"NN",NA)
summary(woody)
