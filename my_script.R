print("top of the file")

library(tidyverse) ##this loads in the package... they are *installed* in the install dependencies step that had packages installed in the "description" file in this repository

print("afterloading packages")

## some sample data 
plants <- data("PlantGrowth")
plants <- PlantGrowth


## demo analysis 
plants_summary <- plants %>% 
  group_by(group) %>% 
  summarize(mean_weight = mean(weight), sd_weight = sd(weight))


print(plants_summary)
