setwd("F:/FYP")
library(rpart)
library(rpart.plot)
ds=read.csv("edited1.csv")
View(ds)

training_data=ds
tree_model=rpart(Diseases~.,training_data,method="class", minsplit=2, minbucket=1)
plot(tree_model)
text(tree_model, pretty = 0)

data1=ds[2,1:347]
testing_data=data1
tree_pred=predict(tree_model,testing_data,type="class")
tree_pred
prp(tree_model,tweak=0.8)


#data1=ds[2,c(5,7)]
#plot(tree_model, uniform=TRUE,margin=0.2)
#text(tree_model, all=TRUE, cex=.8)

