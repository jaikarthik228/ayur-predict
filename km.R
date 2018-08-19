library(ggplot2)
library(cluster)
d1=read.csv("DS.csv",header = TRUE)
hist=as.numeric(d1$Symptoms)
View(hist)
d1=data.frame(d1,hist)
any(is.na(d1))
dili=as.numeric(d1$Disease)
d1=data.frame(d1,dili)
View(d1)
k=kmeans(d1[,c(3,4)],20)
k
k$cluster=as.factor(k$cluster)
ggplot(d1,aes(hist,dili,color=k$cluster))+geom_point()

#z<-d1[,c(3,4)]
#m<-apply(z,2,mean)
#s<-apply(z,2,sd)
#z<-scale(z,m,s)
#distance<-dist(z)
 

#wss<-(nrow(z)-1)*sum(apply(z,2,var))
 #     for(i in 2:90) wss[i]<-sum(kmeans(z,centers=i)$withinss)
  #    plot(1:90,wss,type="b",xlab = "Number of clusters",ylab = "Within groups sum of squares")
      
      
   #   wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
    #  for (i in 2:15) wss[i] <- sum(kmeans(mydata,
                                           #centers=i)$withinss)
     # plot(1:15, wss, type="b", xlab="Number of Clusters",
      #     ylab="Within groups sum of squares")
      
      clusplot(d1[,c(3,4)],k$cluster,color=TRUE,shade=TRUE,labels=2,lines=0)
      