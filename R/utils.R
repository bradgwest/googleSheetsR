# OVERVIEW ====================================================================
# AUTHOR: Brad West
# CREATED ON: 2018-10-12
# ---
# DESCRIPTION: Utilities for Google Sheets related functions
# ---


#' Custom message log level
#'
#' @param ... The message(s)
#' @param level The severity
#'
#' @details 0 = everything, 1 = debug, 2=normal, 3=important
#' @keywords internal
my_message <- function(..., level = 2){

  # compare_level <- getOption("googleAuthR.verbose")
  compare_level <- 2

  if(level >= compare_level){
    message(Sys.time() ," > ", ...)
  }

}


gsheet_letters <- function() {
  c(LETTERS, paste0(rep(LETTERS[1:9], each = 26), LETTERS))[1:256]
}
