#first excercise code to read the .dat file
ba <- read.table(file = "https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/ba.dat", header = TRUE, sep = ' ')
calculate_mean <- function(x,y){
  avrg = (x+y)/2
  avrg
}
ba$mean <- calculate_mean(ba$Wright,ba$Mini)
calculate_diff <- function(x,y){
  diff = x-y
  diff
}
ba$diff <- calculate_diff(ba$Wright,ba$Mini)
ba$diffmean <- mean(ba$diff)
?mean

#creating functions for the upper and lower intervals
conf_intupp <- function(x,y){
  upper = x+1.96*sd(y)
  upper
}

conf_intlow <- function(x,y){
  lower = x-1.96*sd(y)
  lower
}

#creating corresponding columns for the intervals
ba$upper <- conf_intupp(ba$diffmean,ba$diff)
ba$lower <- conf_intlow(ba$diffmean,ba$diff)