# OVERVIEW ====================================================================
# AUTHOR: Brad West
# CREATED ON: 2018-10-12
# ---
# DESCRIPTION: High level user facing functions for writing data to Google
#   spreadsheets
# ---

source("./R/utils.R")
source("./R/sheets_functions.R")
source("./R/sheets_objects.R")


#' Write to Tab
#'
#' High level wrapper for writing dataframes to tabs of google spreadsheets
#'
#' @param dta list data that can be coerced to a character matrix
#' @param ss_ids vector of sheet ids. If a vector of length 1, will be recycled
#' @param tabs character vector of tab names, if specified then the ranges will
#'   be assumed to be size of dataframe
#' @param ranges if ranges is specified,
#' @param cnames boolean, should colnames be written as well?
#' @param clear_all boolean, should the entire sheet be cleared or just the
#'   columns specified in the range. Vectorized or recycled
#'
#' @return writes to gsheet, returns responses
#' @export
write_to_tab <- function(dta,
                         ss_ids,
                         ranges = NULL,
                         tabs = NULL,
                         cnames = T,
                         clear_all = F) {

  if (!is.null(dim(dta))) dta <- list(dta)

  if (length(ss_ids) == 1) {
    ss_ids <- rep(ss_ids, length(dta))
  }

  if (length(clear_all) == 1) {
    clear_all <- rep(clear_all, length(dta))
  }

  if (length(cnames) == 1) {
    cnames <- rep(cnames, length(dta))
  }

  last_col <- Map(function(df, clear) {
    last_col <- if (clear) {
      length(gsheet_letters())
    } else {
      ncol(df)
    }
    gsheet_letters()[last_col]
  }, dta, clear_all)

  if (!is.null(tabs) && is.null(ranges)) {
    stopifnot(length(dta) == length(tabs))
    ranges <- unlist(Map(function(df, tab, lc) {
      paste0(tab, "!A1:", lc)
    }, dta, tabs, last_col))
  }

  # sub last letter for ranges
  ranges_copy <- ranges
  ranges <- Map(function(string, replacement) {
    gsub("(?<=:).*$", replacement, string, perl = T)
  }, ranges_copy, last_col)

  # check that they're all the same length
  stopifnot(length(unique(vapply(list(dta, ss_ids, ranges), length,
                                 FUN.VALUE = numeric(1)))) == 1)

  res <- Map(function(df, ss_id, rng, cnm) {
    if (cnm && !is.null(colnames(df))) {
      mat <- rbind(matrix(colnames(df), nrow = 1), as.matrix(df))
    } else {
      mat <- as.matrix(df)
    }
    my_message("Clearing range ", rng)
    res_clear <- tryCatch(gsheet_clear_ss_values(ss_id, rng),
                          error = function(e) e)
    first_row <- as.numeric(
      regmatches(rng, regexpr("(?<=[A-Z])[0-9]+(?=:)", rng, perl = T))
    )
    # write_rng <- paste0(rng, nrow(mat) + first_row)
    valrng <- ValueRange("ROWS", mat, rng)
    my_message("Writing to range ", rng)
    res_update <- tryCatch(gsheet_update_ss_values(ss_id, valrng),
                           error = function(e) e)
    my_message("Finished writing to sheet")
    list(clear_response = res_clear, write_response = res_update)
  }, dta, ss_ids, ranges, cnames)

  res
}
