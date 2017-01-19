install.packages("diagram")
install.packages("plotweb")


library(diagram)
library(plotweb)

par(mar=c(1,1,1,1))

openplotmat()
elpos<-coordinates(c(1,1,2,4))
fromto<-matrix(ncol=2, byrow=TRUE,
               data=c(1,2,2,3,2,4,4,7,4,8))
nr<-nrow(fromto)
arrpos<-matrix(ncol=2, nrow=nr)
for(i in 1:nr)
  arrpos[i,]<-straightarrow (to=elpos[fromto[i,2], ],
                             from = elpos[fromto[i, 1], ],
                             lwd = 2, arr.pos= 0.6, arr.length=0.5)

textellipse(elpos[1,], 0.05, lab="start", box.col="green",
            shadow.col="darkgreen", shadow.size=0.005, cex=1.5)

textrect(elpos[2,], 0.15, 0.05, lab="found term?", box.col="blue",
         shadow.col="darkblue", shadow.size=0.005, cex=1.5)
textrect(elpos[4,], 0.15, 0.04, lab="related?", box.col="blue",
         shadow.col="darkblue", shadow.size=0.005, cex=1.5)
textellipse(elpos[3,], 0.05, 0.05, lab=c("other","term"), box.col="orange",
            shadow.col="red", shadow.size=0.005, cex=1.5 )
textellipse(elpos[7,], 0.05, 0.05, lab=c("make","a link"), box.col="orange",
            shadow.col="red", shadow.size=0.005, cex=1.5)
textellipse(elpos[8,], 0.05, 0.05, lab=c("new", "article"), box.col="orange",
            shadow.col="red", shadow.size=0.005, cex=1.5)

openplotmat(main="textbox shapes")
rx<-0.1
ry<-0.05
pos<-coordinates(c(1,1,1,1,1,1,1,1), mx=-0.2)
textdiamond(mid=pos[1,], rad=rx, rady=ry, lab=LETTERS[1],
            cex=2, shadow.col="lightblue")
