# Explanation of the Getting and cleaning data - peer assignment

## Goal of the assignment
To demonstrate the ability to collect, work with and clean a data set

## Exact assignment

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Step by step description of my approach

I give a step by step description of my approach and the choices I made. In my R-script, you can see how I did this exactly. To have a link between this README.md and my R-script, I added a lot of comments in the R-script

### 0. Understand what data I am dealing with
To do this, I downloaded and unzipped the data, and read them into R. There are several files available.

X_train.txt and X_test.txt : various movement variables
The column names of these files are non-descript (V1, etc). features.txt contains the descriptive names.
y_train.txt and y_test.txt:  various activities
The values in these files are numbers. The actual activities can be matched to these numbers using activity_labels.txt
subject_train.txt and subject_test.txt: the subjects that undertook the activities

### 1. Understand the relationships between the files, and then: Merge the training and test sets

X_train.txt and X_test.txt are train and test datasets for the same type of data, so they can be row-binded together
Same goes for y_train.txt and y_test.txt and subject_train.txt and subject_test.txt

This rowbinding leaves me with 3 dataframes
X : with movement variables
Y: with activities
S: with subjects

X,Y,S all have the same number of columns, in the end the can be column-binded together to get one complete dataset

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

In feat (dataframe from features.txt) we can determine which features are measurements on mean or sd, namely when the features contains either "mean" or "sd". I take a subset of feat, feat_in, which contains only those elements.

To extract only the measurements, I take a subset of X, all rows, but only the columns of feat_in.
I gave the columns of X the names of feat, so the variable names are logical.

### 3. Uses descriptive activity names to name the activities in the data set

Y only has values (varying from 1 to 6). act (from activity_labels.txt) contains the "translation table" to change the values 1 to 6 into an activity name out of (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

### 4. Appropriately labels the data set with descriptive variable names.

This took a couple of steps. First, I used feat (feature.txt) as descriptive variables for X. 
After melting and dcasting, some dots were added in my variable names, and I cleaned this up using a gsub command
Also, the activities (Y) needed a name, I chose "activity
And the subjects (S) needed a name, I chose "subject"
In the end, my dataframe has 81 columns, all with descriptive variable names, which are described in codebook.MD

### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

To do this, I first created a long dataframe with four columns:
subject - activity - variable name - value

I used the command melt to do this.

Then I used dcast to create a new (wide) dataset with a mean of each variable for each subject-activity. I think it makes sense to use the wide form, because subject and activity are the "fixed" variables. We might want to combine e.g. the X,Y,Z-parts of a certain movement later on, which is a lot easier to do if they are in different columns instead of rows.

I know there is some discussion on whether to deliver either the long or the wide form of the dataframe, I decided to use the wide form.

### 6. Write the dataframe to a text-file

Finally, I wrote the tidy dataset to a txt.file


