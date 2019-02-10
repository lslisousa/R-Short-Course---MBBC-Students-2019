
###########################################
#######    Script - SLIDES          #######
#######    Non-Parametic Inference  #######
###########################################

# Ex Wilcoxon - matched pairs

x<-c(45, 32, 47, 40, 38, 41, 37, 52, 37)
y<-c(38, 40, 35, 38, 34, 35, 38, 38, 40)
wilcox.test(x, y, alternative = "greater", paired=TRUE)

# Ex Mann-Whitney-Wilcoxon

x<-c(8.50, 9.48, 8.65, 8.16, 8.83, 7.76, 8.63)
y<-c(8.27, 8.20, 8.25, 8.14, 9.00, 8.10, 7.20, 8.32, 7.70)
wilcox.test(x, y, alternative = "two.sided", paired = FALSE)

# Ex Kruskal-Wallis

a<-c(30.28, 27.5, 27.9, 29.33)
b<-c(34.26, 32.55, 21.78, 25.59, 35.08, 26.86)
c<-c(39.47, 30.15, 33.40, 27.38, 30.39, 25.85, 29.11, 26.22)
d<-c(33.54, 30.40, 29.60, 28.82, 30.70, 30.83, 33.84)
x<-list(a,b,c,d)
kruskal.test(x)


# Ex Chi-Sq GOF

x<-c(0,1,2,3)
obs.freq<-c(80,32,8,7)
n<-sum(obs.freq)
sum.x<-sum(obs.freq*x)
estim<-n/(n+sum.x)
estim

x<-c(0,1,2)
prob<-dgeom(x,estim)
prob[4]<-1-sum(prob)
exp.freq<-sum(obs.freq)*prob
exp.freq
res<-chisq.test(obs.freq,p=prob)
res
1-pchisq(res$statistic,4-1-1)


# Ex Chi-Sq Homogeneity

table<-matrix(c(273,281,258,244,233,246,236,229),2,4)
dimnames(table)<-list(c("seq1","seq2"),c("A","G","C","T"))
chisq.test(table)
chisq.test(table)$expected


# Ex Chi-Sq Independence

table<-matrix(c(67,80,58,60,70,60,72,74,55,70,80,60,48,65,66,82),4,4)
dimnames(table)<-list(c("A","G","C","T"),c("A","G","C","T"))
chisq.test(table)
chisq.test(table)$expected


