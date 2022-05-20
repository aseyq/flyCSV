# flyCSV: Check your data frame as CSV on the fly!  (R Package)
**Warning: This is a very preliminary version. Might contain bugs and stuff**

This library helps you view your data frames CSV files on the fly. It basically a wrapper that saves the database temporarily and opens it with the default program to open CSV files. he functionality is similar to the built-in `View()` function, however, unlike `View()` it returns the same object so it can be used in between pipe chains. Also it doesn't rely on RStudio.


![example](https://raw.githubusercontent.com/aseyq/flyCSV/main/excluded/images/example.gif)


## Installation
You can install it by:

```
devtools::install_github("aseyq/flyCSV")
```

If you don't have the `devtools` package, you can install it with:

```
install.packages("devtools")
```


## Usage
Load the library
```{r}
library(flycsv)
```

### Basic Usage
```{r}
flyCSV(df)
```

### You can use it at the end of a pipe
```{r}
df %>%
  somefunction(...) %>%
  flyCSV()
```  
  
### as well as between pipes
```{r}
df %>%
  somefunction(...) %>%
  flyCSV() %>% # My csv will show the changes up to this point!
  someotherfunction(...)
```  

### Write the file with a specific name in a directory
In this case it won't be deleted automatically.
```
df %>%
  somefunction(...) %>%
  flyCSV("my_file.csv")
```

### It supports calling multiple times, so it is useful to compare the data
```{r}
df %>%
  do_something() %>%
  flyCSV("before.csv")  %>% 
  do_something_else() %>%    
  flyCSV("after.csv")
```

### Change the software to open the file
```
df %>%
  somefunction(...) %>%
  flyCSV("my_file.csv", browser="C:\Program Files\LibreOffice\program\soffice.exe")
```
