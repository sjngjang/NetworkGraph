#define the cars vector with 5 values
cars<-c (1,3,6,4,9)
plot(cars)

#annotations (axis labels) so we can specify them ourself
plot(cars, type="o", col="blue", ylim=g_range, axes=F, ann=F)
title(main="autos", col.main="red", font.main=4)

#make x axis using Mon-Fri labels
axis(1, at=1:5, lab=c("Mon", "Tue", "Wed", "Thu", "Fri"))

# Make y axis with horizontal labels that display ticks at
# every 4 marks. 4*0:g_range[2] is equivalent to c(0,4,8,12).
axis(2, las=1, at=4*0:g_range[2])

#create box around plot
box()

#graph trucs with red dashed line and square points

trucks<-c(2,5,4,5,12)
lines(trucks, type="o", pch=22, lty=2, col="red")

#Label  the x and y axes with dark green text
title(xlab="Days", col.lab=rgb(0,0.5,0))
title(ylab="Total", col.lab=rgb(0,0.5,0))

g_range<-range(0, cars, trucks)

#create a legend at (1, g_range[2]) that is slightly smaller
#(cex) and uses the same line colors and points used by
#the actual plots

legend(1, g_range[2], c("cars", "trucsk"), cex=0.8,
       col=c("blue","red"), pch=21:22,lty=1:2);


#---- practice 2
#read data
getwd()
auto_data<-read.csv("autos.csv", header=T)

#compute the largest y value used in the data (or we could
#just use range again)
max_y<-max(auto_data)

#define colors to be used for cars, trucsk, suvs
plot_clors<-c("blue", "red", "forestgreen")

#start PNG device driver to save output to figure.png
png(filename="figure.png", height=295, width=300, bg="white")

#graph auto using y axis that ranges from 0 to max_y
#Turn off aces and annotations Acxis labels) so we can
# specify them ourself
plot(auto_data$cars, type="o", col=plot_clors[1],
     ylim=c(0,max_y), axes=FALSE, ann=FALSE)

#make x axis using Mon-Fri labels
axis(1, at=1:5, lab=c("Mon","Tue", "Wed", "Thu","Fri"))

#make y axis with horizontal lables that display ticks at
#every 4 marks. 4*0:max_y is equivalent to c(0,4,8,12).

axis(2, las=1, at=4*0:max_y)

#create box around plot
box()

#graph trucks with red dashed line and squre points
lines(auto_data$trucks, type="o", pch=22, lty=2, col=plot_clors[2])

#graph suvs with green dotted line and diamond points
lines(auto_data$suvs, type="o", pch=23, lty=3, col=plot_clors[3])

#create a title with a red, bold/italic font
title(main="Autos", col.main="red", font.main=4)

#Label the x and y axes with dark green text
title(xlab="Days", col.lab=rgb(0,0.5,0))
title(ylab="Total", col.lab=rgb(0, 0.5,0))

#create a legend at (1, max_y) that is slightly smaller
#(cex) and uses the same line colors and points used by
#the actual plots
legend(1, max_y, names(auto_data), cex=0.7, col=plot_clors, pch=21:23, lty=1:3);

#turn off device driver( to flush output to png)
dev.off()
