# Time series plotting and analysis --------------------------------------------

## Load package dependencies ----
library(ggplot2)
library(dplyr)
library(tidyr)


## Load malaria data ----
malaria_data <- read.table("https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/malaria.dat",header=TRUE)


## Exploratory data analysis ----
plot(malaria_data$Cases,type="l")

### Convert time variable into factor ----
malaria_data$Time <- factor(malaria_data$Time,levels=malaria_data$Time)

plot(malaria_data[,c("Time","Cases")],type="l")

cases.ts <- ts(malaria_data$Cases,start=c(1997,7),frequency=12)

plot(cases.ts)

plot(malaria_data$Rain,type="l")

rain.ts <- ts(malaria_data$Rain,start=c(1997,7),frequency=12)

plot(rain.ts)

### Combined cases and rain over time ----
cases.rain.ts <- ts(cbind(malaria_data$Cases,malaria_data$Rain),start=c(1997,7),frequency=12)
plot(cases.rain.ts)

### Decompose cases ----
cases_decomp <- decompose(cases.ts)
plot(cases_decomp)

### Decompose rainfall ----
rain_decomp <- decompose(rain.ts)
plot(rain_decomp)

### Trend component for cases over time ----
trend_component_cases <- cases_decomp$trend
plot(trend_component_cases)

### Trend component for rain over time ----
trend_component_rain <- rain_decomp$trend
plot(trend_component_rain)

### Removal seasonal from trend ----
cases_adjusted <- cases_decomp$x - cases_decomp$seasonal
plot(cases_adjusted)

### Plot time series with ggplot ----

malaria_data %>%
  pivot_longer(Cases:Rain,names_to = "var",values_to = "n")%>%
  ggplot(mapping=aes(x=Time, y=n,group=var,color=var)) +
  geom_line(size=1) +
  scale_y_continuous(sec.axis = sec_axis(~ . * 2, name = "Rainfall (mm)")) +
  labs(
    title="Malaria cases and amount of rainfall over time",
    x="Months", y=""
  )+
  theme_bw()+
  theme(
    legend.position="top",
    legend.title = element_blank(),
    axis.text.x = element_text(angle=90,vjust = 0.5,hjust=1)
  )
