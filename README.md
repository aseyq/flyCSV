# flyCSV: Check your data frame as CSV on the fly!  (R Package)
**Warning: This is a very preliminary version. Might contain bugs and stuff**


This library helps you view your CSV files on the fly. The functionality is similar to the `View()` function however it uses 
system's default file viewer for CSVs. And unlike `View()` it returns the same object so it can be used in between pipe chains.


![example](https://raw.githubusercontent.com/aseyq/flyCSV/main/excluded/images/example.gif)


## Installation
The package is in a very early stage. For that reason it is not on CRAN (yet, hopefully).

You can install it by:

```
devtools::install_github("aseyq/flyCSV")
```

If you don't have the package devtools, you can install it with:

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

### Use within a pipe
```{r}
df %>%
  somefunction(...) %>%
  flyCSV()
```  
  
### Use between pipes
```{r}
df %>%
  somefunction(...) %>%
  flyCSV() %>%
  someotherfunction(...)
```  

### Write the file with a specific name in a directory
```
df %>%
  somefunction(...) %>%
  flyCSV("my_file.csv")
```
### Change the software to open the file
```
df %>%
  somefunction(...) %>%
  flyCSV("my_file.csv", browser="C:\Program Files\LibreOffice\program\soffice.exe")
```




