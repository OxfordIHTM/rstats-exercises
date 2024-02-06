ba = read.table("https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/ba.dat",header=TRUE)

meanW= mean(ba$Wright)

calculate_bland_altman <- function(wright_measurements, miniwright_measurements) {
  # Calculate metrics
  mean_measurement <- (wright_measurements + miniwright_measurements) / 2
  difference <- wright_measurements - miniwright_measurements
  mean_difference <- mean(difference)
  std_difference <- sd(difference)
  
  # Limits of agreement
  lower_limit <- mean_difference - 1.96 * std_difference
  upper_limit <- mean_difference + 1.96 * std_difference
  
  # Create a list to store the results
  results <- list(
    mean_measurement = mean_measurement,
    difference = difference,
    mean_difference = mean_difference,
    lower_limit = lower_limit,
    upper_limit = upper_limit
  )
  
  return(results)
}

BandA =function(W,M){
  meanD=mean(abs(W-M))
  SDD=sd(abs(W-M))
  L=meanD-1.96*SDD
  U=meanD+1.96*SDD
  
  return (list(meanD,L,U))
   
}

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


