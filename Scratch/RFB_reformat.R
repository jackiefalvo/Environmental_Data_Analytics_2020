getwd()
library(plyr)
library(tidyverse)

rfb = read.csv("/Users/cristiana/Documents/Duke/DataAnalytics/Environmental_Data_Analytics_2020/Scratch/RFB.csv")
#iso = read.csv("/Users/cristiana/Documents/Duke/DataAnalytics/Environmental_Data_Analytics_2020/Scratch/RFB_iso.csv")

#head(iso)
str(rfb)
view(rfb)

rfb_short <- gather(rfb, "ISO", "RFB")
#iso_

dim(rfb)
dim(rfb_short)

rfb_no_na <- na.omit(rfb_short)

dim(rfb_no_na)

rfb_blanks_to_na <- rfb_short