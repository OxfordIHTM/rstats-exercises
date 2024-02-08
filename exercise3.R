# Time series plotting and analysis --------------------------------------------


## Load package dependencies ----


## Load malaria data ----
malaria_data <- read.table("https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/malaria.dat",header=TRUE)


## Exploratory data analysis ----
plot(malaria_data$Cases,type="l")

plot(as.factor(malaria_data$Time),malaria_data$Cases,type="l")

cases.ts <- ts(malaria_data$Cases,start=c(1997,7),frequency=12)

plot(cases.ts)
