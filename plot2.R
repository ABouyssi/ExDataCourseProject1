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

#plot 2
png(filename = "plot2.png", width = 480, height = 480);

hpc_gap <- as.numeric(as.vector(hpc$Global_active_power));
par(mar = c(3,4,2,1));
par(cex.axis = .7);
par(cex.lab = .8);
par(cex.main = .8);
plot(hpc_gap, xlab  = "" , ylab = "Global Active Power (kilowatts)", type = "l", xaxt = "n", yaxt = "n");
axis(1,at = c(0:2)*24*60, labels = c("Thu", "Fri", "Sat"));
axis(2,at = c(0:3)*2);

dev.off();