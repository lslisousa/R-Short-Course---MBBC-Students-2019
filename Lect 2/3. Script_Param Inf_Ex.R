#######################################
#######    Script - EXERCISES   #######
#######    Parametic Inference  #######
#######################################


# -------------Ex 1----------------

# t-test for paired data

m1<-c(84.63, 84.38, 84.08, 84.41, 83.82, 83.55, 83.92, 83.69, 84.06, 84.03)
m2<-c(83.15, 83.72, 83.84, 84.20, 83.92, 84.16, 84.02, 83.60, 84.13, 84.24)
dif<-m1-m2
dif

shapiro.test(dif)  # P=0.125

t.test(dif)  # p=0.4007

# -------------Ex 2----------------

# Inference about the proportion (one sample)

data<-c(rep(1,30),rep(0,230))
data

# -------------Ex 2.b----------------

library(BSDA)

# In our case, sigma is not known, but we are using this function
# simply to help with the calculations
z.test(data,sigma.x=sd(data))$conf.int

# or
# according to the expression of the CI, estimate the sd by p^(1-p^) where p^=x/n
# sigma.x is the sd of the data
x<-30
n<-260
z.test(data,sigma.x=sqrt((x/n)*(1-x/n)))$conf.int  

# or
# according to the Chi-Square test
prop.test(x,n)$conf.int

# -------------Ex 2.c----------------

z.test(data,mu=0.1,alternative="greater",sigma.x=sqrt((x/n)*(1-x/n))) # p=0.1153846

z.test(data,mu=0.1,alternative="greater",sigma.x=sd(data)) # p=0.1153846  

# Alternatively - proportions test (chi-square)
prop.test(x,n,p=0.1,alternative="greater")  # p=0.1153846

# -------------Ex 3----------------

a<-read.table("3. Data_Pract.txt",header=T)
head(a)
dim(a)  # 130

# -------------Ex 3.a----------------

shapiro.test(a$temp)  # p=0.2332
t.test(a$temp,mu=98.6,alternative="two.sided") #p<<0.01

# -------------Ex 3.b----------------

w.women<-a[a[,2]=="female",1]; w.women  # 65
w.men<-a[a[,"gender"]=="male",1]; w.men      # 65

shapiro.test(w.women)  # p=0.09 > 0.05
shapiro.test(w.men)    # p=0.85 > 0.05
var.test(w.men,w.women)# p=0.62 > 0.05
t.test(w.women,w.men,alternative="greater",var.equal=TRUE)  #p=0.012

# -------------Ex 3.c----------------

t.test(w.women,w.men,alternative="two.sided",conf.level=0.9)$conf.int

# "1" does not belong to the 90% CI; reject H0: mu_women - mu_men = 1.

# -------------Ex 4----------------

ct<-c(611, 621, 614, 593, 593, 653, 600, 554, 603, 569)
low<-c(635, 605, 638, 594, 599, 632, 631, 588, 607, 596)
high<-c(650, 622, 626, 626, 631, 622, 643, 674, 643, 650)
observ<-c(ct,low,high)
treatm<-rep(c("ct","low","high"),c(length(ct),length(low),length(high)))

shapiro.test(ct)   # 0.864 > 0.05
shapiro.test(low)  # 0.085 > 0.05
shapiro.test(high) # 0.138 > 0.05
bartlett.test(observ,treatm)  #0.311 > 0.05

treatm<-factor(treatm)
aov(observ~treatm)
summary(aov(observ~treatm))  # p=0.0019, rej H0

# For pair-wise comparisons compute Tukey or Scheffe Test (include p-value correction)

# Tukey - same assumptions as for the ANOVA

TukeyHSD(aov(observ~treatm), 'treatm')
# result (...)
#           diff       lwr       upr     p adj
# high-ct   37.6  13.66604 61.533957 0.0016388
# low-ct    11.4 -12.53396 35.333957 0.4744032
# low-high -26.2 -50.13396 -2.266043 0.0297843
# No sig dif between low and ct.

# Scheffe - too conservative. Not the most recommended.

library(agricolae)
data<-data.frame(observ,treatm)
model<-aov(observ~treatm,data)
scheffe.test(model,"treatm", group=TRUE,console=T) 
# result (...)
# Groups, Treatments and means
# a        high    638.7 
# b        low     612.5 
# b        ct      601.1 
# No sig dif between low and ct.









