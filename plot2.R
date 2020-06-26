#Reading Data:
DSet=read.table("data/household_power_consumption.txt",header = TRUE,sep=";",
                na.strings = "?")

#Convert: Date time format
DSet$Date_Time=strptime(paste(DSet$Date,DSet$Time),format = "%d/%m/%Y %H:%M:%S")

DSet$Date=as.Date(DSet$Date,format="%d/%m/%Y")

#Subsetting
Energy=DSet[(DSet$Date==as.Date("2007-02-01") | DSet$Date==as.Date("2007-02-02") ),]


#Plot 2
png(filename="plot2.png")
plot(Energy$Date_Time,Energy$Global_active_power,type="l",xlab="",
     ylab="Global Actve Power (Kilowatts)")
dev.off()

