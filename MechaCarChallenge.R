# DELIVERABLE 1

# load dplyr package
library(dplyr) 

# load tidyverse
library(tidyverse) 

# import csv
mechaCar_data <- read.csv('MechaCar_mpg.csv', check.names = F, stringsAsFactors = F) 

# linear regression (lm()) to pass columns as data parameters
mechaCar_reg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD , data=mechaCar_data) 

# linear regression 
summary(mechaCar_reg)

# DELIVERABLE 2

# import csv
suspCoil_data <- read.csv('Suspension_Coil.csv', check.names = F, stringsAsFactors = F) 

# total_summary dataframe using summarize() fn to get mean, median, variance, standard dev of PSI column
total_summary<- suspCoil_data %>% summarize(Mean_PSI= mean(PSI),
                                            Median_PSI= median(PSI),
                                            Variance_PSI= var(PSI),
                                            StdDev_PSI= sd(PSI),
                                            Num_Coil=n(), .groups = 'keep')

# lot_summary using group_by() and summarize() fns to group manufacturing lot by mean, median, variance and st.dev for PSI
lot_summary<- suspCoil_data %>% group_by(Manufacturing_Lot) %>% summarize (Mean_PSI= mean(PSI),
                                                                          Median_PSI= median(PSI),
                                                                          Variance_PSI= var(PSI),
                                                                          StdDev_PSI= sd(PSI),
                                                                          Num_Coil=n(), .groups = 'keep')

