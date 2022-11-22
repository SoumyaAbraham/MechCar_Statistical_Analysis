library(dplyr) # load dplyr package
library(tidyverse)
mechaCar_data <- read.csv('MechaCar_mpg.csv', check.names = F, stringsAsFactors = F) # import csv
mechaCar_reg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD , data=mechaCar_data) #linear regression (lm()) to pass columns as data parameters
summary(mechaCar_reg)
