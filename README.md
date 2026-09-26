# EconometricSI — Enfoques Modernos

**Investigación y Desarrollo en Econometría, Modelado Estadístico y Toma de Decisiones Empresariales**

- **Autor:** Dilan Alexander Manosalvas Andrade
- **Institución:** Universidad de las Fuerzas Armadas ESPE
- **Sitio Web Oficial:** [EconometricSI — Enfoques Modernos](https://econometricis.vercel.app/)
- **Perfil de GitHub:** [dilanmano20010-design](https://github.com/dilanmano20010-design)

---

## Descripción del Proyecto

Este repositorio contiene la investigación reproducible desarrollada mediante **R Markdown** y **bookdown**. Integra análisis econométrico avanzado, modelos empíricos y aplicaciones prácticas orientadas a pequeñas y medianas empresas (PYMES).

El proyecto está preparado para generar simultáneamente múltiples salidas con calidad editorial:
- **PDF** (`bookdown::pdf_book`): Formato formal de tesis/investigación con tipografía académica, índices y soporte completo en español.
- **HTML Interactivo (BS4 Book)** (`bookdown::bs4_book`): Libro web moderno con diseño responsivo, barra de búsqueda y navegación interactiva.
- **GitBook** (`bookdown::gitbook`): Versión web optimizada para GitHub Pages (carpeta `docs/`).
- **Word (.docx)** (`bookdown::word_document2`): Documento editable para revisiones y colaboraciones externas.

---

## Requisitos y Compatibilidad

Este proyecto está optimizado para funcionar en cualquier computador con versiones actuales de:
1. **R** (>= 4.0.0, recomendado R 4.4+)
2. **RStudio** (versiones actuales de RStudio Desktop)
3. **TinyTeX** (o cualquier distribución LaTeX moderna como TeX Live o MiKTeX)

### Paquetes de R Requeridos

El archivo `scripts_and_filters/install_packages_if_missing.R` se encarga de instalar automáticamente cualquier dependencia faltante:
- `rmarkdown`
- `bookdown`
- `knitr`
- `kableExtra`
- `tidyverse`
- `here`
- `tinytex`
- `bslib`
- `downlit`
- `xml2`

Para instalar manualmente desde la consola de R:
```r
install.packages(c("rmarkdown", "bookdown", "knitr", "kableExtra", "tidyverse", "here", "tinytex", "bslib", "downlit", "xml2"))
```

---

## Instrucciones de Compilación en RStudio

1. Abra el proyecto en RStudio haciendo doble clic en el archivo `.Rproj` de la raíz.
2. Abra el archivo `index.Rmd`.
3. Para compilar, simplemente haga clic en el botón **Knit** en la barra superior de RStudio.
4. Para seleccionar los formatos deseados, configure la variable `thesis_formats` en el bloque inicial de `index.Rmd`:
   - Solo PDF: `thesis_formats <- "pdf"`
   - Solo Web (BS4): `thesis_formats <- "bs4"`
   - Solo GitBook: `thesis_formats <- "gitbook"`
   - Solo Word: `thesis_formats <- "word"`
   - Múltiples formatos a la vez: `thesis_formats <- c("pdf", "bs4", "gitbook", "word")`

Todos los archivos generados se almacenan automáticamente en la carpeta `docs/`.

---

## Estructura del Repositorio

- `index.Rmd`: Metadatos principales, configuración de formatos, idioma (Español) y parámetros globales.
- `_bookdown.yml`: Configuración de salida, etiquetas en español de figuras y tablas.
- `00-introduction.Rmd` a `07-conclusion.Rmd`: Capítulos del documento de investigación.
- `front-and-back-matter/`: Secciones preliminares (Resumen, Agradecimientos, Abreviaturas) y apéndices.
- `bibliography/`: Archivos de referencias bibliográficas (`.bib`) y estilo de citación (`apa.csl`).
- `figures/`: Gráficos, diagramas y recursos visuales.
- `templates/`: Plantillas LaTeX (`template.tex`, `ociamthesis.cls`), hojas de estilo (`bs4_style.css`, `style.css`) y logotipo institucional (`beltcrest.pdf`).
- `scripts_and_filters/`: Funciones auxiliares de compilación y filtros de Pandoc.
