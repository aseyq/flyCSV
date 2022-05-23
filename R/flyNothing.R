#' Literally does nothing: returns the same object
#'
#' I find this function useful to put at the end of the a pipe chain,
#' so then I can comment and uncomment flyCSV function at the end without
#' worrying about removing the pipe (`|>` or `%>%`) before it.
#'
#' @param df Object, usually data frame
#' @return df Returns the original object
#' @export
flyDN <- function(df) {
    invisible(df)
    }

