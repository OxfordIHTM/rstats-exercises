ba = read.table("https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/ba.dat",header=TRUE)

##mean difference 
differences <- ba$Wright - ba$Mini
mean_difference <- mean(differences)

calculate_limits_of_agreement <- function(wright, mini){
  
##difference of per subject measurements
differences <- wright - mini

##calculate mean difference
mean_difference <- mean(differences)

##calculate sd of difference
sd_difference <- sd(differences)

limit_multiplier <- 1.96


lower_limit = mean_difference - (limit_multiplier * sd_difference)
upper_limit = mean_difference + (limit_multiplier * sd_difference)

return(list(mean_difference,differences,lower_limit,upper_limit))
}

value_list <- calculate_limits_of_agreement(ba$Wright, ba$Mini)




