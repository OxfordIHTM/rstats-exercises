library(ggplot2)

ba = read.table("https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/ba.dat",header=TRUE)

average = rowMeans(ba)
ba$average = average
#Mean differences 
difference <- ba$Wright - ba$Mini
ba$difference = difference
mean_difference = mean(difference)

#Confidence interval
lower <- mean_difference - 1.96*sd(ba$difference)
upper <- mean_difference + 1.96*sd(ba$difference)

#Create Bland Altman Plot
ggplot(ba, aes(x = average, y = difference)) +
  geom_point() +
  geom_hline(yintercept = mean_difference) +
  geom_hline(yintercept = lower, color = "red", linetype="dashed") +
  geom_hline(yintercept = upper, color = "red", linetype="dashed") +
  ylab("PEFR (l/min) Mini Wright meter - Wright meter ") +
  xlab("PEFR (l/min) Mini Wright meter + Wright meter / 2")

BandA =function(W,M){
  meanD=mean(abs(W-M))
  SDD=sd(abs(W-M))
  L=meanD-1.96*SDD
  U=meanD+1.96*SDD
  
  return (list(meanD,L,U))
   
}

H = BandA(ba$Wright,ba$Mini)

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

