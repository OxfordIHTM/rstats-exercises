?read.table
ba <- read.table(file = url("https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/ba.dat"), header = TRUE, sep = " ")

meanWright <- mean(ba$Wright)
meanMini <- mean(ba$Mini)

ba[,3] = ba$Wright-ba$Mini
colnames(ba)[colnames(ba) == "V3"] <- "Difference"

meanDifference <- mean(ba$Difference)
upperCI <- meanDifference + 1.96 * sd(ba$Difference)
lowerCI <- meanDifference - 1.96 * sd(ba$Difference)