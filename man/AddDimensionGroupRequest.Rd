% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sheets_objects.R
\name{AddDimensionGroupRequest}
\alias{AddDimensionGroupRequest}
\title{AddDimensionGroupRequest Object}
\usage{
AddDimensionGroupRequest(range = NULL)
}
\arguments{
\item{range}{The range over which to create a group}
}
\value{
AddDimensionGroupRequest object
}
\description{
AddDimensionGroupRequest Object
}
\details{
Autogenerated via \code{\link[googleAuthR]{gar_create_api_objects}}
Creates a group over the specified range.If the requested range is a superset of the range of an existing group G,then the depth of G is incremented and this new group G' has thedepth of that group. For example, a group [C:D, depth 1] + [B:E] results ingroups [B:E, depth 1] and [C:D, depth 2].If the requested range is a subset of the range of an existing group G,then the depth of the new group G' becomes one greater than the depth of G.For example, a group [B:E, depth 1] + [C:D] results in groups [B:E, depth 1]and [C:D, depth 2].If the requested range starts before and ends within, or starts within andends after, the range of an existing group G, then the range of the existinggroup G becomes the union of the ranges, and the new group G' hasdepth one greater than the depth of G and range as the intersection of theranges. For example, a group [B:D, depth 1] + [C:E] results in groups [B:E,depth 1] and [C:D, depth 2].
}
\concept{AddDimensionGroupRequest functions}
