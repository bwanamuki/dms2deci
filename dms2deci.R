#**********************************************************
#Script to convert dms to decimal degrees coordinates
#Author - FAUSTUS REGINALD
#bwanamuki@hotmail.com
#**********************************************************

library(tidyr)
library(dplyr)
library(tidyverse)

#import the csv file
dd=data.frame(read.csv("C:/Users/MUKI/Downloads/Coordinates.csv"))

#Create a new data frame df with Lat and long columns + new columns
df<-dd %>% 
  select(Lat,Long) %>% 
  add_column(Deci_lat='', Deci_long='')

#For Latitude
for(i in 1:nrow(df)){
  m<-data.frame(separate(dd,Lat,c("D","M","S","P"), '[°\'"]+'))
  df[i,3]<-(as.numeric(m[i,2]))+((as.numeric(m[i,3]))/60)+((as.numeric(m[i,4]))/3600)
  if(m[i,5]==" S")
    df[i,3]=(as.numeric(df[i,3])*-1)
  else
    df[i,3]=(as.numeric(df[i,3]))
}

#For Longitudes
for(i in 1:nrow(df)){
  m<-data.frame(separate(dd,Long,c("D","M","S","P"), '[°\'"]+'))
  df[i,4]<-(as.numeric(m[i,3]))+((as.numeric(m[i,4]))/60)+((as.numeric(m[i,5]))/3600)
  if(m[i,6]==" W")
    df[i,4]=(as.numeric(df[i,4])*-1)
  else
    df[i,4]=(as.numeric(df[i,4]))
}

#Saving to csv file
write.csv(df,"D:/dms2deci.csv", row.names=FALSE)










