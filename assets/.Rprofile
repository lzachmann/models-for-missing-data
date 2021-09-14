# Use the `rstudio.sessionInit` hook to invoke rstudioapi methods on startup.
setHook("rstudio.sessionInit", function(newSession) {
  if (newSession) {
    
    # rstudioapi::addTheme(
    #   "https://raw.githubusercontent.com/gadenbuie/oceanic-eighties/master/oceanic-eighties.rstheme",
    #   apply = TRUE
    # )
    # message("Welcome to RStudio ", rstudioapi::getVersion(), "\n")
    
    banner <- function() {
      library(crayon)
      art <- c(
        paste(rep('-', 62), collapse = ''),
        "                        _/  _/                          _/    ",
        "       _/_/_/  _/_/    _/  _/    _/_/_/  _/_/      _/_/_/     ",
        "      _/    _/    _/  _/_/_/_/  _/    _/    _/  _/    _/      ",
        "     _/    _/    _/      _/    _/    _/    _/  _/    _/       ",
        "    _/    _/    _/      _/    _/    _/    _/    _/_/_/        ",
        paste(rep('-', 62), collapse = '')
      )
      
      message(
        sprintf("Welcome to %s!", cyan(bold("models for missing data")))
      )
      cat(art, sep = "\n")
      message(
        sprintf("See %s for\ntechnical docs, general interest posts, and more.", 
                blue("https://lzachmann.github.io/models-for-missing-data/")),
        "\n"
      )
    }
    
    file.edit('model-api/analysis-pipeline.R')
    banner()
    
  }
}, action = "append")
