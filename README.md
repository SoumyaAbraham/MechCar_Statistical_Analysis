## MechCar Statistical Analysis

### OVERVIEW

We are looking into a currently suffering prototype of AutosRUs' -- the MechaCar. Our goal is to shed some light on what may help the manufacturing team overcome the production troubles they may be having.

There are two csvs that we are working with in this project-  

  * [MechaCar_mpg.csv](https://github.com/SoumyaAbraham/MechCar_Statistical_Analysis/blob/main/MechaCar_mpg.csv)  
  
  * [Suspension_Coil.csv](https://github.com/SoumyaAbraham/MechCar_Statistical_Analysis/blob/main/Suspension_Coil.csv)

Let us take a look at the project in depth:

#### DELIVERABLE 1:

### Linear Regression to Predict MPG

For Deliverable 1, we design a linear model that will predict the mpg of the MechaCar prototypes using the variables in [MechaCar_mpg.csv](https://github.com/SoumyaAbraham/MechCar_Statistical_Analysis/blob/main/MechaCar_mpg.csv). 

This is what the code looks like:

![code1](https://github.com/SoumyaAbraham/MechCar_Statistical_Analysis/blob/main/Screenshots/deliverable1_code.png)

You will notice the following steps:

1. Load *dplyr* and *tidyverse* libraries.

2. Import the MechaCar csv into RStudio.
	
3. Run linear regression on mpg, passing dataframe columns as the data parameters.  

4. Run the summary() function to find out the p-value and r-squared value of the linear regression. 

This is what the result looks like: 

![summary1](https://github.com/SoumyaAbraham/MechCar_Statistical_Analysis/blob/main/Screenshots/deliverable1_summary.png)  


Let is address a couple important questions:  

#### 1. Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?  

If we take a look at the values for each parameter, we can see that vehicle_length and ground_clearance have a p-value <0.05.
We thus conclude that there is enough evidence to reject the Null Hypothesis that suggests that the values are all independent of each other.  
*This means the vehicle length and the ground clearance have a significant effect on the mpg*.  
On the other hand, the vehicle_weight, spoiler_angle and All Wheel Drive (AWD) have p values >0.05.
Thus, for vehicle_weight, spoiler_angle and AWD, there is not enough proof to reject the Null Hypothesis.  
This means *these variables do not have a significant effect on the mpg.* 

#### 2. Is the slope of the linear model considered to be zero? Why or why not?  

If you look at the summary for the lm(), you can see that the p-value is 5.35 e-11 << 0.05.  
This means there is enough proof to reject the Null Hypothesis, further indicating that *the slope is not 0*.  

#### 3. Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?  

Once again, let us take a look at the summary statistics we have just calculated. Notice the *r-squared value os 0.7149*.
This means approximately 71% if all mpg predictions are determined by this mode. That is a significantly high amount of predictions.
Thus, *we can conclude that the model does a decent job of predicting the mpg of the prototypes effectively.*

#### DELIVERABLE 2:

### Summary Statistics on Suspension Coils

In this portion of the project, we will be using the [Suspension_Coil.csv](https://github.com/SoumyaAbraham/MechCar_Statistical_Analysis/blob/main/Suspension_Coil.csv) dataset to determine if the manufacturing process is consistent across production lots. 

The code for this deliverable looks like this:

![code2](https://github.com/SoumyaAbraham/MechCar_Statistical_Analysis/blob/main/Screenshots/del2_codes.png)

We can see here that we have to:

1. Import Suspension_Coil csv file into RStudio

2. Find total summary of data to get the mean, variance, standard deviation of the PSI column

3. Find the summary per lot of data to get the mean, variance and standard deviation of the PSO column

Let us use this information to answer a pressing question:  

#### The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?

There are two steps to answering this question. 
First, let us take into consideration, our summary statistics for all lots.  

![allLots](https://github.com/SoumyaAbraham/MechCar_Statistical_Analysis/blob/main/Screenshots/deliverable2_summary.png)

Notice that the variance for suspension coils is 62.29 PSI which is well within the specified 100 PSI limit.  
*Therefore, as a whole, MechaCar meets the specifications.*

Now let us take a look at each lot, separately.  

![eachLot](https://github.com/SoumyaAbraham/MechCar_Statistical_Analysis/blob/main/Screenshots/deliverable2_LotSummary.png)

The variance for Lot 1 = 0.98 and that of Lot 2 = 7.47. These are both securely below the 100 PSI limit.  
However, if you look at Lot 3, the variance = 170.29. This is a lot higher than the allowed 100 PSI.  
We have now pinpointed the Manufacturing Lot that is struggling.   
The following box plot visualizes this difference quite well:

![boxPLot](https://github.com/SoumyaAbraham/MechCar_Statistical_Analysis/blob/main/Screenshots/plt2_each.png)

You can clearly see that Lot 3 has quite a few possible outliers and is the troubled lot. 

#### DELIVERABLE 3:

### T-Tests on Suspension Coils

In this phase, we are going to perform t-tests to determine if all the manufacturing lots and each individual lot are statistically different from the (assumed) population mean of 1,500 PSI.

This is what the code looks like: 

![code3](https://github.com/SoumyaAbraham/MechCar_Statistical_Analysis/blob/main/Screenshots/del3_codes.png)


The first step here is to perform a t-test across all the lots to see if the PSI is statistically different from the population mean of 1,500 PSI.

The result is as follows:

![ttest_all](https://github.com/SoumyaAbraham/MechCar_Statistical_Analysis/blob/main/Screenshots/deliverable3_ttest_all.png)

Notice that the *mean of x = 1498.78*.
Also, the *p value of x = 0.06028*.

Therefore, we can conclude that *there is not enough evidence to reject supporting the Null Hypothesis.*  
This means the mean of the three manufacturing lots are statistically similar to the presumed population mean of 1,500 PSI.

Now let us take a look at the t-tests performed for each manufacturing lot to see if the PSI is statistically different from the population mean of 1,500 PSI.  

The results are:  

![ttest_each](https://github.com/SoumyaAbraham/MechCar_Statistical_Analysis/blob/main/Screenshots/deliverable3_ttest_each.png)

If we take a look at each on separately:

1. Lot 1:  
mean of x = 1500  
p-value = 1 (>0.05)

2. Lot 2:  
mean of x = 1500.2    
p-value = 0.6072(>0.05)

In these two cases, the p-values are well above 0.05 and therefore, *the Null Hypothesis is not rejected. As seen by the true values of x mean, they are equal to 1,500*.

3. Lot 3:   
mean of x = 1496.14    
p-value = 0.04168 (<0.05)  

Here, there is enough proof to reject the Null Hypothesis. This means that *the presumed population mean (1,500) and the sample mean (1496.14 in this case) are different.*

#### DELIVERABLE 4:

### Study Design: MechaCar vs Competition

Here is a proposal for a statistical analysis in order to compare the performance between MechaCar and their competition.  

#### 1. Collecting the following data for the past 3 years from similar models across major competition:

* Cost of Car- Does the overall cost of the car affect the performance?
* Cost of Maintenance- How much does the future maintenance cost affect the customer's decision?
* Engine Type (Electric/Hybrid/Gas)
* Customer Demographic- How does the age, income, family structure or occupation affect overall performance?
	
#### 2. Hypotheses:  
Once we have determined the key factors that are key, we must propose the Null Hypothesis and the alternative Hypothesis.

* Null Hypothesis (H<sub>0</sub>): MechaCar's performance is based on each key factor determined.
* Alternative Hypothesis (H<sub>a</sub>): MechaCar's performance is NOT based on eachkey factor determined.

#### 3. Statistical Tests:

A linear regression lm() could help determine which factors are dependent and independent variables. 
This is a good starting point to understand how to improve the performance at MechaCar.

---

You may access the data used for this project here:  

[MechaCar Challenge Code](https://github.com/SoumyaAbraham/MechCar_Statistical_Analysis/blob/main/MechaCarChallenge.R)  
[MechaCar_mpg.csv](https://github.com/SoumyaAbraham/MechCar_Statistical_Analysis/blob/main/MechaCar_mpg.csv)  
[Suspension_coil.csv](https://github.com/SoumyaAbraham/MechCar_Statistical_Analysis/blob/main/Suspension_Coil.csv)
