
########################################
#######    Script - SLIDES       #######
#######    Exploratory Data Analysis  ##
#######################################


# Descriptive Statistics
# -----------------------

# Example:

data<-c(2,5,3,7,1,4,2,5,2,7,1,3,2,3,5,6)
mean(data)
median(data)
var(data)
sd(data)
quantile(data)
min(data)
max(data)

# Notes:

sqrt(var(data))
quantile(data,c(0.2,0.7))


# Install package ISwr

library(ISwR)

data(juul)
names(juul)

# Juul's IGF data
# The juul data frame has 1339 rows and 6 columns. It contains a 
# reference sample of the distribution of insulin-like growth factor 
# (IGF-I), one observation per subject in various ages, with the bulk
# of the data collected in connection with school physical examinations. 

# This dataframe contains the following columns: 
# age
#    a numeric vector (years). 
# menarche
#    a numeric vector. Has menarche occurred (code 1: no, 2: yes)? 
# sex
#    a numeric vector (1: boy, 2: girl). 
# igf1
#    a numeric vector, insulin-like growth factor (microgram per liter). 
# tanner
#    a numeric vector, codes 1–5: Stages of puberty ad modum Tanner. 
# testvol
#    a numeric vector, testicular volume (ml). 

attach(juul) 
mean(age)

mean(age,na.rm=T)
colMeans(juul,na.rm=T) # Is factors levels are numbers, still calculates de mean

summary(age)

summary(juul)  # not regognized as factor

juul$sex<-factor(juul$sex, labels=c("M","F"))
juul$menarche<-factor(juul$menarche,labels=c("No","Yes"))
juul$tanner<-factor(juul$tanner,labels=c("I","II","III","IV","V"))
attach(juul)

# Ex
summary(juul)

# Example
tapply(igf1,sex,mean,na.rm=T) # average for igf1 per gender

table(sex)

table(sex, tanner) 

table(menarche,sex,tanner)

# -------------------------
# Graphical Representations
# -------------------------

# Bar Plot
# --------

barplot(table(tanner))

table(tanner)/sum(!is.na(tanner))

barplot(table(tanner)/sum(!is.na(tanner)),xlab="tanner",ylab="Relative Freq.",ylim=c(0,0.5))

par(mfrow=c(1,3))
barplot(table(tanner))
barplot(table(tanner)/sum(!is.na(tanner)))
barplot(table(tanner)/sum(!is.na(tanner)),xlab="tanner",ylab="Relative Freq.",ylim=c(0,0.5))

# Circular Diagram
# -----------------

par(mfrow=c(1,1))
pie(table(tanner))
slices<-c("yellow","orange","red","blue","green")
pie(table(tanner),col=slices,main="tanner")

par(mfrow=c(1,2),mex=0.3)
pie(table(tanner))
slices<-c("yellow","orange","red","blue","green")
pie(table(tanner),col=slices,main="tanner")


# Histogram
# ----------

par(mfrow=c(1,3))

hist(igf1)
hist(igf1,plot=FALSE)

hist(igf1,probability=TRUE,col="blue")
class<-c(0,50,200,350,500,650,1000)
h<-hist(igf1,breaks=class,angle=45,density=40)
text(h$mids,h$density,h$counts,adj=c(0.5,-1))


# Box Plot
# ---------

boxplot(igf1,range=0)
boxplot(igf1)

boxplot(igf1,horizontal=T,col="magenta")
boxplot(igf1,col="pink",main="IGF-1",sub=paste("Total:",length(igf1),"nn","NA:",sum(is.na(igf1))))

par(mfrow=c(2,2),mex=0.4)
boxplot(igf1,range=0)
boxplot(igf1)
boxplot(igf1,horizontal=T,col="magenta")
boxplot(igf1,col="pink",main="IGF-1",sub=paste("Total:",length(igf1),"\n","NA:",sum(is.na(igf1))))

par(mfrow=c(1,1))
boxplot(age~menarche,col=c("salmon","cyan"),main="Box Plot of age, per menarche (No/Yes)",ylab="AGE")


# Quantile-Quantile Plot
# -----------------------

qqnorm(igf1,main="Q-Q Plot (Normal) for IGF-1")
qqline(igf1,col="blue")













