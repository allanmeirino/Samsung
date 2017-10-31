## Step 1 - Getting the data

The data tables were downloaded from the link provided in the project instructions website and unpacked in the "D: // Coursera / Samsung" path directory.

Once decompressed, the tables were appropriated through the "read.table" function and then the created objects were merged using the "cbind" function, generating two tables: "train" for the records related to training, and "test" for records relating to tests.

Finally, these two tables were merged through the "rbind" function into a single table named "merged_data", with the inclusion of a new " condition" column to identify whether a record is relative to training or testing.
