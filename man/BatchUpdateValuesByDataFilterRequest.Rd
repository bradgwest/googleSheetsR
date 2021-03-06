% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sheets_objects.R
\name{BatchUpdateValuesByDataFilterRequest}
\alias{BatchUpdateValuesByDataFilterRequest}
\title{BatchUpdateValuesByDataFilterRequest Object}
\usage{
BatchUpdateValuesByDataFilterRequest(responseValueRenderOption = NULL,
  includeValuesInResponse = NULL, valueInputOption = NULL,
  data = NULL, responseDateTimeRenderOption = NULL)
}
\arguments{
\item{responseValueRenderOption}{Determines how values in the response should be rendered}

\item{includeValuesInResponse}{Determines if the update response should include the values}

\item{valueInputOption}{How the input data should be interpreted}

\item{data}{The new values to apply to the spreadsheet}

\item{responseDateTimeRenderOption}{Determines how dates, times, and durations in the response should be}
}
\value{
BatchUpdateValuesByDataFilterRequest object
}
\description{
BatchUpdateValuesByDataFilterRequest Object
}
\details{
Autogenerated via \code{\link[googleAuthR]{gar_create_api_objects}}
The request for updating more than one range of values in a spreadsheet.
}
\concept{BatchUpdateValuesByDataFilterRequest functions}
