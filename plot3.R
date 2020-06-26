#Reading Data:
DSet=read.table("data/household_power_consumption.txt",header = TRUE,sep=";",
                na.strings = "?")

#Convert: Date time format
DSet$Date_Time=strptime(paste(DSet$Date,DSet$Time),format = "%d/%m/%Y %H:%M:%S")

DSet$Date=as.Date(DSet$Date,format="%d/%m/%Y")

#Subsetting
Energy=DSet[(DSet$Date==as.Date("2007-02-01") | DSet$Date==as.Date("2007-02-02") ),]

#Plot 3
png(filename="plot3.png")
plot(Energy$Date_Time,Energy$Sub_metering_1,type="l",xlab="",
     ylab="Energy sub metering")
lines(Energy$Date_Time,Energy$Sub_metering_2,col="red")
lines(Energy$Date_Time,Energy$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_mettering_1", "Sub_mettering_2",
                              "Sub_mettering_3"),lwd=1,
       col=c("black","red","blue"))
dev.off()