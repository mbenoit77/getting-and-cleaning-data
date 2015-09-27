Human Activity Recognition Using Smartphones
============================================

This analysis simplifies the [Human Activity Recognition Using Smartphones Data Set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the UCI Machine Learning Repository. To reproduce the analysis, perform all steps in the run_analysis.R file. CodeBook.md contains a codebook explaining the variables, including the differences from the full dataset from UCI. 

This analysis was performed with R Studio Version 0.99.446, running R 3.2.0 in a Windows 64-bit environment. Reproducing this analysis in other environments might require slight code changes. The reshape2 package is used in this analysis and should be installed prior to running the run_analysis.R file.

The run_analysis.R file performs the following tasks:

* Loads the reshape2 library.
* Downloads the dataset, if the required file doesn't already exist. 
* Unzips the dataset, if the required directory doesn't already exist.
* Reads the data from features.txt into a dataframe named headers.
* Reads the testing and training data from X_test.txt and X_train.txt into separate dataframes that are then combined into a dataframe named fullDF.
* Pares the fullDF dataframe down to include only mean and standard deviation columns, into a new dataframe called meanStdDF. The `grep()` function is used to perform this task, based on the aforementioned headers dataframe. The regular expression used is `(mean\\(|std\\()`.
* The numeric/factor activity data is read in from the y_test.txt and y_train.txt files and stored into a combined dataframe called fullActivityDF. 
* The activity labels are read in from the activity_labels.txt file and stored into a dataframe named activtiesDF. 
* Adds an Activity column to meanStdDF as a factor, looking up the values from the activtiesDF dataframe. 
* Labels the data variables in meanStdDF with the values from the headers dataframe, using the grep() function with the same regular expression as before (`(mean\\(|std\\()`). 
* Reads in the SubjectID data from subject_test.txt and subject_train.txt and combines into one dataframe, which is then appended to the meanStdDF dataframe.
* Creates a melted dataframe called meltedDF by using the melt() function from the reshape2 package, using the SubjectID and Activity as the identity variables.
* Creates the tidyDataSetDF dataframe by using the dcast() function from the reshape2 package to perform the mean aggregation function grouped by both SubjectID and identity. 
* Writes out the tidyDataSet dataframe to a file named tidyDataSet.txt.
