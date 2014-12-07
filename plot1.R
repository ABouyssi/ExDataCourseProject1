#load data
HPC <- read.table("household_power_consumption.txt", header = TRUE, sep=";");
hpc_Date <- as.Date(HPC$Date);
d_begin <- as.Date(c("01/02/2007"));
d_end <- as.Date(c("03/02/2007"));
i_begin <- match(d_begin, hpc_Date);
i_end <- match(d_end, hpc_Date) - 1;
hpc <- HPC[i_begin:i_end, 1:9];
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M")
hpc$DayOfWeek <- format(hpc$DateTime, "%a")

#plot 1
png(filename = "plot1.png", width = 480, height = 480);
hpc_gap <- as.numeric(as.vector(hpc$Global_active_power));
par(mar = c(4,4,1,1));
par(cex.axis = .7);
par(cex.lab = .8);
par(cex.main = .8);
hist(as.numeric(x = hpc_gap), breaks = c(0:15)/2,main="Global Active Power", col="orangered3", xlab="Global Active Power (kilowatts)");

dev.off();