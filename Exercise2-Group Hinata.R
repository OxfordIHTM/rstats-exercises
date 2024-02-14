# Install and load necessary packages
#install.packages("gtsummary")
#library(gtsummary)
#library(ggplot2)

# Read the fem.dat dataset
fem_data <- read.table("https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/fem.dat", header = TRUE)

# Summary of variables for AGE, IQ, and WT
summary(fem_data[ , c("AGE", "IQ", "WT")])

# Summary in tabular form using gtsummary
summary_table <- tbl_summary(fem_data)
summary_table

# Create boxplots for AGE, IQ, and WT
par(mfrow=c(1,3))
boxplot(fem_data$AGE, main="Age", col="skyblue", border="black")
boxplot(fem_data$IQ, main="IQ", col="lightgreen", border="black")
boxplot(fem_data$WT, main="Weight", col="lightcoral", border="black")
par(mfrow=c(0,0))
