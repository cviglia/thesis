# correlazione eventi-caricamenti

# matrici
matrix1 <- matrix(c(15, 4, 3), nrow = 3)
matrix2 <- matrix(c(845, 474, 299), nrow = 3)

# correlazione
correlazione <- cor(as.vector(matrix1), as.vector(matrix2))
print(correlazione)correlazione

# correlazione = 0.9703617


