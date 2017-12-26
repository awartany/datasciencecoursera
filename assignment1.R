pollutantmean <- function (directory, pollutant, id=1:332) {
  directory<-"C:/Users/FGB3043/Desktop/Coursera/specdata/"
  data<-data.frame()
  for(i in id){
    pollutant.data <- read.csv(paste(directory, formatC(i, width=3, flag="0"), ".csv", sep=""))
    data<-rbind(data,pollutant.data)
  }
  mean(data[[pollutant]],na.rm = TRUE)
}

pollutantmean(directory<-"C:/Users/FGB3043/Desktop/Coursera/specdata/",pollutant = "nitrate",id=23)


completesummary <- function (directory, id=1:332) {
  directory<-"C:/Users/FGB3043/Desktop/Coursera/specdata/"
  data1<-data.frame()
  for(i in id){
    pollutant.data <- read.csv(paste(directory, formatC(i, width=3, flag="0"), ".csv", sep=""))
    pollutant.data$complete.flag<- is.na(pollutant.data$sulfate)==FALSE & is.na(pollutant.data$nitrate)==FALSE
    complete.data<- data.frame(i,sum(pollutant.data$complete.flag))
    data1<-rbind(data1,complete.data)
  }
  data1
}  

completesummary(directory<-"C:/Users/FGB3043/Desktop/Coursera/specdata/",3)

