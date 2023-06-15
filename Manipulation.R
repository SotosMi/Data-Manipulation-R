# DATA PREPARATION 
# TM2

#Concatenation
x<-1:4
y<-2:5
c(x,y)

#Sequence
x<-seq(1,4);x
x<-seq(1,10,by=2)

#Repetition
x<-1:3
rep(x,c(1,2,3))


#A vector is an ordered collection of data of the same type
#Combining vectors
fruit <- 1:10
vege<- 1:2
c(fruit,vege)

#Matrix
x<-1:3
y<-2:4
cbind(x,y)
# 1  2
# 2  3
# 3  4
rbind(x,y)
# 1 2 3
# 2 3 4

#Naming
mat1 <- matrix(1:8 ,nr= 2)
row.names(mat1)<- c("A","B")
colnames(mat1)<-c("G","F","G","f")


#We can access the elements of a matrix named mat using square brackets as mat[row, col], 

mat1[1,]
mat1[1,1]
mat1[c(1,2),c(1,3)]
mat1[-c(1),]
#add
mat1<-cbind(mat1,c(1,2))

#Type Checking
#Type checking and conversion functions – 
#the functions as.numeric() / as.character() / as.logical() / as.integer() can convert a vector
#into their corresponding type.


#List : contains objects of different types
x<- list(1:5,"GIIG",TRUE,25)
namedlist <- list("name"="Bob","wife"="julie","age"=35,"childer age" = c(4,7,9))
namedlist[["name"]]
names(namedlist)

#reassign
namedlist[["name"]] <- "John"
#Delete
namedlist[3]<-NULL


#MISSING VALUES USEFULL FUNCTIONS
#is.na
is.na(namedlist)
#is.nan undefined for math operations


#DATA FRANE
age<- c(25,36,78,68)
names<- c("g","a","d","F")
height<-c(23,453,543,343)
data<-data.frame(age,names,height)
data

nrow(data)
ncol(data)
str(data)

#ACCESS COLUMN [[ ]] OR $

data[["names"]]
data$names

data[1:3,] #first 3 rows
data[,1] # first column

#Conditioning
data[data$age >25,]

newrow <-c(23,32,32,32)
data<-rbind(data,newrow)

#DELETE COLUMN
data$height <- NULL

#Remove ROW 5
data<- data[-5,]
data$height <- c(23,23,43,54) # ADDING COLUMN


#NAs
x<-c(1,2,3,NA,23,NA)
bad <- is.na(x)
x[!bad]
#REMOVED NA

#Subset Complete cases
good <- complete.cases(x)
x[good]

# mean ( data , na.rm = TRUE) REMOVE NAS

#loop
a <- 5
b <- 6
if(a<b){
  print("a is smaller than b")
}

if(a>b){
  print("a is greater than b")
} else{
  print("b is greater than a")
}


#for

vec<-1:10
for(i in vec){
  print(vec[i])
}


#while
while(i<10){
  print(i)
  i <-i+1}

#We can perform the element-wise multiplication of two matrices using the * operator. 
#But we can do matrix multiplication, with the %*% operator.


#The t() function in R gives us the transpose of a matrix. 
t(mat1)

# FUNCTION FACTORIAL
fac <-function(x){
  if(x==0){
    return(1)
  }else{
    return(x*fac(x-1))
  }
}

#SUM OF SERIES
sum_series <- function(vec){
  if(length(vec)<=1){
    return(vec^2)
  }else{
    return(vec[1]^2+sum_series(vec[-1]))
    
  }
}

series <-c(1:10)
sum_series(series)

#Statistic measures
mean(mtcars$mpg)
median(mtcars$mpg)
sd(mtcars$mpg)
var(mtcars$mpg)
mad(mtcars$mpg)
max(mtcars$mpg, na.rm = TRUE)
min(mtcars$mpg, na.rm = TRUE)
sum(mtcars$mpg)
length(mtcars$mpg)


#MODE
library(modeest)
mfv(mtcars$mp)

#Ordered factors

volume <-factor(c("low","high","medium"))
volume<-factor(volume,levels = c("low","high","medium"),ordered=TRUE)

#plot()  #GREAT PLOT OF LINEAR REGRESSION
attach(mtcars)
plot(wt,mpg)
abline(lm(mpg~wt))
title("REGRESSION OF WEIGHT")

#NAMES in df EXERCISE 1
data
names(data)
rownames(data)<-data$names
data$names<-NULL

#Find types of vars
lapply(data,class)

#Exercises 2
#Add new variable
mtcars$new <- mtcars$cyl + mtcars$mpg
overone <- subset(mtcars,mpg>1) # subset
nrow(overone)

names(mtcars)
names(mtcars)[2] <-"pyl" #Change Coll Name

#Data Visualization
#One or Two attributes
#Scatter, boxplot , barplot , Histogram

#Barchart frequencies of catergorical variables
y<-c(35,80,20,62,90,40)
x<-c("a","b","c","e","f" ,"g")

barplot(y,names.arg = x,xlab="categorical attribute",ylab = "frequency")

#Histogram frequency distribution of a numerical attribute 
# range can be fixed in bins intervals of equal size
# frequency = height of the bar
attach(iris)
hist(Petal.Length)
hist(Petal.Length,breaks = c(1.0,3.0,4.5,4.0,6.9))
#Best choise of K : 
#Sturge Rule : log2(n) + 1

#Skewness: assymetry of the probability distribution
#Kurtosis : deviation from the peak in a Gausian distribution due to outliers

#Boxplot: visualize and summarize characteristics of a numerical attribute
boxplot(Sepal.Length~Species)

#DETECT OUTLIERS WITH BOXPLOT
#THE SAME DISTRIBUTION CAN RESULT TO DIFFERNT BOXPLOT DEPENDING ON THE SAMPLE SIZE n

#EXERCISE 3
# using the function quantile obtain a vector including the following:
# 0% ,25% ,50% .75% , 100%
quantile(iris$Sepal.Length)
#0.5 % .95%
quantile(Sepal.Length,c(.5,.95))
#INTERQUARTILE RANGE
IQR(Sepal.Length)

#1)HISTORGRAM FREQUENCY 2)HISTOGRAM PROBABILITY/PROPORTION

hist(Sepal.Length)
hist(Sepal.Length,probability = TRUE)


#1)BOXPLOT INCUDING OUTLIERS 2) WITHOUT OUTLIERS
boxplot(Sepal.Length)
boxplot(Sepal.Length,outline=F)

# TWO ATTRIBUTES SCATTERPLOT
# POINTS CAN HIDE EACHOTHER : ADD JITTER
plot(jitter(Petal.Length),jitter(Petal.Width),
     pch=c(21,24,25)[unclass(Species)],
     bg = c("red","blue","green3")[unclass(Species)])
legend(5,0.9,legend=c("Virginica","Versicolor","Setosa"),
       fill = c("red","blue","green3"))

plot(jitter(Sepal.Length),jitter(Sepal.Width),
     pch=c(21,24,25)[unclass(Species)],
     bg = c("red","blue","green3")[unclass(Species)])



#Scatteplot can spot outliers
#its not suitable for large datasets
# Alternatives like density plot 
     
     
#Visualization Reveals patterns or exceptions
#does not indicate anything specific
#there might still be something in the dataset we do not see

#HIGH DIM DATA
install.packages("rgl")
library(rgl)
plot3d(Sepal.Length,Sepal.Width,Petal.Length,
       col = as.numeric(Species),size = 10)     
     
     
#CORRELATION ANALYSIS
#HOW DO WE MEASURE SIMILARITY
#1) pearsons coefficient
#2)spearman's rank

#pearson
cor(Sepal.Length,Sepal.Width)
#spearman
cor(Sepal.Length,Sepal.Width,method = "spearman")

#cor.test : tests association and significance level
cor.test(Sepal.Length,Sepal.Width)

####
auto<-Filter(is.numeric,mtcars) #new dataframe only columns with numerica values
cor(auto)


