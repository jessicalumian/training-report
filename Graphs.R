workshopdata = as.data.frame(read.csv("~/Downloads/workshop_overviews.csv"))

# Graph attendance of workshops over time. x axis is time, y is attendance. if possible,
# color of bars correspond to type of workshop (half day, two day, etc)

library(ggplot2)
# define variables for graph from data frame
workshopdata$date = as.factor(workshopdata$Date)
workshopdata$signups = as.factor(workshopdata$Sign.ups.on.EventBrite)
workshopdata$format = as.factor(workshopdata$Format)

ggplot(data=workshopdata, aes(x=date, y=signups, fill=format)) +
  geom_bar(stat="identity")