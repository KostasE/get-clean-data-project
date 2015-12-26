library(dplyr)
testdata<-read.table("X_test.txt")
testact<-read.table("y_test.txt")
testact$activities<-ifelse(testact$V1==1, "Walking",
                      ifelse(testact$V1==2, "Walking up",
                        ifelse(testact$V1==3,"Walking down",
                          ifelse(testact$V1==4,"Sitting",
                            ifelse(testact$V1==5, "Standing",
                              ifelse(testact$V1==6, "Laying", "NA" 
                                  ))))))
testact1<-testact[,2]
testsubj<-read.table("subject_test.txt")
traindata<-read.table("X_train.txt")
trainact<-read.table("y_train.txt")
trainact$activities<-ifelse(trainact$V1==1, "Walking",
                           ifelse(trainact$V1==2, "Walking up",
                                  ifelse(trainact$V1==3,"Walking down",
                                         ifelse(trainact$V1==4,"Sitting",
                                                ifelse(trainact$V1==5, "Standing",
                                                       ifelse(trainact$V1==6, "Laying", "NA" 
                                                       ))))))
trainact1 <- trainact[,2]
trainsubj<-read.table("subject_train.txt")
test <- cbind(testsubj, testact1, testdata)
train <- cbind(trainsubj, trainact1, traindata)
labels<-read.table("features.txt")
charlabels<-as.character(labels[,2])
names <- make.names(charlabels, unique = T)
colnames(test)<- c("subject", "activities", names)
colnames(train)<- c("subject", "activities", names)
mergedata<-rbind(test, train)
mstdata<-select(mergedata, +contains("subject"), +contains("activities"), +contains("mean"), +contains("std"))
sortdata<- arrange(mstdata, subject, activities)
groups <- group_by(sortdata, subject, activities)
tidymean<-summarise_each(groups, "mean")
tidydata<-write.table(tidymean, file = "tidydata.txt", row.names = F)
