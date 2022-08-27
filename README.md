# Predicting Price of Diamonds with SAS Programming

## 1. Introduction
The dataset that we have chosen to use for this assignment is the diamonds Dataset that is available as a built-in dataset in the ggplot2 package in R and was accessed through Tidyverse’s official GitHub repository of raw datasets for ggplot2. The original source of this dataset is from the Loose Diamonds Search Engine website (Fairfield County Diamonds, Inc., n.d.).  

Dataset Source Link: https://github.com/tidyverse/ggplot2/blob/main/data-raw/diamonds.csv  


This dataset contains 53940 rows of data and 10 variables which are Carat, Cut, Colour, Clarity, Depth, Table, Price, x, y, and z. Carat describes the weight of the diamond, Cut describes the cut quality of the diamond graded by Fair, Good, Very Good, Premium, Ideal, Colour describes the colour of the diamond where D is the best colour and J is the worst, Clarity describes how clear the diamond is, it is graded by I1, SI2, SI1, VS2, VS1, VVS2, VVS1, IF, where I1 is the worst and IF is the best. For example, l1 means “level 1 Included”, FL means “Flawless”, VS means “Very Slightly Included”, VVS means “Very Very Slightly Included”, and so on. Depth (depthPercent) describes the height of a diamond, measured from the culet to the table, divided by its average girdle diameter. Table is the width of the diamond's table expressed as a percentage of its average diameter, Price is the price of the diamond in US dollars, x (length) is the length of the diamond in millimetres, y (width) is the width of the diamond in millimetres, and z (depth) is the depth of the diamond in millimetres. The variables carat, depth, table, price, x, y, and z are continuous variables whereas cut, colour, and clarity are categorical ordinal variables in this dataset.  

The analysis objectives of this assignment using the diamonds dataset are to identify trends and patterns from the data and to predict the price of diamonds based on the other features in this dataset. SAS Studio is used as the SAS programming interface for this project.

## 2. Descriptive Analysis
Before performing statistical modelling and analysis on our dataset, it is necessary to deploy descriptive analysis to better understand and get an overview of the dataset.  

<!---![image](https://user-images.githubusercontent.com/69787181/187031375-0fb5d20b-40b5-4e6c-a76b-dc7c62fae7c7.png)--->

<img src="https://user-images.githubusercontent.com/69787181/187031375-0fb5d20b-40b5-4e6c-a76b-dc7c62fae7c7.png" width=50% height=50%>  

As shown in Figure 1, we observed the output table that lists out the variables of our dataset as well as the data type that was interpreted by SAS studio. As expected, the data type of variable cut, colour and clarity are character data types (char) whereas all the other variables are in numeric data (num).  

In view that we are interested in using a multiple linear regression model to predict the price of diamonds and linear regression model requires all input variables to be numeric, we encoded the variables cut, colour and clarity are ordinal categorical variables to numeric variables. As shown in Figure 2, the values of cut variable Fair, Good, Very Good, Premium and Ideal are encoded to the numbers 1 to 5 respectively; the values of color variable J, I, H, G, F, E and D are encoded to the numbers 1 to 7 respectively; the values of clarity variable SI2, SI1, VS2, VS1, VVS2, VVS1, IF are encoded to the numbers 1 to 8 respectively. The encoded variables cut, color and clarity are then assigned to new columns namely cutNo, colorNo and clarityNo.  

![image](https://user-images.githubusercontent.com/69787181/187031590-c8dfe2ba-2caf-464d-9ac6-6463663f00d1.png)  

![image](https://user-images.githubusercontent.com/69787181/187031645-e442eaec-0691-4f23-94e0-3dd3e8adbd5b.png)  

Figure 3 displays the summary statistics of all 10 numeric variables that were interpreted by SAS studio. The mean price of the diamond is $3932.80, and the minimum and maximum price of the diamonds are $326.00 and $18823.00. The standard deviation of price is $3989.44, which is very close to the mean price, meaning that the data is centered around the mean, and data points are less dispersed. Furthermore, the mean carat of the diamond is 0.80 with minimum and maximum values of 0.20 and 5.01 carats respectively. The standard deviation of carat is 0.47, which is relatively far to the mean carat value, meaning that the data points are quite dispersed. This shows that the carat of diamonds in the dataset have a significant difference. Besides that, the mean of the variable table is 57.46%, with minimum and maximum values of 43.00% and 95.00% respectively. The standard deviation of the variable table is 2.23%, which is very far from the mean table percentage, meaning that the data points are very dispersed among each other. It is also observed that the minimum value of length, width and depth variables are 0, this suggests that there might be some faulty data in the dataset that should be cleaned. The table shows that there are no missing values in this dataset.  

After observing the summary statistics which shows the basic statistical measures such as the mean, median, range, standard deviation, minimum and maximum of the variables, we examined the frequency table (Figure 4) for variable cutNo colorNo and clarityNo

![Uploading image.png…]()

Next, we are interested in checking the normality assumption on the continuous variables carat, depth, table, price, x, y, and z. As shown in Figure 5, the Q-Q plot for each continuous variable is generated and examined. It is suggested that the residuals of all variables excluding the variable price do not significantly violate the normality assumption. The variable price is not normally distributed. According to a research by Li et al. (2012), linear regression is appropriate for analysis when dependent variable is not distributed normally given that dataset has a large sample size (>3000). However, we shall still consider the removal of high leverage points or outliers that are potential influential points and data transformation methods.  

















