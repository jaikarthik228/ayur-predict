library(e1071)
library(caret)
library(randomForest)
library(sqldf)
setwd("F:/FYP")
data<-read.csv("DS1.csv")
training_data=data


rfmodel=randomForest(Disease~.,data=training_data,ntree=500,mtry=15,importance=TRUE)
testing_data1=data[79,1:347]
#utils::View(testing_data1)



nos=readline(prompt="Enter number of symptoms:(Upto 4)")


if(nos==1)
{
  symp1=readline(prompt="Enter symptom:")
  q=sprintf("SET [%s]='Yes'",symp1)
  q2=sprintf("SET [%s]='No'",symp1)
}else if(nos==2)
{
  symp1=readline(prompt="Enter symptom 1:")
  symp2=readline(prompt="Enter symptom 2:")
  q=sprintf("SET [%s]='Yes',[%s]='Yes'",symp1,symp2)
  q2=sprintf("SET [%s]='No',[%s]='No'",symp1,symp2)
}else if(nos==3)
{
  symp1=readline(prompt="Enter symptom 1:")
  symp2=readline(prompt="Enter symptom 2:")
  symp3=readline(prompt="Enter symptom 3:")
  q=sprintf("SET [%s]='Yes',[%s]='Yes',[%s]='Yes'",symp1,symp2,symp3)
  q2=sprintf("SET [%s]='No',[%s]='No',[%s]='No'",symp1,symp2,symp3)
}else
{
  symp1=readline(prompt="Enter symptom 1:")
  symp2=readline(prompt="Enter symptom 2:")
  symp3=readline(prompt="Enter symptom 3:")
  symp4=readline(prompt="Enter symptom 4:")
  q=sprintf("SET [%s]='Yes',[%s]='Yes',[%s]='Yes',[%s]='Yes'",symp1,symp2,symp3,symp4)
  q2=sprintf("SET [%s]='No',[%s]='No',[%s]='No',[%s]='No'",symp1,symp2,symp3,symp4)
}



q
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

#df=sqldf(c(paste("UPDATE testing_data1",q2),"SELECT * FROM testing_data1"))
#df1=as.data.frame(df)
#View(df1)