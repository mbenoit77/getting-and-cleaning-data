Feature Selection 
=================

From the features_info.txt file downloaded with the data from UCI:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
> 
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
> 
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

In the original dataset, the variables that were estimated from included full array of calculations including: 
* Mean value
* Standard deviation
* Median absolute deviation 
* Largest value in array
* Smallest value in array
* Signal magnitude area
* Energy measure. Sum of the squares divided by the number of values. 
* Interquartile range 
* Signal entropy
* Autorregresion coefficients with Burg order equal to 4
* correlation coefficient between two signals
* index of the frequency component with largest magnitude
* Weighted average of the frequency components to obtain a mean frequency
* skewness of the frequency domain signal 
* kurtosis of the frequency domain signal 
* Energy of a frequency interval within the 64 bins of the FFT of each window.
* Angle between to vectors.

From these variables, only the mean value and standard deviation were retained in this analysis. The others are discarded as the analysis is run.
