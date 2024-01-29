library(dplyr)
ba <- read.table("https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/ba.dat",header=TRUE)


summary(ba$Wright)
summary(ba$Mini)

ba_summary<- ba %>%
  mutate( Difference_ba= (Wright-Mini))

mean_difference <- ba %>%
  summarize(mean_difference = mean(Wright - Mini))

          

  