#1. Lade Dir bitte den Datensatz "Psychische GB" von Moodle herunter

#2. Datensatz in R einlesen
  library(readxl)
  data <- readxl::read_xlsx(choose.files())
  #Wähle im sich öffnenden Fenster die folgende Datei aus

#3. Datensatz in Form bringen
  #Geschlecht und Alter umkodieren
  data$Geschlecht <- factor(data$Geschlecht, levels = c(1,2,3),
                          labels = c("weiblich", "männlich", "divers"))
  data$Alter <- factor(data$Alter, levels = c(1,2,3,4,5),
                     labels = c("bis 29 Jahre", "30-39 Jahre", "40-49 Jahre",
                                "50-59 Jahre", "ab 60 Jahren"))
  
  #ungültige Daten eliminieren
  data[data == 9999] <- NA

  data <- na.omit(data)

  #Mittel aus den Anforderungen berechnen
  data$Anforderungen <- rowMeans (data[(3:5)])

  data$Support <- rowMeans (data[(6:9)])

  data$Stresssymptome <- rowMeans (data[(10:13)])

#4. Statistische Auswertung
  #Zusammenfassung über den Datensatz
  summary(data)
  
  #So erstellst Du ein Plot, das Support nach Geschlecht aufgeteilt zeigt.
  plot(data$Geschlecht, data$Support)

  #Nach dem Gleichen Schema kannst Du Dir alle statistischen Zusammenhänge anhand eines Boxplots zeigen lassen.
  #Die Funktion dafür lautet: plot(x-Achse, y-Achse)
  
