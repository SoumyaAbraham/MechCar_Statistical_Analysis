
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

# DELIVERABLE 3

# box plot for PSI for all lots
plt1<- ggplot(suspCoil_data, aes(y=PSI))
plt1 + geom_boxplot()

# Use t.test() to determine if the PSI across all lots is statistically different from population mean of 1,500 PSI
t.test(suspCoil_data$PSI, mu=1500)

# box plot for PSI for each lot
plt2<- ggplot(suspCoil_data, aes(x=Manufacturing_Lot, y= PSI))
plt2 + geom_boxplot()

# Use t.test to determine if the PSI for each lot is statistically different from population mean of 1,500 PSI
lot1<- subset(suspCoil_data, Manufacturing_Lot == 'Lot1')
lot2<- subset(suspCoil_data, Manufacturing_Lot == 'Lot2')
lot3<- subset(suspCoil_data, Manufacturing_Lot == 'Lot3')

t.test(lot1$PSI, mu=1500)
t.test(lot2$PSI, mu=1500)
t.test(lot3$PSI, mu=1500)

