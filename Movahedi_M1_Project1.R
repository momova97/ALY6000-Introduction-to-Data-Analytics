print("Mohammad Hossein Movahedi")
install.packages("vcd")
library(vcd)
sales <- c(7,11,15,20,19,11,18,10,6,22)
temp <- c(69,81,77,84,80,97,87,70,65,90)
plot(sales,temp)
mean(temp)
sales <- sales[-3]
sales <- append(sales,16,2)
names <- c("Tom", "Dick", "Harry")
mat <- matrix(1:10, nrow=5, ncol=2)
icSales <- data.frame(sales,temp)
icSales
str(icSales)
summary(icSales)
library(readr)
Student <- read_csv("Student.csv")
str(Student)

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