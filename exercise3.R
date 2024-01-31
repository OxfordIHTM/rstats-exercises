#Install tidyverse packages for this activity

install.packages("tidyverse")
install.packages("ggthemes")
library(tidyverse)
library(ggthemes)

#Load malaria data Rstudio

malaria_data <- read.table("https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/malaria.dat",header=TRUE)

#View malaria data

malaria_data

#Assign time and cases as per the data

time <- malaria_data$Time

cases <- malaria_data$Cases

rain <- malaria_data$Rain

#plot malaria cases over time and labels

ggplot(malaria_data, aes(x= time, y= cases)) +geom_point() +labs(title="Malaria Cases Over Time")

#plot amount of rain over time and adding labels

ggplot(malaria_data, aes(x=time, y= rain)) +geom_point(color="red") +labs(title="Amount of Rain over Time",x="Time", y= "Rain")
