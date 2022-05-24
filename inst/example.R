library("flyCSV")
library("tidyverse")

fc <- flyCSV

saveit<- iris  %>% 
    fc()  %>% 
    filter(Species == "virginica")  %>% 
    fc()  %>%
    flyDN()
    
