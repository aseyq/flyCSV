# flyCSV: Check your data frame as CSV on the fly!  (R Package)
**Warning: This is a very preliminary version.**

![logo](https://raw.githubusercontent.com/aseyq/flyCSV/main/inst/images/logo.png)


This library (well, more a function) helps you view your data frames CSV files on the fly. It is basically a wrapper that saves the database temporarily, and then opens it with the default program. The functionality is similar to the built-in `View()` function, however, unlike `View()` it returns the same object, so it can be used in between pipe chains. Also it doesn't rely on RStudio.

![example](https://raw.githubusercontent.com/aseyq/flyCSV/main/inst/images/example.gif)


## Installation
You can install it by:

```r
devtools::install_github("aseyq/flyCSV")
```

Devtools package is necessary if you want to install an R package directly from github. You probably already have it but if you don't, you can install it with:

```r
install.packages("devtools")
```


## Usage
Load the library
```r
library(flycsv)
```

### Basic Usage
```r
flyCSV(df)
```

### You can use it at the end of a pipe
#### `magrittr` pipes
```r
df %>%
  somefunction(...) %>%
  flyCSV()
```  
  
#### Base R pipes (from R 4.1 on)
```r
df |>
  somefunction(...) |>
  flyCSV()
```
  
### as well as between pipes
```r
df %>%
  somefunction(...) %>%
  flyCSV() %>% # My csv will show the changes up to this point!
  someotherfunction(...)
```  


### you can save your data while using `flyCSV`
```r
new_df <- df %>%
  somefunction(...) %>%
  flyCSV() 
```  



### Write the file with a specific name in a directory
In this case it won't be deleted automatically.
```r
df %>%
  somefunction(...) %>%
  flyCSV("my_file.csv")
```

### It supports calling multiple times, so it can be useful to compare the data
```r
df %>%
  do_something() %>%
  flyCSV("before.csv")  %>% 
  do_something_else() %>%    
  flyCSV("after.csv")
```

### Change the software to open the file
```r
df %>%
  somefunction(...) %>%
  flyCSV("my_file.csv", browser="C:\Program Files\LibreOffice\program\soffice.exe")
```

### Tip: Using `flyDN` (stands for Do Nothing) to quick comment-outs and ins
Let's say that you are working on a long pipe and time to time you want to investigate your 
data at the end of a pipe by commenting out and in `flyCSV` function. With pipes, if you
comment the pipe at the end of the chain, since the previous pipe will not have function to
input, you will get an error, or your R will wait for an input. For instance:

- This will not work unless you remove the pipe in the previous line:
```r
iris  %>% 
  filter(Species == "virginica")  %>% 
  # flyCSV()        
```

To facilitate commenting ins and outs, flyCSV comes with a function `flyDN` which does nothing but 
returns the same dataframe. Therefore you can put `flyDN()` at the end of your pipes to uncomment 
and comment easily the function before. For insance:

- This will work:
```r
iris  %>% 
  filter(Species == "virginica")  %>% 
  # flyCSV() %>%     
  flyDN() 
```

- As well as this one:
```r
iris  %>% 
  filter(Species == "virginica")  %>% 
  flyCSV()  %>% 
  flyDN() 
```


### Tip: Using an alias
You can create an alias for flyCSV to speed your writing up when you are investigating your data. 
```r
fc <- flyCSV

df %>%
  do_something() %>%
  fc() 
```

### For example
![example](https://raw.githubusercontent.com/aseyq/flyCSV/main/inst/images/twodf.png)


## Input types and output structures
`flyCSV` uses `write.csv` underneath, which is extremely flexible. So,`flyCSV()` can take different types of input. Here is a demonstration of how the CSV file structure would look like for different formats.

### Input is a `vector`
```r
my_vector <- c(1,2,3,4)
flyCSV(my_vector)
```

| x |
| - |
| 1 |
| 2 |
| 3 |
| 4 |

### Input is a `data.frame` (or `tibble`, or `data.table`)
```r
my_df <- data.frame(a=c(1,2,3,4), b=c(4,3,2,1))
flyCSV(my_df)
```

| a | b |
| - | - |
| 1 | 4 |
| 2 | 3 |
| 3 | 2 |
| 4 | 1 |

### Input is a `matrix`
```r
my_matrix <- matrix(c(1,2,3,4,5,6), nrow=2)
flyCSV(my_matrix)
```

| V1 | V2 | V3 |
| -- | -- | -- |
| 1  | 3  | 5  |
| 2  | 4  | 6  |


### Input is a list of `data.frame`s (or `tibble`s, or `data.table`s)
```r
df1 <- data.frame(a=c(1,2,3,4), b=c(4,3,2,1))
df2 <- data.frame(a=c(1,3,2,4), b=c(4,2,1,3))

my_list_of_dfs <- list(df1=df1, df2=df2)

flyCSV(my_list_of_dfs)
```


| df1.a | df1.b | df2.a | df2.b |
| ----- | ----- | ----- | ----- |
| 1     | 4     | 1     | 4     |
| 2     | 3     | 3     | 2     |
| 3     | 2     | 2     | 1     |
| 4     | 1     | 4     | 3     |
