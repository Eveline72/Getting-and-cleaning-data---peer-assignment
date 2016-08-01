# Code Book

## Original datasets

The original data consists of various files, that you can find here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It is all data collected from the accelerometers from the Samsung Galaxy S smartphone.

In essence, we have the following files:
- X_train.txt and X_test.txt, which both contain all kinds of movement variables
- features.txt contains the names of the activities, "belonging" to the movement variables in X_train.txt and X_test.txt
- y_train.txt and y_test.txt, which both contain which type of activity was undertaken
- activity_labels.txt, contains the names of the activities, "belonging" to the numbers in y_train.txt and y_test.txt
- subject_train.txt and subject_test.txt, which both contact identifiers for the subjects 

Some more info about the movement variables:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Creating a tidy dataset

Using all original files mentioned above, I created a tidy dataset. Which steps I took, and why I did so, is described in README.md

## Variable definitions of Xtidy.txt

Xtidy.txt has 81 columns (and is tab-delimited)

- 1 subject : Identifier for the subject (1:30)
- 2 activity : The activity undertaken by the subject (one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- 3 tBodyAccmeanX
- 4 tBodyAccmeanY
5 tBodyAccmeanZ
6 tBodyAccstdX
7 tBodyAccstdY
8 tBodyAccstdZ
9 tGravityAccmeanX
10 tGravityAccmeanY
11 tGravityAccmeanZ
12 tGravityAccstdX
13 tGravityAccstdY
14 tGravityAccstdZ
15 tBodyAccJerkmeanX
16 tBodyAccJerkmeanY
17 tBodyAccJerkmeanZ
18 tBodyAccJerkstdX
19 tBodyAccJerkstdY
20 tBodyAccJerkstdZ
21 tBodyGyromeanX
22 tBodyGyromeanY
23 tBodyGyromeanZ
24 tBodyGyrostdX
25 tBodyGyrostdY
26 tBodyGyrostdZ
27 tBodyGyroJerkmeanX
28 tBodyGyroJerkmeanY
29 tBodyGyroJerkmeanZ
30 tBodyGyroJerkstdX
31 tBodyGyroJerkstdY
32 tBodyGyroJerkstdZ
33 tBodyAccMagmean
34 tBodyAccMagstd
35 tGravityAccMagmean
36 tGravityAccMagstd
37 tBodyAccJerkMagmean
38 tBodyAccJerkMagstd
39 tBodyGyroMagmean
40 tBodyGyroMagstd
41 tBodyGyroJerkMagmean
42 tBodyGyroJerkMagstd
43 fBodyAccmeanX
44 fBodyAccmeanY
45 fBodyAccmeanZ
46 fBodyAccstdX
47 fBodyAccstdY
48 fBodyAccstdZ
49 fBodyAccmeanFreqX
50 fBodyAcc-meanFreq()-Y
51 fBodyAcc-meanFreq()-Z
52 fBodyAccJerk-mean()-X
53 fBodyAccJerk-mean()-Y
54 fBodyAccJerk-mean()-Z
55 fBodyAccJerk-std()-X
56 fBodyAccJerk-std()-Y
57 fBodyAccJerk-std()-Z
58 fBodyAccJerk-meanFreq()-X
59 fBodyAccJerk-meanFreq()-Y
60 fBodyAccJerk-meanFreq()-Z
61 fBodyGyro-mean()-X
62 fBodyGyro-mean()-Y
63 fBodyGyro-mean()-Z
64 fBodyGyro-std()-X
65 fBodyGyro-std()-Y
66 fBodyGyro-std()-Z
67 fBodyGyro-meanFreq()-X
68 fBodyGyro-meanFreq()-Y
69 fBodyGyro-meanFreq()-Z
70 fBodyAccMag-mean()
71 fBodyAccMag-std()
72 fBodyAccMag-meanFreq()
73 fBodyBodyAccJerkMag-mean()
74 fBodyBodyAccJerkMag-std()
75 fBodyBodyAccJerkMag-meanFreq()
76 fBodyBodyGyroMag-mean()
77 fBodyBodyGyroMag-std()
78 fBodyBodyGyroMag-meanFreq()
79 fBodyBodyGyroJerkMag-mean()
80 fBodyBodyGyroJerkMag-std()
81 fBodyBodyGyroJerkMag-meanFreq()

Computed result

The result, produced in the frame "result.frame" and written to the file "mean_measures.txt", contains every uniquely occuring combination of subject id and activity (columns 1 and 2), together with the mean of each other measure for that group (columns 3 through 81).
