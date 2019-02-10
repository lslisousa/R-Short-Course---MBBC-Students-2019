#######################################
#######    Script - EXERCISES   #######
#######    Expl. Data Analysis  #######
#######################################


# -------------Ex 1.a----------------

prec.tot <-c(90.2,100.5,70.2,80.6,30.3,10.9,8.2,2.4,3.7,50.8,50.7,99.4)
prec.tot

# -------------Ex 1.b----------------

month <- c('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec')
month

# -------------Ex 1.c----------------

names(prec.tot) <- month
prec.tot

# -------------Ex 1.d----------------

sum(prec.tot)     # i
mean(prec.tot)    # ii
median(prec.tot)  # iii
sd(prec.tot)      # iv
min(prec.tot)     # v
max(prec.tot)

# -------------Ex 1.e----------------

prec.tot[c(6,7,8,9)]
# or 
prec.tot[6:9]

# -------------Ex 1.f----------------

prec.tot[prec.tot>mean(prec.tot)]

# -------------Ex 1.g----------------

prec.tot[prec.tot==min(prec.tot)]
# or
which.min(prec.tot)

# -------------Ex 1.h----------------

barplot(prec.tot,col=rainbow(12),ylab="total precipitation (mm)")

# -------------Ex 1.i----------------

boxplot(prec.tot,col='orange')

# -------------Ex 2.a----------------

brand<-c(3,4,1,1,3,4,3,3,1,3,2,1,2,1,2,3,2,3,1,1,1,1,4,3,1)
#or
name<-c("BeerDear","BlondieBeer","ForeignBeer","LoveBeer")
name

barplot(table(brand)/length(brand),names.arg=name,col=rainbow(17),ylab="relative freq.",main="Bar Plot")
barplot(table(brand),names.arg=name,col=rainbow(4),ylab="absolute freq.",main="Bar Plot")

# or

brand.f<-factor(brand,label=c("BeerDear","BlondieBeer","ForeignBeer","LoveBeer"))

barplot(table(brand.f)/length(brand.f),col=rainbow(17))
barplot(table(brand.f),col=rainbow(4))

# ------------Ex 2.b-----------------

color<-c("purple","green2","cyan","gray")
pie(table(brand),col=color,label=name)

# or

pie(table(brand.f),col=rainbow(7))


# -------------Ex 3.a-------------------

smoke=c("Y","N","N","N","Y","Y","Y","N","N","Y")
hours=c(1,2,2,3,3,1,2,1,3,2)
table(smoke,hours)
#or
hours.f<-factor(hours,labels=c("less 5h","5h-10h","more 10h"))
table(smoke,hours.f)

data<-data.frame(smoke,hours.f)
data

# ------------Ex 3.b--------------------

barplot(table(hours,smoke),col=c("purple","magenta","pink"),xlab="smoke",ylab="absolute freq.",
legend.text=c("less 5h","5h-10h","more 10h"),main="Hours of Study by Smoking Habits")

# or

barplot(table(hours.f,smoke),col=c("purple","magenta","pink"),xlab="smoke",ylab="absolute freq.",
legend.text=c("less 5h","5h-10h","more 10h"),main="Hours of Study by Smoking Habits")

# ------------Ex 3.c--------------------

barplot(table(hours,smoke),col=c("darkblue","blue","lightblue"),beside=T,
legend.text=c("less 5h","5h-10h","more 10h"),main="Hours of Study by Smoking Habits")


