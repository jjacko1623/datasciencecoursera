# Code book
## Final Assignment for Getting and Cleaning Data

### This section describes the variables and data in the final table (titled meansDataTable) produced from Step 5 of the assignment

**Subject ID**

Record Type

Serial Number

Identifies which subject was undetaking the experiment


**Activity Descriptions**

Category

Indentifies which activity was being completed during the experiment by the subject.  Activities include

1. Walking
2. Walking Upstairs
3. Walking Downstairs
4. Sitting
5. Standing
6. Laying


**Mean of Feature Measurements**

Result

Mean of all feature measurements that resulted in a mean or standard deviation calculation from the raw data measurements

Normalised values from -1 to 1 i.e. no units


###This section describes the cleaning of the data
The following steps were completed to tidy the data created in Step 4

1. Assign appropriate headings to raw data
..* by reading in heading labels then assigning names to the raw data
2. Extract only relevant columns from the large merged data table
..* by scanning data from headings that related to the mean and standard deviation
..* a new data table was built with no extraneous columns involved
3. The new data frame was altered to explicitly state which activity was being completed
..* the corresponding activities column names was updated to reflect the changes
4. This completed the cleaning of data table required at Step 4 because:
..* Each variable is in a separate column
..* Each measurement is in a different row
..* Variables are named acurately and in a readable form
..* In addition, the data passed a reasonablness check to confirm values seemed appropriate and there were no NA values

The following steps were completed to tidy the data created in Step 5

1. Modify data in Step 4 to extract the means of all feature measurements
2. Bind this information to the Subjects and Activities columns
3. Rename the means data column to provide a meaningful description
4. This completed the cleaning of data table required at Step 4 because:
..* Each variable is in a separate column
..* Each measurement is in a different row
..* Variables are named acurately and in a readable form
..* In addition, the data passed a reasonablness check to confirm values seemed appropriate and there were no NA values
