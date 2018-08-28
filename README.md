# googleSheetsR - Google Sheets API R Client

## Overview

If you simply wish to interact with Google Sheets from the R console, there are much better R packages to turn to, notably Jenny Bryan's `googlesheets` package. If, however, you wish to build multi-user Shiny applications, or have a closer parity between the R client and underlying Google Sheets API, this package provides that functionality via Mark Edmondson's `googleAuthR`.

## Install

This package is not on CRAN.

To install the development version:

```R
devtools::install_github("bradgwest/googleSheetsR")
```

## Authentication With Google Sheets

Authentication is handled by the `googleAuthR` package. General authentication workflows are well documented on the [googleAuthR website](http://code.markedmondson.me/googleAuthR/articles/google-authentication-types.html).

For this package, you will need to specify one of the following [scopes](https://developers.google.com/identity/protocols/googlescopes#sheetsv4):
```R
# Use one of the following scopes
scopes <- c(
  "https://www.googleapis.com/auth/drive",
  "https://www.googleapis.com/auth/drive.file",
  "https://www.googleapis.com/auth/drive.readonly",
  "https://www.googleapis.com/auth/spreadsheets",
  "https://www.googleapis.com/auth/spreadsheets.readonly"
)
options(googleAuthR.scopes.selected = scopes[1]))
```

## Basic Usage

## Shiny Usage

## Thanks

This package stands entirely on the shoulders of Mark Edmondson and his [googleAuthR](https://github.com/MarkEdmondson1234/googleAuthR) package. `googleAuthR` provides an easy way to build Google APIs, and provides support for multi-user shiny applications. Thanks to Mark and his collaborators. His `googleAuthRverse` is a tremendous contribution to the R and Google Cloud communities.
