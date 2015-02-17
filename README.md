Getting & Cleaning Data: Project

This repo contains all the information describing the course project for the Getting & Cleaning Data course on Coursera.

Objective:
The objective was to download data files from a url, merge the data sets and transform into a tidy data set.

Raw Data:
There are two main data sets contained in txt files: a test data set and a training data set. Both have identical structures but not the same number of rows. Both files have equivalent text files that contain the features, activity labels and subject identifiers.

Script:
The script (run_Analysis.R) reads these files, manipulates them and outputs a tidy data set.
The general flow of the script is:
•	Read the data files
•	Reads the activity labels and the subject identifiers
•	Rename some of the columns to a more presentable format – mean and standard deviation
•	Merge the test and training data set
•	Select only the necessary columns – mean and standard deviation
•	In the data set, replace the activity codes by activity labels
•	Create a tidy summary table by activity

Code Book:
The codebook in this repository contains more details on the data and variables.

