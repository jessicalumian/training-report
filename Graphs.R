workshopdata = as.data.frame(read.csv("~/Downloads/workshop_overviews.csv"))

# Graph attendance of workshops over time. x axis is time, y is attendance. if possible,
# color of bars correspond to type of workshop (half day, two day, etc)

library(ggplot2)
# define variables for graph from data frame
workshopdata$date = as.factor(workshopdata$Date)
workshopdata$signups = as.numeric(workshopdata$Sign.ups.on.EventBrite)
workshopdata$Format = as.factor(workshopdata$Format)

plot <- ggplot(data=workshopdata, aes(x=date, y=signups, fill=Format)) +
  geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))

plot <- plot + labs(title = "Workshop Attendance Over Time")

plot + labs(x = "Workshop Date", y = "Workshop Registrants")