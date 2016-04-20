workshopdata = as.data.frame(read.csv("~/Downloads/workshop_overview_shortname.csv"))

# Graph attendance of workshops over time. x axis is time, y is attendance. if possible,
# color of bars correspond to type of workshop (half day, two day, etc)

library(ggplot2)
library(scales)
# define variables for graph from data frame
workshopdata$name = factor(workshopdata$Workshop.Name, levels = workshopdata$Workshop.Name[order(workshopdata$Date)])
workshopdata$signups = as.numeric(workshopdata$Sign.ups.on.EventBrite)
workshopdata$Format = as.factor(workshopdata$Format)

plot <- ggplot(data=workshopdata, aes(x=name, y=signups, fill = Format)) +
  geom_bar(stat="identity") +
  theme(axis.text.x = element_text(angle = 70, hjust = 1))


plot <- plot + labs(title = "Workshop Attendance by Workshop in Chronological Order") + theme(legend.position = c(0.2, 0.75))
plot + labs(x = "Workshop Name", y = "Workshop Registrants") + guides(fill = guide_legend(keywidth = 1, keyheight = 0.5))