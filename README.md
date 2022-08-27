# Predicting_Price_of_Diamonds_with_SAS

## 1. Introduction
The dataset that we have chosen to use for this assignment is the diamonds Dataset that is available as a built-in dataset in the ggplot2 package in R and was accessed through Tidyverse’s official GitHub repository of raw datasets for ggplot2. The original source of this dataset is from the Loose Diamonds Search Engine website (Fairfield County Diamonds, Inc., n.d.).  

Dataset Source Link: https://github.com/tidyverse/ggplot2/blob/main/data-raw/diamonds.csv  


This dataset contains 53940 rows of data and 10 variables which are Carat, Cut, Colour, Clarity, Depth, Table, Price, x, y, and z. Carat describes the weight of the diamond, Cut describes the cut quality of the diamond graded by Fair, Good, Very Good, Premium, Ideal, Colour describes the colour of the diamond where D is the best colour and J is the worst, Clarity describes how clear the diamond is, it is graded by I1, SI2, SI1, VS2, VS1, VVS2, VVS1, IF, where I1 is the worst and IF is the best. For example, l1 means “level 1 Included”, FL means “Flawless”, VS means “Very Slightly Included”, VVS means “Very Very Slightly Included”, and so on. Depth (depthPercent) describes the height of a diamond, measured from the culet to the table, divided by its average girdle diameter. Table is the width of the diamond's table expressed as a percentage of its average diameter, Price is the price of the diamond in US dollars, x (length) is the length of the diamond in millimetres, y (width) is the width of the diamond in millimetres, and z (depth) is the depth of the diamond in millimetres. The variables carat, depth, table, price, x, y, and z are continuous variables whereas cut, colour, and clarity are categorical ordinal variables in this dataset.  

The analysis objectives of this assignment using the diamonds dataset are to identify trends and patterns from the data and to predict the price of diamonds based on the other features in this dataset. SAS Studio is used as the SAS programming interface for this project.
