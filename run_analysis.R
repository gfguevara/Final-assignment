# Tarea Final del Curso "Getting and Cleaning Data"
#
## Cargar las librerías necesarias. dplyr es esencial para los pasos finales.
# Si no la tienes instalada, primero ejecuta: 
install.packages("dplyr")
library(dplyr)

# --- PASO 0: Descargar y Descomprimir los Datos ---

# URL del archivo zip
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"

# Descargar el archivo si no existe
if (!file.exists(zipFile)) {
  download.file(fileUrl, zipFile, mode = "wb")
}

# Descomprimir el archivo si la carpeta no existe
dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
  unzip(zipFile)
}


# --- PASO 1: Leer y Unir los Conjuntos de Entrenamiento y Prueba ---

# Leer los datos de entrenamiento
training_subjects <- read.table(file.path(dataPath, "train", "subject_train.txt"))
training_values <- read.table(file.path(dataPath, "train", "X_train.txt"))
training_activities <- read.table(file.path(dataPath, "train", "y_train.txt"))

# Leer los datos de prueba
test_subjects <- read.table(file.path(dataPath, "test", "subject_test.txt"))
test_values <- read.table(file.path(dataPath, "test", "X_test.txt"))
test_activities <- read.table(file.path(dataPath, "test", "y_test.txt"))

# Leer los nombres de las características (variables) y las etiquetas de las actividades
features <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)
activity_labels <- read.table(file.path(dataPath, "activity_labels.txt"))
colnames(activity_labels) <- c("activityId", "activityName")

# Unir los datos de entrenamiento y prueba en un único data frame
# Primero se unen las filas (usando rbind) y luego las columnas (usando cbind)
human_activity <- rbind(
  cbind(training_subjects, training_values, training_activities),
  cbind(test_subjects, test_values, test_activities)
)

# Asignar los nombres de las columnas
colnames(human_activity) <- c("subject", features[, 2], "activityId")


# --- PASO 2: Extraer Solo las Mediciones de Media y Desviación Estándar ---

# Se buscan las columnas que contengan "mean" o "std" en su nombre,
# además de las columnas "subject" y "activityId".
columns_to_keep <- grepl("subject|activityId|mean|std", colnames(human_activity))
human_activity <- human_activity[, columns_to_keep]


# --- PASO 3: Usar Nombres de Actividad Descriptivos ---

# Reemplazar los IDs de actividad por sus nombres correspondientes
human_activity$activityId <- factor(human_activity$activityId, 
                                    levels = activity_labels[, 1], 
                                    labels = activity_labels[, 2])

# Renombrar la columna a "activity" para mayor claridad
names(human_activity)[names(human_activity) == 'activityId'] <- 'activity'


# --- PASO 4: Etiquetar Apropiadamente el Conjunto de Datos ---

# Obtener los nombres actuales de las columnas
column_names <- colnames(human_activity)

# Limpiar los nombres para que sean más descriptivos y fáciles de usar
column_names <- gsub("[\\(\\)-]", "", column_names) # Eliminar paréntesis y guiones
column_names <- gsub("^f", "frequencyDomain", column_names)
column_names <- gsub("^t", "timeDomain", column_names)
column_names <- gsub("Acc", "Accelerometer", column_names)
column_names <- gsub("Gyro", "Gyroscope", column_names)
column_names <- gsub("Mag", "Magnitude", column_names)
column_names <- gsub("Freq", "Frequency", column_names)
column_names <- gsub("mean", "Mean", column_names)
column_names <- gsub("std", "StandardDeviation", column_names)
column_names <- gsub("BodyBody", "Body", column_names) # Corregir duplicados

# Asignar los nuevos nombres de columna al data frame
colnames(human_activity) <- column_names


# --- PASO 5: Crear un Segundo Conjunto de Datos Ordenado (Tidy) ---

# Agrupar los datos por sujeto y actividad, y luego calcular la media
# de cada una de las demás columnas.
tidy_data <- human_activity %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Escribir el conjunto de datos ordenado en un archivo de texto
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

# Mensaje final para el usuario
message("Proceso completado. El archivo 'tidy_data.txt' ha sido creado.")
