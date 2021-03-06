% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sheets_objects.R
\name{DimensionRange}
\alias{DimensionRange}
\title{DimensionRange Object}
\usage{
DimensionRange(dimension = NULL, startIndex = NULL, endIndex = NULL,
  sheetId = NULL)
}
\arguments{
\item{dimension}{The dimension of the span}

\item{startIndex}{The start (inclusive) of the span, or not set if unbounded}

\item{endIndex}{The end (exclusive) of the span, or not set if unbounded}

\item{sheetId}{The sheet this span is on}
}
\value{
DimensionRange object
}
\description{
DimensionRange Object
}
\details{
Autogenerated via \code{\link[googleAuthR]{gar_create_api_objects}}
A range along a single dimension on a sheet.All indexes are zero-based.Indexes are half open: the start index is inclusiveand the end index is exclusive.Missing indexes indicate the range is unbounded on that side.
}
\concept{DimensionRange functions}
