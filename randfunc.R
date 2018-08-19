Randforestfunction=function(symp1,symp2,symp3,symp4)
{

library(e1071)
library(caret)
library(randomForest)
library(sqldf)
setwd("F:/FYP")
data<-read.csv("DS1.csv")
training_data=data


rfmodel=randomForest(Disease~.,data=training_data,ntree=500,mtry=15,importance=TRUE)
testing_data1=data[79,1:348]

q=sprintf("SET [%s]='Yes',[%s]='Yes',[%s]='Yes',[%s]='Yes'",symp1,symp2,symp3,symp4)
df=sqldf(c(paste("UPDATE testing_data1",q),"SELECT * FROM testing_data1"))
df1=as.data.frame(df)
#View(df1)

testing_data=df1
testing_data$predict.rf2=predict(rfmodel,testing_data,type="response")
#testing_data$predict.rf2
#rfmodel

result=testing_data$predict.rf2
result=data.frame(result)
#result
medicine=read.csv("medicine.csv")
med=sqldf(c(paste("select Medication from medicine name where rownum==",result)))
herb=sqldf(c(paste("select Herb from medicine name where rownum==",result)))

result
med
herb
}

v<-c(1,0,0,1,1)
s<-c('A','B','C','D','E')
plot(v,type = "o", xlab = "Test Cases", ylab = "Prediction Accuracy",main = "Flu",axes = FALSE)
axis(2)
axis(1,at=seq_along(v),labels=as.character(s),las=2)
box()
