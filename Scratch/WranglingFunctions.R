filter() # chooses specific data based on 
arrange() # 
select() # select based on name of column; can say include and not include something
    # select(data, -lakename, sampledate) # exclude lakename, include sampledate
    # select(data, col1:col2, new col, col3 - col7) # inserts a new column in between col 2 and 3
mutate() # adds something onto the end of the dataset
lubridate() # 
interval() # comes with lubridate
