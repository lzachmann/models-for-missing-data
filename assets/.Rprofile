# Use the `rstudio.sessionInit` hook to invoke rstudioapi methods on startup.
setHook("rstudio.sessionInit", function(newSession) {
  if (newSession) {
    # rstudioapi::addTheme(
    #   "https://raw.githubusercontent.com/gadenbuie/oceanic-eighties/master/oceanic-eighties.rstheme",
    #   apply = TRUE
    # )
    message("Welcome to RStudio ", rstudioapi::getVersion())
  }
}, action = "append")
