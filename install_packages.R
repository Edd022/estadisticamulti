# Instalacion de paquetes para analisis exploratorio multivariante
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Usar una libreria de usuario para evitar problemas de permisos
user_lib <- Sys.getenv("R_LIBS_USER")
if (!dir.exists(user_lib)) dir.create(user_lib, recursive = TRUE)
.libPaths(user_lib)

pkgs <- c(
  "tidyverse",   # manipulacion y visualizacion (dplyr, ggplot2, tidyr, readr...)
  "FactoMineR",  # PCA, AFC, MCA, clustering
  "factoextra",  # visualizacion de resultados multivariantes
  "corrplot",    # matrices de correlacion
  "GGally",      # pairs plots / matrices de dispersion
  "readxl",      # leer Excel
  "cluster"      # metodos de clustering
)

# Instalar solo los que falten
to_install <- pkgs[!pkgs %in% rownames(installed.packages())]
cat("Paquetes a instalar:", if (length(to_install)) paste(to_install, collapse = ", ") else "ninguno (ya estan todos)", "\n")

if (length(to_install) > 0) {
  install.packages(to_install, dependencies = TRUE)
}

# Verificacion final
cat("\n==== VERIFICACION ====\n")
for (p in pkgs) {
  ok <- requireNamespace(p, quietly = TRUE)
  cat(sprintf("%-12s : %s\n", p, if (ok) "OK" else "FALTA"))
}
