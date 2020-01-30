filter() # chooses specific data based on criteria; temporary (like sel by attribute in GIS)
arrange() # 
select() # grabs certain columns
# select based on name of column; can say include and not include something
    # select(data, -lakename, sampledate) # exclude lakename, include sampledate
    # select(data, col1:col2, new col, col3 - col7) # inserts a new column in between col 2 and 3
mutate() # adds something onto the end of the dataset
lubridate() # 
interval() # comes with lubridate

## go over these functions and packages, become a bit more familiar
  # filter and piping can particularly be useful I think
  # also writing new csvs

gather() # switches short to long format !! wow !! this is exactly what I need Kateri!
spread() # switches long to short format
separate() # can separate dates for instance Y/M/D -> seperate Y, M, D columns
unite() # opposite of separate

join() # 