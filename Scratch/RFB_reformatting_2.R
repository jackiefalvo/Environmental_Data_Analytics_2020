getwd()
library(plyr)
library(tidyverse)

# read in csv and made all blanks NA values
rfb_iso_na <- read.csv("/Users/cristiana/Documents/Duke/DataAnalytics/Environmental_Data_Analytics_2020/Scratch/RFB_iso.csv", na.strings = c("", "NA"))

# flipped format (short to long)
rfb_iso_na_gather <- gather(rfb_iso_na, "ISO", "RFB")
  # I'm getting 'attributes are not identical across measure variables; they will be dropped' message
  # I think this means..not every key has same number of values (expected)
  # but not sure what it means when it says 'vals will be dropped'..
    # should get some counts to QC

dim(rfb_iso_na)
dim(rfb_iso_na_gather)
dim(rfb_iso_long)

# eliminate NA's (rows with NA) from long format, end up with clean long format
rfb_iso_long <- na.omit(rfb_iso_na_gather)

# create new file *difference between write.csv and save.file ?
write.csv(rfb_iso_long, row.names = FALSE, file = "./Scratch/RFB_Long.csv")

