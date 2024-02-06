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

