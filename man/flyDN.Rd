% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flyDN.R
\name{flyDN}
\alias{flyDN}
\title{Literally does nothing: returns the same object}
\usage{
flyDN(df)
}
\arguments{
\item{df}{Object, usually data frame}
}
\value{
df Returns the original object
}
\description{
I find this function useful to put at the end of the a pipe chain,
so then I can comment and uncomment flyCSV function at the end without
worrying about removing the pipe (\verb{|>} or \verb{\%>\%}) before it.
}
