
#####   READS THE ENTIRE DATA FROM THE FILE
hpc <- read.table("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors=F)

#####   PREPARES THE LIST OF ROWS FOR THE DATE 2007-02-01
l1<-grep("^1/2/2007",hpc$Date)
hpc1<-hpc[l1,]

#####   PREPARES THE LIST OF ROWS FOR THE DATE 2007-02-02
l2<-grep("^2/2/2007",hpc$Date)
hpc2<-hpc[l2,]

#####   BINDS THE DATA TO GET THE DESIRED DATA SET
hp<-rbind(hpc1,hpc2)

#####   PREPARES DATA FOR PLOT
x<-as.numeric(hp$Sub_metering_1)
y<-as.numeric(hp$Sub_metering_2)
z<-as.numeric(hp$Sub_metering_3)

####    EXTRACTS TIME OUT THE DATA
dt<-paste(hp$Date,hp$Time)
dt1<-strptime(dt,"%d/%m/%Y %H:%M:%S")

###     SETS THE DEVICE TO COPY TO PNG
png("plot3.png",width=480,height=480)

####    ADDS THE PLOTS WITH LINE TYPE ="l" and LEGEND AND COLORS APPROPRIATELY
plot(dt1,x,ylab="Energy sub metering",xlab="",type="l")
points(dt1,y,type="l",col="red")
points(dt1,z,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

######  RESTORES DEFAULT DEVICE
dev.off()  #Close the pdf file device
