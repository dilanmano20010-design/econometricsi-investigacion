# Configuración automática de entorno y Pandoc para cualquier computador
ensure_pandoc_available <- function() {
  if (nzchar(Sys.which("pandoc")) || nzchar(Sys.getenv("RSTUDIO_PANDOC"))) {
    return(invisible(TRUE))
  }
  
  potential_paths <- c(
    "C:/Program Files/RStudio/resources/app/bin/quarto/bin/tools",
    "C:/Program Files/RStudio/bin/quarto/bin/tools",
    "C:/Program Files/Pandoc",
    file.path(Sys.getenv("LOCALAPPDATA"), "Pandoc"),
    file.path(Sys.getenv("APPDATA"), "Pandoc"),
    "/usr/lib/rstudio/resources/app/bin/quarto/bin/tools",
    "/Applications/RStudio.app/Contents/Resources/app/bin/quarto/bin/tools"
  )
  
  for (p in potential_paths) {
    if (dir.exists(p) && (file.exists(file.path(p, "pandoc.exe")) || file.exists(file.path(p, "pandoc")))) {
      Sys.setenv(RSTUDIO_PANDOC = p)
      Sys.setenv(PATH = paste(p, Sys.getenv("PATH"), sep = .Platform$path.sep))
      break
    }
  }
  invisible(TRUE)
}

knit_thesis <- function(input, output_format = "pdf", allow_cache = TRUE, ...){
  ensure_pandoc_available()
  
  if ("pdf" %in% output_format){
    bookdown::render_book(input, output_format = "bookdown::pdf_book")
    
    file.remove(list.files(pattern = "*\\.(log|mtc\\d*|maf|aux|bcf|lof|lot|out|toc)$"))
  }
  
  if ("bs4" %in% output_format){
    bookdown::render_book(input, output_format = "bookdown::bs4_book")
    
    # Crear archivo .nojekyll requerido para GitHub Pages
    if (!dir.exists("docs")) dir.create("docs", recursive = TRUE)
    file.create(file.path("docs", ".nojekyll"))
  }
  
  if ("gitbook" %in% output_format){
    bookdown::render_book(input, output_format = "bookdown::gitbook")
    
    # Crear archivo .nojekyll requerido para GitHub Pages
    if (!dir.exists("docs")) dir.create("docs", recursive = TRUE)
    file.create(file.path("docs", ".nojekyll"))
  }
  
  if ("word" %in% output_format){
    bookdown::render_book(input, output_format = "bookdown::word_document2")
  }
  
  if (!allow_cache){
    # Eliminar la carpeta _bookdown_files si no se usa caché
    unlink("_bookdown_files", recursive = TRUE)  
  }
}