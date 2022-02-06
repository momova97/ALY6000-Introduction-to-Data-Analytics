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
#Import the inchBio.csv and name the table bio
bio <- read_csv("/cloud/project/inchBio.csv")
#displaying head and tail and structure of bio
headtail(bio,n = 5)
str(bio)
#creating an object that counts and lists all the species records
ubio <- unique(bio$species[!is.na(bio$species)])
list <- vector()
counts <- vector()
for (i in ubio){
  list <- c(list,i)
  counts <- c(counts, length(which(bio$species==i)))
}
countlist = data.frame(lists = list,count = counts)
#displaying names of species
disp <- headtail(countlist,n = 4)
print(disp$lists)

#creating tmp
tmp <- countlist
#Create a subsetof just the species variable and display the first five records
tmp2 <- tmp$lists
head(tmp2,n=5)
#Create a table, <w>, of the species variable. Display the class of w
w <- table(tmp$lists)
class(w)
# Convert <w> to a data frame named <t> and display the results
t <-  as.data.frame(w)
print(t)
#Extract and display the frequency values from the <t> data frame
freq <- t$Freq
print(freq )
# creating cSpec
cSpec <- table(bio$species)
tcSpec <- as.data.frame(cSpec)
tcountlist <- as.data.frame(countlist)
tcountlist <- select(tcountlist,Var1 = lists,Freq = count)
comparedf (tcountlist,tcSpec)
# Create a table named <cSpecPct>
cSpecPct <- table(bio$species)
cSpecPct <- cSpecPct/length(bio$species)
class(cSpecPct)
#Convert the table, <cSpecPct>, to a data frame named <u> 
u <- as.data.frame(cSpecPct)
class(u)
#Create a barplot of <cSpec>
par(mar=c(4,6,3,8))
barplot(cSpec,
        main = "Fish Count",
        xlab = "COUNTS",
        ylab = "",
        cex.axis=0.6,
        cex.names=0.7,
        col = "Light Green",
        horiz = TRUE,
        las = 1)
#Create a barplot of <cSpecPct>
par(mar=c(4,6,8,8))
barplot(d$counts,
        main = "Fish Relative Frequency",
        xlab = "COUNTS",
        ylab = "",
        ylim = range(0,4),
        cex.axis=0.6,
        cex.names=0.7,
        col = "Light Green",
        col.axis = "Species Pareto",
        horiz = TRUE,
        las = 1)
#Rearrange the <u> cSpec Pct data frame in descending order as <d>
d <- u %>% arrange(desc(Freq))
#remaing d cols
d <- select(d,Species = Var1 , RelFreq = Freq)

#adding new vars to d
d <- data.frame(d,cumfreq = rep(c(NA),times=8),counts=rep(c(NA),times=8),cumcounts = rep(c(NA),times=8))
#Create a parameter variable <def_par> to store parameter variables
def_par = c()
#creating <pc> bar chart
pc <- barplot(d$RelFreq,
        width = 1, space = 0.15,axes = F,border = NA,
        main = "Species Pareto",
        xlab = "Cummulative Counts",
        ylab = "",
        ylim = c(0,3.05),
        names.arg = d$Species,
        cex.axis=0.6,
        cex.names=0.7,
        col = "Light Green",
        col.axis = "Light Blue",
        horiz = TRUE,
        las = 2,
        )
# Add a cumulative counts line to the <pc> plot
par(def_par)
par(mar=c(5,3,3,4))
barplot(d$RelFreq,
        width = 1, space = 0.15,axes = F,border = NA,
        main = "Species Pareto",
        sub = "Movahedi",
        xlab = "Cummulative Counts",
        ylab = "",
        ylim = c(0,3.05),
        names.arg = d$Species,
        cex.axis=0.6,
        cex.names=0.7,
        col = "Light Green",
        col.axis = "Light Blue",
        horiz = FALSE,
        las = 2,
        )
d <- arrange(d, desc(RelFreq)) %>%
  mutate(
    cumsum = cumsum(RelFreq),
    freq = round(RelFreq / sum(RelFreq), 3),
    cum_freq = cumsum(freq)
  )
lines(pc, d$cumsum, type = "b", cex = 0.7, pch = 20, col="cyan4")

#placing a box around the chart
box(col = "grey62")

# Add a left side axis
axis(2, at=pc,labels=pc, col.axis="grey62",cex.axis=0.8, tck=-.01, las=0)
#Add axis details on right side of box with the specifications

axis(4, at=pc,labels=d$cum_freq,
     col.axis="cyan", las=2, cex.axis=0.8, tck=-.01)



