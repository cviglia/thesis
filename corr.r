# correlazione eventi-caricamenti
# correlazione pearson, formula cor

# matrici
matrix1 <- matrix(c(15, 4, 3), nrow = 3)
matrix2 <- matrix(c(845, 474, 299), nrow = 3)

# correlazione
correlazione <- cor(as.vector(matrix1), as.vector(matrix2))
print(correlazione)

# correlazione = 0.9703617

# cor^2=var

# varianza
varianza_matrice1 <- var(as.vector(matrix1))
varianza_matrice2 <- var(as.vector(matrix2))

print(varianza_matrice1)
print(varianza_matrice2)


# grafici correlazione
setwd("C:/Rtesi/")

library(ggplot2)
library(hrbrthemes)
library(MASS)


p2 <- ggplot(correlazione, aes(x=events.2023, y=submissions.2023, color= ï..Countries)) + geom_point(size= 3) + geom_smooth(method="glm.nb" , color="black", se=TRUE) + theme_ipsum() 

# ggplot per il grafico, color può essere usato per dare differenti colori alle variabili sulla base delle etichette. 

# geom_point(size= 3) aggiunge I punti al grafico, size può essere usato per ingrandire o diminuire la grandezza dei punti. 

# geom_smooth(method="glm.nb" , color="black", se=TRUE) aggiunge la retta di regressione, method è il metodo usato per tracciare la regressione 
# (glm.nb è la regressione binomiale negativa, adatta ai dati da conta), color è il colore della retta, se=TRUE aggiunge la deviazione standard (FALSE non metterla) 

# theme_ipsum() migliora l’aspetto del plot 

co=print(p2 + labs(title = "Correlation between submissions and bioblitzes", color = "Countries", y = "Submissions 2023", x = "Bioblitz events 2023")) 

# labs(title = "Correlation between submissions and bioblitzes", y = "Submissions 2023", x = "Bioblitz events 2023") sostituisce I titoli 

co + theme(plot.title = element_text(hjust=0.5, size=20), axis.title.x = element_text(hjust=0.5, size = 12), axis.title.y = element_text(hjust=0.5, size= 12))

# theme(plot.title = element_text(hjust=0.5, size=20), axis.title.x = element_text(hjust=0.5, size = 12), axis.title.y = element_text(hjust=0.5, size= 12))) aggiusta I titoli e dimensioni dei caratteri. plot.title è il titolo principale, axis.title.x la x e axis.title.y la y. hjust permette di cambiare posizione(0.5 è la posizione centrale). 


costanza.significatività= glm.nb(correlazione$submissions.2023 ~ correlazione$events.2023) 

summary(costanza.significatività) 

# correlazione$submissions.2023 ~ correlazione$events.2023 è la formula per calcolare il modello. La prima è la variabile dipendente(y), la seconda l’indipendente(y). In questo caso è come dire: le sottomissioni dipendono dagli eventi. 

# summary(costanza.significatività) dà vari parametri del modello. Per ora va bene concentrarsi sul Pr(>|z|), che altro non è che il p-value. È importante che sia <0,05. 
