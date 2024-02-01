# Install and load necessary packages
install.packages("foreign")
library(foreign)

# Read the fem.dat dataset
url <- "https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/fem.dat"
fem_data <- read.table(url, header = TRUE)

# Convert relevant columns to numeric
numeric_columns <- c("AGE", "IQ", "WT")
fem_data[, numeric_columns] <- lapply(fem_data[, numeric_columns], as.numeric)

# Summary of variables for AGE, IQ, and WT
summary(fem_data[, numeric_columns])

# Create boxplots for AGE, IQ, and WT
par(mfrow=c(1,3))
boxplot(fem_data$AGE, main="Age", col="skyblue", border="black")
boxplot(fem_data$IQ, main="IQ", col="lightgreen", border="black")
boxplot(fem_data$WT, main="Weight", col="lightcoral", border="black")