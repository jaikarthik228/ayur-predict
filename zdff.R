cat("Name?\n")
inp<-readLines(file("stdin"),n=1L)
cat(paste("Hello",inp,"\n"))