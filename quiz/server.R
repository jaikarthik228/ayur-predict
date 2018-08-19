  library(shiny)
library(e1071)
library(caret)
library(randomForest)
library(sqldf)
options(warn = -1)
shinyServer(function(input, output) {
  
  
  # The current application doesnt need reactive
 
  output$ncount <- renderPrint({
    v=0
    p=0
    k=0
    ncount <- input$rd
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
     k=k+1
    
    
    ncount <- input$rd1
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd2
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd3
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd4
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd5
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd6
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd7
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd8
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd9
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd10
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd11
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd12
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd13
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd14
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd15
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd16
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd17
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    ncount <- input$rd18
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd19
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    ncount <- input$rd20
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd21
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd22
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd23
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd24
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd25
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd26
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd27
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd28
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    ncount <- input$rd29
    if(ncount==1)
      v=v+1
    else if(ncount==2)
      p=p+1
    else
      k=k+1
    
    
    
    if(v>=p && v>=k)
    {
      paste("YOUR BODY TYPE IS: VATA",v)
       
     
    }
    else if(p>=v && p>=k)
    {
paste("YOUR BODY TYPE IS: PITTA",p)
      
    }
    else
    {
      paste("YOUR BODY TYPE IS: KAPHA",k)
    }
})
  values <- reactiveValues()
    res<- function(){ 
       
        sympt1<-input$A
        sympt2<-input$B
        sympt3<-input$C
        sympt4<-input$D
        #print(sympt1)
        #print(sympt2)
        #print(sympt3)
        #print(sympt4)
      
        setwd("F:/FYP")
        data<-read.csv("DS1.csv")
        
        training_data=data
        
      
        rfmodel=randomForest(Disease~.,data=training_data,ntree=500,mtry=15,importance=TRUE)
        testing_data1=data[79,1:347]
        
        q=sprintf("SET [%s]='Yes',[%s]='Yes',[%s]='Yes',[%s]='Yes'",sympt1,sympt2,sympt3,sympt4)
        df=sqldf(c(paste("UPDATE testing_data1",q),"SELECT * FROM testing_data1"))
        df1=as.data.frame(df)
        View(df1)
        
        testing_data<-df1
        testing_data$predict.rf2<-predict(rfmodel,testing_data,type="response")
        testing_data$predict.rf2
        #rfmodel
        
        result=testing_data$predict.rf2
        result=data.frame(result)
        View(result)
        medicine=read.csv("medicine.csv")
        med=sqldf(c(paste("select Medication from medicine name where rownum==",result)))
        herb=sqldf(c(paste("select Herb from medicine name where rownum==",result)))
        print(result)
        print(med)
        print(herb)
        
     
    }
  output$console=renderPrint({
    logText()
    return(print(values[["log"]]))
    res1$result})
  
  logText <- reactive({
    values[["log"]] <- capture.output(data <- res())
    })
  #output$medicine=renderUI({paste(med)})
 #output$herb=renderUI({paste(herb)})
  
  #listofvalues=sum(symp1,symp2,symp3)
  #output$result=renderPrint({symp3})
  #output$medicine=renderText({listofvalues[[2]]})
  #output$herb=renderText({listofvalues[[3]]})
  
 
})