#' Open your data as CSV
#'
#' This function loads a file as a matrix. It assumes that the first column
#' contains the rownames and the subsequent columns are the sample identifiers.
#' Any rows with duplicated row names will be dropped with the first one being
#' kepted.
#'
#' @param df Object do be written. Usually data frame.
#' @param filename a file name/path to save the CSV to. If provided, the file 
#'                 will not be deleted afterwards.
#' @param browser a non-empty character string giving the name of the program
#'                to be used as the HTML browser.
#' @param encoding File encoding. Passes to write.csv
#' @param row.names Whether to include row names on the first column. TRUE or FALS.
#' @return df Returns the original object
#' @export
flyCSV <- function(df, filename=NA, browser=getOption("browser"), row.names=FALSE, encoding = "") {
    
    if (is.na(filename)) {
        filename <- tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".csv")
    }
    
    utils::write.csv(df, filename, row.names=row.names, fileEncoding=encoding)
    utils::browseURL(filename, browser=browser)    
    invisible(df)
}

