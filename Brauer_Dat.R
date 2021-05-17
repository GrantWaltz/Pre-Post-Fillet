#read in data
fishdat <- read.csv("Top_4_Length_Distribution.csv")
head(fishdat)
library(dbplyr)
library(tidyverse)
#rename species id
fishdat2 = fishdat %>% 
  mutate(species = case_when (
    speid == 16 ~ "Blue rockfish",
    speid == 3 ~ "Gopher rockfish",
    speid == 15 ~ "Vermilion rockfish",
    speid == 4 ~ "Copper rockfish"
  ))
head(fishdat2)
#makes histogram from fishdat2 using prefillet column 
hist(fishdat2$pref)

#makes histogram with only blue rockfish
with(subset(fishdat2, species == "Blue rockfish"), hist(pref))

## same as code above
hist(fishdat2$pref[fishdat2$species == "Blue rockfish"])
hist(fishdat2$pref[fishdat2$species == "Copper rockfish"])
hist(fishdat2$pref[fishdat2$species == "Vermilion rockfish"])
hist(fishdat2$pref[fishdat2$species == "Gopher rockfish"], col = "light blue")


