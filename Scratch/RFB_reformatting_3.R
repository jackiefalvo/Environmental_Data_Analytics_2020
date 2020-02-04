getwd()
library(plyr)
library(tidyverse)

# read in csv 
# and made all blanks NA values -- only for the original csv, used na.string("", "NA") to change all blanks to NAs
  # this made it easier to eliminate all NAs/no data at once
task <- read.csv("/Users/cristiana/Documents/Duke/DataAnalytics/Environmental_Data_Analytics_2020/Scratch/Master_RFB_columns.csv")
task.subset <- select(task, ISO.Alpha3:FAO.RFB12)

str(task)
dim(task)
dim(task.subset)

# flipped format (short to long)
task.subset_spread <- spread(task.subset, "ISO.Alpha3", "FAO.RFB1")
task.subset_gather <- gather(task.subset, "ISO.Alpha3", "RFB")
  # I'm getting 'attributes are not identical across measure variables; they will be dropped' message
  # I think this means..not every key has same number of values (expected)
  # but not sure what it means when it says 'vals will be dropped'..
    # should get some counts to QC

dim(task_gather)


# eliminate NA's (rows with NA) from long format, end up with clean long format
rfb_iso_long <- na.omit(rfb_iso_na_gather)

# create new file *difference between write.csv and save.file ?
write.csv(rfb_iso_long, row.names = FALSE, file = "./Scratch/RFB_Long.csv")

