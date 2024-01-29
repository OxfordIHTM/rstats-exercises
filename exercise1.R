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

# Example usage:
wright_measurements <- c(20, 22, 24, 18, 21)
miniwright_measurements <- c(19, 21, 23, 17, 20)

bland_altman_results <- calculate_bland_altman(wright_measurements, miniwright_measurements)

# Access the results
print(bland_altman_results$mean_measurement)
print(bland_altman_results$difference)
print(bland_altman_results$mean_difference)
print(bland_altman_results$lower_limit)
print(bland_altman_results$upper_limit)

