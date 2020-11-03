# Computer lab 
#27/10/2020 MAYA HACHICHA

#Exercice 1

jpeg(filename = "Plot1ex.jpeg", width = 15, height = 6, units = "cm", res = 100, bg="transparent" )# Open the device "Plot1ex.jpeg" with 15cm wide, 6cm high, res=100, unity: cm
plot(0, 0, xlim = c(0, 26), ylim = c(0.5, 1.5)
     , ylab = "", xlab = "", yaxt = "n")
axis(2, 1, labels = c("pch & col"))
for (i in seq(1,25)) {
  points(i, 1, col = i, pch = i , cex = 2)             # col and pch
}
dev.off()

#Exercice 2

#### Plot graphic with ten BINOMIALS distributions using for() -----------

tiff("Plot1.tiff", width = 15, height = 15, units = "cm", 
     bg = "transparent", res = 100)
x   <- seq(0, 25, 1)                    # Sequence
y   <- dpois(x, lambda = 1)  # densities for x
plot(x, y, type = "n")                  # Empty plot (type = "n")

### Plot lines over first plot
for (i in 1:10) {          # Ten lines with SIZES from 1 to 10
  y <- dpois(x, i)    # densities for x
  lines(x, y, col = i)                       # Plot the line
}
legend("topright", legend = paste("lamda =", seq(1:10))
       , lty = 1, col = 1:10)
title(main = "Poisson distributions, lambda = 1 to 10")

dev.off()

#Exercice 3

#Import data from this article: https://peerj.com/articles/328/

Webcsv <- "https://dfzljdn9uc3pi.cloudfront.net/2014/328/1/Appendix1.csv"
Data <- read.table(Webcsv, header = T, sep = ",", skip=2)
str(Data)                    # Check if it has been correctly imported

# Plot graphs

Webcsv <-"https://dfzljdn9uc3pi.cloudfront.net/2014/328/1/Appendix1.csv"
Data <- read.table(Webcsv, header = T, sep = ",", skip = 2)
Data[-1]
str(Data) 

Data <- Data [-1]
Data$crop <- as.factor(Data$crop) 

for (i in names(Data[5:11])) {
  plot(Data$mean_yield ~ Data[[i]], ylab = "Mean yields", xlab = as.character(names(Data[i])), col = Data$crop)
  title(main= paste("Mean yield in function of", as.character(names(Data[i]))))
  
  
}

pdf("R3Hachicha.pdf")
for (i in names(Data[5:11])) {
  plot(Data$mean_yield ~ Data[[i]], ylab = "Mean Yields", xlab = as.character(names(Data[i])), col = Data$crop)
  title(main= paste("Mean Yield in function of", as.character(names(Data[i]))))
}
dev.off()
getwd()

