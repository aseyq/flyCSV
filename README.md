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
#### `magrittr` pipes
```{r}
df %>%
  somefunction(...) %>%
  flyCSV()
```  
  
#### Base R pipes (from R 4.1 on)
```{r}
df |>
  somefunction(...) |>
  flyCSV()
```
  
### as well as between pipes
```{r}
df %>%
  somefunction(...) %>%
  flyCSV() %>% # My csv will show the changes up to this point!
  someotherfunction(...)
```  


### you can save your data while using `flyCSV`
```{r}
new_df <- df %>%
  somefunction(...) %>%
  flyCSV() 
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

### Tip: You can create an alias for flyCSV to speed up when you are investigating your data
```{r}
fc <- flyCSV

df %>%
  do_something() %>%
  fc() 
```

### For example
![example](https://raw.githubusercontent.com/aseyq/flyCSV/main/excluded/images/twodf.png)

### Tip: Using a lightweight CSV editor
Since it takes some time to open heavier software like Microsoft Office or OpenOffice, I find it useful to open csv files with a lightweight CSV editor. In Linux, I use [Gnumeric](http://www.gnumeric.org/). Although I'vey never used them, [TableTool](https://github.com/jakob/TableTool) in MacOS, and [CSV Quick Viewer](https://sourceforge.net/projects/csvquickviewer/) for Windows can be useful alternatives.

Instead of making a software your default viewer, you can specify the program to open the file with `browser` parameter. (See above)
