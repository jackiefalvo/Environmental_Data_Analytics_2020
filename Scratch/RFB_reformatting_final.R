getwd()
library(plyr)
library(tidyverse)

# read in csv 
# and made all blanks NA values -- only for the original csv, used na.string("", "NA") to change all blanks to NAs
  # this made it easier to eliminate all NAs/no data at once
rfb_short <- read.csv("/Users/cristiana/Downloads/RFB_final - Sheet4.csv")

dim(rfb_short)
head(rfb_short)

# gather didn't work at first because I had all the countries listed down on the list (like master)
## once I transposed it to have countries across the top (233 columns and 12 rows),
## I was able to gather
    # all header values (country ISO codes) became the values of the first column (I named 'ISO')
    # all the values underneath (the RFBs) became the values in the second column (I named 'RFB')
rfb_long <- gather(rfb_short, ISO3, RFB)

dim(rfb_long)


# eliminate NA's (rows with NA) from long format, end up with clean long format
rfb_long_final <- na.omit(rfb_long)
dim(rfb_long_final) # should check this--should match count of total RFB values in the original data

# create new file *difference between write.csv and save.file ?
write.csv(rfb_long_final, row.names = FALSE, file = "./Scratch/RFB_Long_final.csv")

