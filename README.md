# Estadistica Multidimensional - Food Delivery Orders

Analisis exploratorio y multivariante del dataset `food_delivery_orders_dataset.csv`
(pedidos de entrega de comida y logistica de ETA).

## Integrantes

- 20212020136 - Edward Julian Garcia Gaitan
- 20212020116 - Daniel Alejandro Presiga Presiga
- 20222020004 - Nicolas Andres Yepes Cortes

Docente: MsC Jhon A. Varon Robayo

## Estructura del proyecto

```
estadisticamulti/
├── dataset/                              # Datos (ignorado por git, ver mas abajo)
│   └── food_delivery_orders_dataset.csv
├── food_delivery_avance_1.Rmd            # Avance 1 original (registro historico, intacto)
├── food_delivery_avance_1_corregido.Rmd  # Avance 1 con las correcciones de preparacion
├── food_delivery_avance_2.Rmd            # Avance 2: estandarizacion (z-score) y PCA/clustering
├── install_packages.R                    # Instalacion de paquetes de R necesarios
├── README.md
└── .gitignore
```

## Dataset

El dataset NO se versiona en git (ver `.gitignore`). Para obtenerlo, descargarlo de Kaggle
y colocarlo en la carpeta `dataset/` con el nombre `food_delivery_orders_dataset.csv`.

- Fuente (Kaggle): https://www.kaggle.com/datasets/razanihababdellatif/food-delivery-orders-and-eta-logistics-dataset
- Dimensiones: 50000 registros x 37 variables.

## Requisitos

- R 4.6.1 (o compatible)
- Rtools (para compilar paquetes desde fuente cuando haga falta)
- Pandoc (necesario para exportar los `.Rmd` a HTML desde PowerShell; RStudio lo
  trae incluido, pero al renderizar con `Rscript` hay que tenerlo instalado aparte).
- Paquetes de R: ejecutar una sola vez el script de instalacion.

```powershell
& "C:\Program Files\R\R-4.6.1\bin\Rscript.exe" ".\install_packages.R"
```

Para instalar Pandoc (una sola vez, no requiere permisos de administrador):

```powershell
winget install --exact --id JohnMacFarlane.Pandoc --source winget --silent
```

## Puesta en marcha para los companeros (primera vez)

Si es la primera vez que trabajas el proyecto en tu equipo, sigue estos pasos en orden.

1. Clonar el repositorio y entrar a la carpeta:

   ```powershell
   git clone https://github.com/gabrielaCruz05/estadisticamulti.git
   cd estadisticamulti
   ```

2. Colocar el dataset. El CSV NO viene en el repo (ver seccion Dataset). Descargarlo de
   Kaggle y dejarlo en `dataset/food_delivery_orders_dataset.csv`.

3. Instalar los paquetes de R (una sola vez):

   ```powershell
   & "C:\Program Files\R\R-4.6.1\bin\Rscript.exe" ".\install_packages.R"
   ```

4. Instalar Pandoc (una sola vez, no requiere permisos de administrador):

   ```powershell
   winget install --exact --id JohnMacFarlane.Pandoc --source winget --silent
   ```

Con eso ya se puede exportar cualquier informe a HTML (seccion siguiente).

## Como exportar un .Rmd a HTML (PowerShell)

El proyecto usa R Markdown. Para generar el HTML de un informe se usa `rmarkdown::render`
a traves de `Rscript`. El working directory debe ser la raiz del proyecto para que las
rutas relativas (`dataset/...`) funcionen.

Ejecutar desde la raiz del proyecto (`estadisticamulti/`) el documento que se este
trabajando. Por ejemplo, para el avance 1 corregido:

```powershell
$env:RSTUDIO_PANDOC = "$env:LOCALAPPDATA\Pandoc"
& "C:\Program Files\R\R-4.6.1\bin\Rscript.exe" -e "rmarkdown::render('food_delivery_avance_1_corregido.Rmd')"
```

Esto genera `food_delivery_avance_1_corregido.html` en la misma carpeta. Para otro
informe, reemplazar el nombre del `.Rmd` (por ejemplo `food_delivery_avance_2.Rmd`).

### IMPORTANTE: el orden de las dos lineas

Son **dos lineas separadas** y la de `RSTUDIO_PANDOC` va **primero**. R lee esa variable
al arrancar, asi que si la pones despues del `render` (o pegada en la misma linea) fallara
con el error:

```
Error: pandoc version 2.8 or higher is required and was not found
```

Escribe la primera linea, presiona Enter, y luego la segunda.

### Notas

- La linea `$env:RSTUDIO_PANDOC = ...` le indica a R donde quedo instalado Pandoc
  (`%LOCALAPPDATA%\Pandoc`). Si lo instalaste en otra ruta, ajustarla.
- Si `R` no esta en el PATH, usar siempre la ruta completa al ejecutable como en el ejemplo.
- El HTML de salida se puede abrir en cualquier navegador. Los HTML no se versionan en git;
  cada quien los regenera localmente.
