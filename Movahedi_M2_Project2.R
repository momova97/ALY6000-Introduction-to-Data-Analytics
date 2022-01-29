#Print my name at the top of the script
print("Plotting Basics:Movahedi")
#Importing required libraries

install.packages("FSA")
install.packages("FSAdata")
install.packages("magrittr")
install.packages("dplyr")
install.packages("plotrix")
install.packages("ggplot2")
install.packages("moments")
install.packages("plotly")
#loading installed libraries
library(FSA)
library(FSAdata)
library(magrittr)
library(dplyr)
library(plotrix)
library(ggplot2)
library(moments)
library(plotly)
#loading data set
data(BullTroutRML2)
#showing first three lines
print(head(BullTroutRML2, n = 3L))
#showing last three lines
print(tail(BullTroutRML2, n = 3L))
#make a copy of original dataset so my mistakes don't affect original data
Harrison_Lake <- BullTroutRML2
#cheak the structure of dataset to be able to set filter
str(Harrison_Lake)
#set the filter
Harrison_Lake <- filter(Harrison_Lake, lake == "Harrison")
#display first and last 5 lines
head(Harrison_Lake, n = 5L)
tail(Harrison_Lake, n = 5L)
#displaying structure of the filtered BullTroutRML2 data set
str(Harrison_Lake)
# Display the summary of the filtered BullTroutRML2 data set
summary(Harrison_Lake)


#creating scatter plot
#determining limits
#determining labels
ggplot(data = Harrison_Lake) + 
  geom_point(mapping = aes(x = fl, y = age))+
  xlim(0, 500) + ylim(0,15)+
  xlab("Fork Length (mm)")+ylab("Age (yrs)")+
  ggtitle("Plot 1: Harrison Lake Trout")
#ploting histogram for age
ggplot(data = Harrison_Lake, aes(x=age)) + geom_histogram(color="black", fill="cadetblue")+
  xlab("Frequency")+ylab("Age (yrs)")+
  labs(title="Plot 2: Harrison Fish Age Distribution")+
  xlim(0,15) + ylim(0,15)+
  theme(plot.title = element_text( color = "cadetblue"))
#Create 2d plot

p <- ggplot(data = Harrison_Lake, aes(y=age,x=fl))+
  xlab("Frequency")+ylab("Age (yrs)")+
  labs(title="Plot 3: Harrison Density Shaded by Era")+
  theme(plot.title = element_text( color = "cadetblue"))+
  xlim(0,500) + ylim(0,15)+
  geom_point(colour = "black")
  
# color 2d plot
p +
  stat_density2d(aes(color = factor(era))) + scale_colour_manual(values = c("green", "darkgreen"))

#creating tmp object containing first and last 3 lines of BullTroutRML2
tmp <- head(Harrison_Lake, n = 3L)
tmp <- rbind(tmp,tail(Harrison_Lake, n = 3L))  
print(tmp)
#display era only
era <- subset(tmp,select=c("era"))
print(era)
# creating pchs vector
pchs <- c("+","x")
# creating cols vector
cols <- c("red","gray60")
#turn era to numeric factor
tmp$era <- as.numeric(as.factor(tmp$era))
# Initialize the cols vector with the tmp era values
cols <- append(tmp$era,cols)
#create the + and x plot
plot(y=Harrison_Lake$age,x=Harrison_Lake$fl,main="Plot 4: Symbol & Color by Era",
     ylab="Age (yrs)",xlab="Fork Length (mm)",
     ylim=c(0,15),xlim=c(0,500),
     pch=pchs,col=cols)
#create regression line plot 5
plot(y=Harrison_Lake$age,x=Harrison_Lake$fl,main="“Plot 5: Regression 
Overlay",
     ylab="Age (yrs)",xlab="Fork Length (mm)",
     ylim=c(0,15),xlim=c(0,500),
     pch=pchs,col=cols)+abline(lm(Harrison_Lake$age ~ Harrison_Lake$fl))
#create plot 6
plot(y=Harrison_Lake$age,x=Harrison_Lake$fl,main="““Plot 6: :Legend Overlay",
     ylab="Age (yrs)",xlab="Fork Length (mm)",
     ylim=c(0,15),xlim=c(0,500),
     pch=pchs,col=cols)+abline(lm(Harrison_Lake$age ~ Harrison_Lake$fl))+
  legend("topleft", legend=c("regression line"),
         col=c("black"), lty=1:2, cex=0.8,
         title="Lines", text.font=1, bg="white")
  
  

