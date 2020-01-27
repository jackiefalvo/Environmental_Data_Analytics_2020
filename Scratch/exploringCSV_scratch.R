# make sure working directory files and libraries are good to go
getwd()
library(tidyverse)
RFB <- read.csv("/Users/cristiana/Documents/Duke/DataAnalytics/Environmental_Data_Analytics_2020/Scratch/RFB.csv")

# view the csv, check out the structure
view(RFB)
str(RFB)

# realized I didn't want the country names, only the ISO codes
## removed second row from csv
RFB[-c(1), ] # tested (just printed output)
RFB_iso <- RFB[-c(1), ] # then assigned this to a new name

# explored the ISO data
view(RFB_iso)
str(RFB_iso)
head(RFB_iso)
class(RFB_iso)
colnames(RFB_iso)

dim(RFB_iso) # rows x columns
length(RFB_iso) # gives number of columns
nrow(RFB_iso) # gives number of rows
head(RFB_iso, 2) # gives first 2 rows
class(RFB_iso$AFG) # gives class (data type?) of first column 

# I'm not sure if putting a name to the column names is the same thing as having a 'list' (data type) of column names
ISO_list <- colnames(RFB_iso)
ISO_list

## I'd like to be able to 
  # write functions
  # read in the RFB data and restructure it into two columns
    # for each column:
      # put first (header) value of old_csv into first column of new_csv
      # put all values below header in old_csv into second column of new_csv
      # copy header value as many times as there are values ()

    # more function-like:
      # for each column
        # skip first row
        # if next row has a value, 
          # write that value into new_csv (2nd column)
          # write first row of old_csv (ISO value) into first column of new_csv 




