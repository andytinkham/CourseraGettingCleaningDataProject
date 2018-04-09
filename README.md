# CourseraGettingCleaningDataProject

This project provides my solution to the Week 4 project for the Getting and 
Cleaning Data course in the Coursera/Johns Hopkins University Data Science 
Specialization.

This script retrieves the data provided for the project (originally sourced 
from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
but provided at a persistent link under the instructor's control for this 
project). The data files provided are combined into one data set, with the
test and train sets merged together. Then, measurements of the mean and 
standard deviation are extracted for each feature in the original data. The data 
is made tidy, cleaned up, and named appropriately, and then the script returns
a new data set providing the average of each variable for each activity and 
each subject. See the [Code Book](CodeBook.md) file for more information on 
the output data set.

## Files
Included in this repository are 6 files:
* .gitignore -- keeps the source data from being checked in
* CodeBook.md -- describes each variable in the output data set
* GettingCleaningDataProject.Rproj -- the RStudio project file
* README.md -- This file. Describes the project
* outputdataset.txt -- The data set described in the CodeBook.md file. It was 
   output using R's write.table function with row.names = FALSE specified
* run_analysis.R -- The R script that actually retrieves the data, manipulates
   it and generates the outputted data set
   
## Getting Started
Fork or clone this repository to your local machine. 
### Prerequisites
This project uses the following R packages:
* [data.table](https://github.com/Rdatatable/data.table/wiki)
* [dplyr](https://dplyr.tidyverse.org/)
* [reshape2](https://github.com/hadley/reshape)

### Installation
Install the above packages using install.package. Then source the run_analysis.R
script. 

## Author
* [Andy Tinkham](http://andy.tinkham.org)

## Acknowledgments
* All the people posting in the course forums, and particularly the course mentors
* David Hood, for his long and useful [post](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/) 
of advice for the course
