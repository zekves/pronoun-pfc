MD=read.csv('MD_REML.txt',header=FALSE)
MD$Sub=1:18
MD$Change=as.factor("Min")
MD$Ref=as.factor("Repeat")

SD=read.csv('SD_REML.txt',header=FALSE)
SD$Sub=1:18
SD$Change=as.factor("Sub")
SD$Ref=as.factor("Repeat")

MP=read.csv('MP_REML.txt',header=FALSE)
MP$Sub=1:18
MP$Change=as.factor("Min")
MP$Ref=as.factor("Pronoun")

SP=read.csv('SP_REML.txt',header=FALSE)
SP$Sub=1:18
SP$Change=as.factor("Sub")
SP$Ref=as.factor("Pronoun")

t.test(MD$V1,SD$V1,paired=TRUE)
t.test(MP$V1,SP$V1,paired=TRUE)
t.test(SP$V1,SD$V1,paired=TRUE)
t.test(MP$V1,MD$V1,paired=TRUE)

data=rbind(MD,MP,SD,SP)

MDm=mean(MD$V1)
SDm=mean(SD$V1)
MPm=mean(MP$V1)
SPm=mean(SP$V1)

library("ez")
library("ggplot2")
library("wesanderson")
ezANOVA(data=data,dv=.(V1),wid=.(Sub),within=.(Change,Ref))
plot=ezPlot(data=data,  dv=.(V1), wid=.(Sub),within=.(Ref,Change),x=.(Ref),split=.(Change),y_lab="Mean Beta Values",split_lab="Change Type",x_lab="Reference Type",bar_width=.5)
plot+scale_colour_manual(values=wes_palette("IsleofDogs1"))

library(lme4)
library(afex)
lmeModel = lmer(V1 ~ Change*Ref + (1|Sub), data=data)
summary(lmeModel)

data$conditions=as.factor(paste(data$Change,data$Ref))

pairwise.t.test(data$V1,data$conditions,p.adjust.method="none",paired=TRUE)
