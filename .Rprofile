# Configuración de inicio de RStudio para la investigación
local({
  options(encoding = "native.enc")
  if (nzchar(Sys.which("pandoc")) || nzchar(Sys.getenv("RSTUDIO_PANDOC"))) {
    return(invisible(TRUE))
  }
  potential_paths <- c(
    "C:/Program Files/RStudio/resources/app/bin/quarto/bin/tools",
    "C:/Program Files/RStudio/bin/quarto/bin/tools",
    "C:/Program Files/Pandoc",
    file.path(Sys.getenv("LOCALAPPDATA"), "Pandoc"),
    file.path(Sys.getenv("APPDATA"), "Pandoc")
  )
  for (p in potential_paths) {
    if (dir.exists(p) && (file.exists(file.path(p, "pandoc.exe")) || file.exists(file.path(p, "pandoc")))) {
      Sys.setenv(RSTUDIO_PANDOC = p)
      Sys.setenv(PATH = paste(p, Sys.getenv("PATH"), sep = .Platform$path.sep))
      break
    }
  }
})
