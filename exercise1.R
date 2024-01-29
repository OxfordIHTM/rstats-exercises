?read.table
ba <- read.table(file = url("https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/ba.dat"), header = TRUE, sep = " ")

meanWright <- mean(ba$Wright)
meanMini <- mean(ba$Mini)