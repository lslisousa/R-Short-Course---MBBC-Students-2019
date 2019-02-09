#######################################
#######    Script - EXERCISES   #######
#######    Introduction to R    #######
#######################################


#-------------Ex 1-------------------

a<-4+5*(log10(4)-exp(3))
a
b<-sqrt(37)+a
b


#-------------Ex 2-------------------

s<-26:17
s
#or
s.2<-seq(from=26,to=17)
s.2

#-------------Ex 3-------------------

x<-c(4,8,12,16,20,24) # for example

a.1 <- x>13
a.1
b.1 <- x<13&x==23
b.1
c.1 <- x>=0
c.1

a.1&b.1
b.1|c.1
!b.1&c.1

#-----------Ex 4.a---------------------

weight<-c(62,70,52,98,90,70)
weight
height<-c(1.70,1.82,1.75,1.94,1.84,1.61)
height

#-----------Ex 4.b---------------------

#weight>69
#height<1.70
#(weight>69)&(height<1.70)
sum((weight>69)&(height<1.70))

#-----------Ex 4.c---------------------

BMI<-weight/height^2
BMI
mode(BMI)
length(BMI)

#-----------Ex 4.d-----------------------

names(BMI)<-c("Normal weight","Normal weight","Low weight","Overweight","Overweight","Overweight")

#-----------Ex 5-----------------------

thousand.exp<-list(sex="female",age=43,medicine=c("1","2","3"),blood.sugar.pos=c(167,245,165),blood.sugar.bef=345)
thousand.exp
mode(thousand.exp$sex)
mode(thousand.exp$age)
mode(thousand.exp$medicine)
mode(thousand.exp$blood.sugar.pos)
mode(thousand.exp$blood.sugar.bef)



#-------------Ex 6-------------------

library(MASS)
data(Melanoma)
dim(Melanoma)
head(Melanoma)
attach(Melanoma)
table(year,sex)

#-------------Ex 7.a-------------------

library(MASS)
data(Animals)
dim(Animals)
head(Animals)
names(Animals)
attach(Animals)

plot(brain,body,xlab="Brain weight (g)",ylab="Body weight (kg)")


#-------------Ex 7.b-------------------

plot(log(brain),log(body),xlab="log_e(Brain weight)",ylab="log_e(Body weight)")
text(x=log(body),y=log(brain),labels=row.names(Animals))


#-------------Ex 7.c-------------------

par(mfrow=c(1,2))
plot(brain,body,xlab="Brain weight (g)",ylab="Body weight (kg)")
plot(log(brain),log(body),xlab="log_e(Brain weight)",ylab="log_e(Body weight)")
# Graphic window - Export - Save as image


#-------------Ex 8-------------------

mean.dp <- function(x){
  m <- mean(x)
  dp <- sd(x)
  c(mean=m, stand_dev = dp) }
x<-c(2,4,6,8,10,12)   # for example
mean.dp(x)

#-------------Ex 8.a-------------------

mean.dp.a <- function()
  sd(rnorm(20))
mean.dp.a()

#-------------Ex 8.b-------------------

mean.dp.b <- function(x){
  m <- mean(x,na.rm=TRUE)
  dp <- sd(x,na.rm=TRUE)
  c(mean=m,stand_dev=dp)
  }
x<-c(2,4,6,8,10,12,NA)
mean.dp.b(x)


