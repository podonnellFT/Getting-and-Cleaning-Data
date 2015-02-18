Code Book for run_Analysis.R

This code book contains all information on the mappings, transformations and variables applied in the R script run_Analysis in the Getting & Cleaning Data course project on Coursera.

Data Source:
The raw data comes from the "Human Activity Recognition Using Smartphones Data Set" downloaded from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Merging:
There were two main data sets: test and train.
On their own these data sets are meaningless so must be combined with other text files in the data set to make analysis possible.
The data files were downloaded, read into R and merged together into one data set with the same number of columns as the two originals.
To both data sets before merging, two extra columns were appended to the end of the data set:
•	Lables
•	Subject Identifiers

The activities are represented in the data sets as integers and so activity labels are read in from a text file. These labels are then substituted for the codes, again to make analysis possible and legible.

Column Name Replacing:
Each column represents a feature associated with the data.
In order to make these useful we read in a text file with the features – essentially a vector of column names.
For the final output – the tidy data set we are only interested in the mean and standard deviation. These variables are identified in the features data set by having the strings “–mean” and “–std” in their column names. We replace these with the names Mean and Std respectively.

Subsetting:
There are many other measurements in the data so we subset the data to retain only the ones we want – mean and std dev.

Finally, we can summarise the data set and create the final output – the tidy data set.
