Descripción del Proceso de Limpieza
El script run_analysis.R realiza los siguientes pasos para transformar los datos crudos en el conjunto de datos ordenado:

Descarga y Descompresión: El script descarga y descomprime automáticamente los datos originales.

Unión de Datos: Se unen los conjuntos de datos de entrenamiento (train) y de prueba (test) en un único data frame.

Extracción de Medidas: Se seleccionan únicamente las columnas que contienen mediciones de medias (mean()) y desviaciones estándar (std()). También se conservan las columnas de sujeto y actividad.

Nombres de Actividad Descriptivos: Los identificadores numéricos de las actividades (1-6) se reemplazan por sus nombres descriptivos correspondientes (e.g., "WALKING", "SITTING").

Etiquetado de Variables: Los nombres de las columnas se limpian y se hacen más descriptivos para seguir los principios de los datos ordenados. Por ejemplo, tBodyAcc-mean()-X se convierte en timeDomainBodyAccelerometerMeanX.

Creación del Conjunto de Datos Ordenado: Finalmente, se agrupan los datos por sujeto (subject) y actividad (activity), y se calcula el promedio de cada una de las variables de medición. El resultado se guarda en el archivo tidy_data.txt.

Descripción de las Variables en tidy_data.txt
El conjunto de datos final (tidy_data.txt) contiene 81 columnas y 180 filas. Cada fila representa el promedio de las mediciones para una combinación única de un sujeto y una actividad.

Variables Identificadoras
subject: Un número entero que identifica al participante del estudio.

Tipo: Integer

Rango: 1 a 30

activity: El nombre de la actividad que el sujeto estaba realizando.

Tipo: Character

Valores Posibles: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Variables de Medición (Promedios)
Todas las variables restantes (columnas 3 a 81) son el promedio de las mediciones originales de media y desviación estándar para cada combinación de subject y activity.

Convención de Nombres:

El prefijo timeDomain o frequencyDomain indica si la señal original estaba en el dominio del tiempo o de la frecuencia.

Body o Gravity indica si el componente de aceleración del cuerpo o de la gravedad fue medido.

Accelerometer o Gyroscope indica el sensor del que proviene la medición.

Mean o StandardDeviation indica que la variable es el promedio de una media o una desviación estándar original.

Jerk indica que la medición es una derivada de la señal original.

Magnitude indica que se calculó la magnitud de la señal tridimensional.

X, Y, o Z al final indica la dirección axial de la medición.

Lista Completa de Variables de Medición:

timeDomainBodyAccelerometerMeanX

timeDomainBodyAccelerometerMeanY

timeDomainBodyAccelerometerMeanZ

timeDomainBodyAccelerometerStandardDeviationX

timeDomainBodyAccelerometerStandardDeviationY

timeDomainBodyAccelerometerStandardDeviationZ

timeDomainGravityAccelerometerMeanX

timeDomainGravityAccelerometerMeanY

timeDomainGravityAccelerometerMeanZ

timeDomainGravityAccelerometerStandardDeviationX

timeDomainGravityAccelerometerStandardDeviationY

timeDomainGravityAccelerometerStandardDeviationZ

timeDomainBodyAccelerometerJerkMeanX

timeDomainBodyAccelerometerJerkMeanY

timeDomainBodyAccelerometerJerkMeanZ

timeDomainBodyAccelerometerJerkStandardDeviationX

timeDomainBodyAccelerometerJerkStandardDeviationY

timeDomainBodyAccelerometerJerkStandardDeviationZ

timeDomainBodyGyroscopeMeanX

timeDomainBodyGyroscopeMeanY

timeDomainBodyGyroscopeMeanZ

timeDomainBodyGyroscopeStandardDeviationX

timeDomainBodyGyroscopeStandardDeviationY

timeDomainBodyGyroscopeStandardDeviationZ

timeDomainBodyGyroscopeJerkMeanX

timeDomainBodyGyroscopeJerkMeanY

timeDomainBodyGyroscopeJerkMeanZ

timeDomainBodyGyroscopeJerkStandardDeviationX

timeDomainBodyGyroscopeJerkStandardDeviationY

timeDomainBodyGyroscopeJerkStandardDeviationZ

timeDomainBodyAccelerometerMagnitudeMean

timeDomainBodyAccelerometerMagnitudeStandardDeviation

timeDomainGravityAccelerometerMagnitudeMean

timeDomainGravityAccelerometerMagnitudeStandardDeviation

timeDomainBodyAccelerometerJerkMagnitudeMean

timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation

timeDomainBodyGyroscopeMagnitudeMean

timeDomainBodyGyroscopeMagnitudeStandardDeviation

timeDomainBodyGyroscopeJerkMagnitudeMean

timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation

frequencyDomainBodyAccelerometerMeanX

frequencyDomainBodyAccelerometerMeanY

frequencyDomainBodyAccelerometerMeanZ

frequencyDomainBodyAccelerometerStandardDeviationX

frequencyDomainBodyAccelerometerStandardDeviationY

frequencyDomainBodyAccelerometerStandardDeviationZ

frequencyDomainBodyAccelerometerMeanFrequencyX

frequencyDomainBodyAccelerometerMeanFrequencyY

frequencyDomainBodyAccelerometerMeanFrequencyZ

frequencyDomainBodyAccelerometerJerkMeanX

frequencyDomainBodyAccelerometerJerkMeanY

frequencyDomainBodyAccelerometerJerkMeanZ

frequencyDomainBodyAccelerometerJerkStandardDeviationX

frequencyDomainBodyAccelerometerJerkStandardDeviationY

frequencyDomainBodyAccelerometerJerkStandardDeviationZ

frequencyDomainBodyAccelerometerJerkMeanFrequencyX

frequencyDomainBodyAccelerometerJerkMeanFrequencyY

frequencyDomainBodyAccelerometerJerkMeanFrequencyZ

frequencyDomainBodyGyroscopeMeanX

frequencyDomainBodyGyroscopeMeanY

frequencyDomainBodyGyroscopeMeanZ

frequencyDomainBodyGyroscopeStandardDeviationX

frequencyDomainBodyGyroscopeStandardDeviationY

frequencyDomainBodyGyroscopeStandardDeviationZ

frequencyDomainBodyGyroscopeMeanFrequencyX

frequencyDomainBodyGyroscopeMeanFrequencyY

frequencyDomainBodyGyroscopeMeanFrequencyZ

frequencyDomainBodyAccelerometerMagnitudeMean

frequencyDomainBodyAccelerometerMagnitudeStandardDeviation

frequencyDomainBodyAccelerometerMagnitudeMeanFrequency

frequencyDomainBodyAccelerometerJerkMagnitudeMean

frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation

frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency

frequencyDomainBodyGyroscopeMagnitudeMean

frequencyDomainBodyGyroscopeMagnitudeStandardDeviation

frequencyDomainBodyGyroscopeMagnitudeMeanFrequency

frequencyDomainBodyGyroscopeJerkMagnitudeMean

frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation

frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency