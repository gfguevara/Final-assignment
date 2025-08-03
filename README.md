Tarea Final del Curso "Getting and Cleaning Data"
Este repositorio contiene la solución para la tarea final del curso "Getting and Cleaning Data" de Coursera. El objetivo del proyecto es tomar un conjunto de datos crudos sobre mediciones de acelerómetros de smartphones, limpiarlos, y crear un conjunto de datos ordenado (tidy) y resumido.

Archivos en este Repositorio
run_analysis.R: Este es el script principal de R que realiza todo el proceso de limpieza y transformación de los datos. Descarga los datos, los une, los filtra, los etiqueta y finalmente crea el conjunto de datos ordenado.

tidy_data.txt: Este es el archivo de salida generado por el script run_analysis.R. Contiene el promedio de cada variable de media y desviación estándar para cada actividad y cada sujeto del estudio.

CodeBook.md: Un libro de códigos que describe las variables, los datos y cualquier transformación realizada para limpiar los datos. Detalla las variables que se encuentran en el archivo tidy_data.txt.

README.md: Este archivo, que explica el propósito del proyecto y cómo ejecutar el análisis.

Pasos para Reproducir el Análisis
Para ejecutar el análisis y generar el conjunto de datos ordenado, sigue estos pasos:

Prerrequisitos: Asegúrate de tener R y RStudio instalados. También necesitas tener instalado el paquete dplyr. Si no lo tienes, puedes instalarlo ejecutando el siguiente comando en la consola de R:

install.packages("dplyr")

Descargar el Repositorio: Clona o descarga este repositorio en tu computadora.

Establecer el Directorio de Trabajo: Abre RStudio y establece el directorio de trabajo en la carpeta raíz de este proyecto (donde se encuentra el archivo run_analysis.R).

Ejecutar el Script: Ejecuta el script en la consola de R usando el siguiente comando:

source("run_analysis.R")

El script se encargará de descargar y descomprimir los datos originales automáticamente. Al finalizar, imprimirá un mensaje de confirmación y el archivo tidy_data.txt habrá sido creado en tu directorio de trabajo.