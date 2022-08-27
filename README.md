# Predicting Price of Diamonds with SAS Programming

## 1. Introduction
The dataset that we have chosen to use for this assignment is the diamonds Dataset that is available as a built-in dataset in the ggplot2 package in R and was accessed through Tidyverse’s official GitHub repository of raw datasets for ggplot2. The original source of this dataset is from the Loose Diamonds Search Engine website (Fairfield County Diamonds, Inc., n.d.).  

Dataset Source Link: https://github.com/tidyverse/ggplot2/blob/main/data-raw/diamonds.csv  


This dataset contains 53940 rows of data and 10 variables which are Carat, Cut, Colour, Clarity, Depth, Table, Price, x, y, and z. Carat describes the weight of the diamond, Cut describes the cut quality of the diamond graded by Fair, Good, Very Good, Premium, Ideal, Colour describes the colour of the diamond where D is the best colour and J is the worst, Clarity describes how clear the diamond is, it is graded by I1, SI2, SI1, VS2, VS1, VVS2, VVS1, IF, where I1 is the worst and IF is the best. For example, l1 means “level 1 Included”, FL means “Flawless”, VS means “Very Slightly Included”, VVS means “Very Very Slightly Included”, and so on. Depth (depthPercent) describes the height of a diamond, measured from the culet to the table, divided by its average girdle diameter. Table is the width of the diamond's table expressed as a percentage of its average diameter, Price is the price of the diamond in US dollars, x (length) is the length of the diamond in millimetres, y (width) is the width of the diamond in millimetres, and z (depth) is the depth of the diamond in millimetres. The variables carat, depth, table, price, x, y, and z are continuous variables whereas cut, colour, and clarity are categorical ordinal variables in this dataset.  

The analysis objectives of this assignment using the diamonds dataset are to identify trends and patterns from the data and to predict the price of diamonds based on the other features in this dataset. SAS Studio is used as the SAS programming interface for this project.

## 2. Descriptive Analysis
Before performing statistical modelling and analysis on our dataset, it is necessary to deploy descriptive analysis to better understand and get an overview of the dataset.  

![image](https://user-images.githubusercontent.com/69787181/187031375-0fb5d20b-40b5-4e6c-a76b-dc7c62fae7c7.png)

As shown in Figure 1, we observed the output table that lists out the variables of our dataset as well as the data type that was interpreted by SAS studio. As expected, the data type of variable cut, colour and clarity are character data types (char) whereas all the other variables are in numeric data (num).  

In view that we are interested in using a multiple linear regression model to predict the price of diamonds and linear regression model requires all input variables to be numeric, we encoded the variables cut, colour and clarity are ordinal categorical variables to numeric variables. As shown in Figure 2, the values of cut variable Fair, Good, Very Good, Premium and Ideal are encoded to the numbers 1 to 5 respectively; the values of color variable J, I, H, G, F, E and D are encoded to the numbers 1 to 7 respectively; the values of clarity variable SI2, SI1, VS2, VS1, VVS2, VVS1, IF are encoded to the numbers 1 to 8 respectively. The encoded variables cut, color and clarity are then assigned to new columns namely cutNo, colorNo and clarityNo.




















