
#Maya Hachicha

#Exercice 1
#Open the data frame in iris {datasets}. 
#In which units are measured the length and width of sepals and petals? 
#How many variables and observations are there in iris?
iris
str(iris)
# The width and length are measured in centimeters
#5 Variables AND 150 observations

#Exercice 2
#Create a vector with the species names.
Species.names<-iris[["Species"]]
Species<-paste("Iris", Species.names,sep=" ")
Species<-unique(Species)
print(Species)

#Exercice 3
#Create a vector with the name of all quantitative variables
Variables<-names(iris)[1:4]
print(Variables)

#Exercice 4
#Make a data frame with the combination of the two previous vectors like this
dVariables<- rep(Variables,3)
dVariables
dspecies<-rep(Species,4)
dspecies
data.frame(dspecies,dVariables)

# second method
dSpecies <- vector()
dvariable <- vector()
i <- 1

for(x in 1:3){
  for (y in 1:4){
    dSpecies[i] <- Species[x]
    dvariable[i] <- Variables[y]
    i <- i+1
  }
}
print(dSpecies)
print(dvariable)
comb <- data.frame(dspecies,dvariable)
print(comb)


# Exercise 5.
# Using dataframe from exercise 4, make a data frame with the following variables:
# Species.Variable.Mean, the mean for each variable and species.
# Standard_error, the standard error for each variable and species.
# Median, the median for each variable and species.
# Minimum, the minimum for each variable and species.
# Maximum, the maximum for each variable and species.

library(writexl)

ex5 <- expand.grid(unique(iris$Species), unique(Variables))
ex5 <- data.frame(ex5)
colnames(ex5) <- c("Species", "Variable")
ex5
print(ex5)

for (i in 1: 12) {
  newspecies <- ex5$Species[i]
  newvariable <- ex5$Variable[i]
  
  
  colums<- c(as.character(newvariable),"Species") 
  newdata <- iris[colums]
  print(newdata)
  
  finaldata <- newdata[ which(newdata$Species==as.character(newspecies)), ] 
  print(finaldata)
  
  value <- finaldata[as.character(newvariable)]
  finalvalue<- unlist(value, use.names=FALSE)

  
  ex5$Mean[i] <- mean(finalvalue)
  ex5$Standard_error[i] <- sd(finalvalue) / sqrt(length(finalvalue))
  ex5$Median[i] <- median(finalvalue)
  ex5$Minimum[i] <- min(finalvalue)
  ex5$Maximum[i] <- max(finalvalue)
}
ex5

#install.packages("writexl")
library(writexl)
writexl::write_xlsx(ex5, "Maya.stat.xslx")
 
           