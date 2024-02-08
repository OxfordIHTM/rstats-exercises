# Methods for assessing agreement between two methods of clinical measurement ----

## Load package dependencies ----


## Read data ----
ba = read.table("https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/ba.dat",header=TRUE)


## Create function/s for calculating Bland and Altman metrics ----

### BandA function from @marianortt ----
BandA =function(W,M){
  meanD=mean(abs(W-M))
  SDD=sd(abs(W-M))
  L=meanD-1.96*SDD
  U=meanD+1.96*SDD
  
  return (list(meanD,L,U))
   
}

### Test BandA function ----
H = BandA(ba$Wright,ba$Mini)


### Function from @clicoselis ----

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

### Test the function ----
value_list <- calculate_limits_of_agreement(ba$Wright, ba$Mini)

