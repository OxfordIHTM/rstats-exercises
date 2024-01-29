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
