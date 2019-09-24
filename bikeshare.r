Bikeshare Project
========================================================
  
### Question 1: What are the majority Bikeshare in Chicago City?

library(ggplot2)

chi=read.csv('C://Users//jzhong//Documents//R//R_Project//chicago.csv')

head(chi)

summary(chi)

by(chi$Gender, chi$User.Type, summary)

qplot(x=Gender, data=subset(chi, !is.na(Gender), !is.na(User.Type)),
     xlab='Gender', ylab='Counts', main='Chicago Bikeshare Gender Histogram')+
facet_wrap(~User.Type)

### Question 2:What are the most busy month and stations in Washington Bikeshare?




wash=read.csv('C://Users//jzhong//Documents//R//R_Project//washington.csv')

head(wash)

summary(wash)

wash$Start.YearMonth=format(as.Date(wash$Start.Time),"%Y-%m")

qplot(x=Start.YearMonth, data=wash, 
      xlab='2017 - Month', ylab='Number of Rides', main='The number of rides per month in Washington BikeShare of 2017')

### Question 3:What are the earliest, most recent, most common year of birth in New York City dataset?

library(ggplot2)

ny=read.csv('C://Users//jzhong//Documents//R//R_Project//new_york_city.csv')

head(ny)

summary(ny)

by(ny$Birth.Year, ny$Gender, summary)

qplot(x=Birth.Year, data=subset(ny,!is.na(Birth.Year), !is.na(Gender)), binwidth=0.5,
      xlab='Birth Year', ylab='Counts', main='Birth Year Histogram by Gender')+
facet_wrap(~Gender)

system('python -m nbconvert Explore_bikeshare_data.ipynb')
