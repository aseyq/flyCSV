library("flyCSV")
library("tidyverse")
library("data.table")
# Vectors
my_vector <- c(1,2,3,4)
flyCSV(my_vector)

# Data Frame
my_df <- data.table(a=c(1,2,3,4), b=c(4,3,2,1))
flyCSV(my_df)


# Matrix
my_matrix <- matrix(c(1,2,3,4,5,6), nrow=2)
flyCSV(my_matrix)



# List of data frames
df1 <- data.table(a=c(1,2,3,4), b=c(4,3,2,1))
df2 <- data.table(a=c(1,3,2,4), b=c(4,2,1,3))

my_list_of_dfs <- list(df1=df1, df2=df2)

flyCSV(my_list_of_dfs)



