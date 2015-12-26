# get-clean-data-project
The run_analysis.R script is a code in R with the purpose to create a tidy data set containing the mean values from a raw 
dataset containig information collected by the accelerometers from the Samsung Galaxy S smartphone.
This code uses the dplyr package in R for some of its functions.
Initialy it merges the training and the test sets to create one data set for all the 30 subjects that participated in the collection of data, while providing descriptive names for the variables measured (for more information on the variables see the CodeBook).
Following the creation of the tidy data frame it collects only the variables that contain data on the mean and standard deviation of the measurements and then subsets them into groups according to the subject and the activity.
Finally it computes the mean for the different variables of each group and exracts it in the tidydata.txt.
