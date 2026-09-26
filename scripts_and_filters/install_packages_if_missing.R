required_packages <- c("rmarkdown", "bookdown", "knitr", "kableExtra", "tidyverse", "here", "tinytex", "bslib", "downlit", "xml2")

for (package in required_packages) {
  if (!requireNamespace(package, quietly = TRUE)) {
    message(paste0("Instalando paquete faltante: ", package))
    install.packages(package, repos = "https://cloud.r-project.org")
  }
}

