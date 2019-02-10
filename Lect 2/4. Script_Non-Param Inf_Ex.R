###########################################
#######    Script - EXERCISES       #######
#######    Non-Parametic Inference  #######
###########################################


# -------------Ex 1----------------

d<-c(91.9,97.8,111.4,122.3,105.4,95.0,103.8,99.6,96.6,119.3,104.8,101.7)
wilcox.test(d,mu=105,alternative="two.sided")

# -------------Ex 2----------------

# Mann-Whitney-Wilcoxon test

premier<-c(24.5, 23.4, 25.3, 23.4, 22.1)
super<-c(26.4, 27.0, 25.2, 25.8, 27.1)
wilcox.test(premier,super)

# -------------Ex 3.a----------------

a<-matrix(c(0.857,0.5,0,1,0.5,0.833,0,0.667,1,1,0.167,1,0,1,0,0.75,0,1,0,1,0,1,0,1,1,1,1,1),14,2,byrow=TRUE)

#verifying assumptions
#Normality

diff<-c(a[,2]-a[,1])  #After-Before
diff
shapiro.test(diff)  #testing for normality

# -------------Ex 3.b----------------

wilcox.test(diff, alternative =  "greater")  #non-parametric test, Wilcoxon


# -------------Ex 4.a----------------

s1<-c(339,468,134,497,229,329)
s2<-c(103,115,198,126,115,120)
s3<-c(107,199,102,105,89,110)
observ<-c(s1,s2,s3)
treatm<-rep(c("str1","str2","str3"),c(length(s1),length(s2),length(s3)))

boxplot(observ~treatm)

bartlett.test(observ,treatm)  # p=0.0043

# -------------Ex 4.b----------------

shapiro.test(s1)  # p=0.742
shapiro.test(s2)  # p=0.007
shapiro.test(s3)  # p=0.003

x<-list(s1,s2,s3)
kruskal.test(x)  # p=0.004

# -------------Ex 5.a----------------

x<-c(0,1,2,3,4,5,6,7)
obs.freq<-c(12,27,49,66,67,32,11,5)
n<-sum(obs.freq)
sum.x<-sum(obs.freq*x)
estim<-n/(n+sum.x)
estim

# -------------Ex 5.b----------------

x<-c(0,1,2,3,4,5,6)
prob<-dgeom(x,estim)
prob[8]<-1-sum(prob)
exp.freq<-sum(obs.freq)*prob
exp.freq
res<-chisq.test(obs.freq,p=prob)
res
1-pchisq(res$statistic,8-1-1)

# -------------Ex 6----------------

# Chi-Sq Test for Independence

table<-matrix(c(100,450,50,20,30,20,180,120,30),3,3)
dimnames(table)<-list(c("Blue","Brown","Green"),c("Brunette","Red","Blonde"))
table
chisq.test(table)
chisq.test(table)$expected



