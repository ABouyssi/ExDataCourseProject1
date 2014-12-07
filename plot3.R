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

#plot 3
png(filename = "plot3.png", width = 480, height = 480);

hpc_sm1 <- as.double(as.vector(hpc$Sub_metering_1));
hpc_sm2 <- as.double(as.vector(hpc$Sub_metering_2));
hpc_sm3 <- as.double(as.vector(hpc$Sub_metering_3));
par(mar = c(2,4,1,1));
par(cex.axis = .7);
par(cex.lab = .8);
par(cex.main = .8);
y_range <- range(c(hpc_sm1, hpc_sm2, hpc_sm3));
plot(x = c(1:2880), y = hpc_sm1, xlab  = "" , ylab = "Energy sub metering", type = "l", xaxt = "n", yaxt = "n", ylim=y_range);
par(new = TRUE);
lines(x = c(1:2880), y = hpc_sm2, col = "red", ylim=y_range);
lines(x = c(1:2880), y = hpc_sm3, col = "blue", ylim=y_range);
axis(1,at = c(0:2)*24*60, labels = c("Thu", "Fri", "Sat"));
axis(2,at = c(0:3)*10);
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c(1,2,4), lty = 1, cex = .7, pt.cex = .9);

dev.off();