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


###     SETS THE DEVICE TO COPY TO PNG
png("plot1.png",width=480,height=480)

#####   DRAWS THE HISTOGRAM
x<-as.numeric(hp$Global_active_power)
hist(x,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

######  RESTORES DEFAULT DEVICE
dev.off()  #Close the pdf file device
