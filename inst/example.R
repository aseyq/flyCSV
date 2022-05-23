library("flyCSV")
library("tidyverse")

fc <- flyCSV

iris  %>% 
    fc()  %>% 
    filter(Species == "virginica")  %>% 
    fc()
    
