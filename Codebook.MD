### Step 1 - Getting the data

The data tables were downloaded from the link provided in the project instructions website and unpacked in the "D: // Coursera / Samsung" path directory.

Once decompressed, the tables were appropriated through the "read.table" function and then the created objects were merged using the "cbind" function, generating two tables: "train" for the records related to training, and "test" for records relating to tests.

Finally, these two tables were merged through the "rbind" function into a single table named "merged_data", with the inclusion of a new " condition" column to identify whether a record is relative to training or testing.

### Step 2 - Extrating relevant values

The "merged_data" table contains all records, with all variables of all subjects, activities and conditions observed.

From this, a data extraction was performed using the subset function, where only columns with values relative to the mean or standard deviation were considered.

To identify which columns should be selected, the "grep" function was used.

The result of the extraction was stored in an object called "extract".

### Step 3 - Adding activities names

In this step, using the "sub" function, the activity codes (numerals 1 to 6) were replaced by their respective descriptions ("walking", "sitting", etc.).

### Step 4 - Renaming labels

The same "sub" function was used to adjust the column labels. This time, regular expressions were used to identify the abbreviations and replace them with more complete descriptions.
