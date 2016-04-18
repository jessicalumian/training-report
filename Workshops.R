data = as.data.frame(read.csv("~/Downloads/all_workshops_attendees"))

# Empty undefined empty
data$X = NULL
data$X.1 = NULL

data[data==""] = NA

data$Workshop = as.factor(data$Workshop)
data$Emails = as.factor(data$Emails)

data = na.omit(data)

# list of email addresses
rolodex = levels(data$Emails)
# number of workshops
ambition = array(NA, dim = length(rolodex))
# list of workshops (in one column)
expectation = array(NA, dim = length(rolodex))

attendance = data.frame(rolodex,ambition,expectation)

for (each in rolodex){
  nameslot = which(rolodex == each)
  # get indices of workshops
  tempindices = which(data$Emails == each)
  attendance[nameslot,2] = length(tempindices)
  
  # create column with workshops names as strings, starts empty
  workshop.list = ""
  for (each in tempindices) {
  	# formats with commas, spaces
    if (!nzchar(workshop.list)){
      workshop.list = paste(workshop.list, data$Workshop[each], sep = "")
    } else {
    workshop.list = paste(workshop.list, data$Workshop[each], sep = ", ")
    }  
  }
  workshop.list = paste(workshop.list, ".", sep = "")
  attendance[nameslot,3] = workshop.list
}

# save file
write.csv(attendance, file = "~/Desktop/Attendance.csv")