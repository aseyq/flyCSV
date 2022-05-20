# flyCSV: Check your data frames as CSV on the fly!  (R Package)
**Warning: This is a very preliminary version. Might contain bugs and stuff**


This library helps you view your CSV files on the fly. The functionality is similar to the `View()` function however it uses 
system's default file viewer for CSVs. And unlike `View()` it returns the same object so it can be used in between pipe chains.

## Usage
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

### Write the file in the working directory
```
df %>%
  somefunction(...) %>%
  flyCSV("my_file.csv")
```
### Change the program to open
```
df %>%
  somefunction(...) %>%
  flyCSV("my_file.csv", browser="C:\Program Files\LibreOffice\program\soffice.exe")
```



