install.packages("ndtv")
install.packages("igraph")
install.packages("network")
install.packages("sna")



library(ndtv)
library(igraph)
library(network)
library(sna)

getwd()

nodes<-read.csv("Dataset1-Media-Example-NODES.csv", header = T, as.is=T)
links<-read.csv("Dataset1-Media-Example-EDGES.csv", header=T, as.is=T)

head(nodes)
head(links)
nrow(nodes); length(unique(nodes$id))
nrow(links); nrow(unique(links[,c("from","to")]))

links<-aggregate(links[,3], links[,-3], sum)
links<-links[order(links$from, links$to),]
colnames(links)[4]<-"weight"
rownames(links)<-NULL

#matrix
nodes2 <- read.csv("Dataset2-Media-User-Example-NODES.csv", header=T, as.is=T)
links2 <- read.csv("Dataset2-Media-User-Example-EDGES.csv", header=T, row.names=1)
#examine data
head(nodes2)
head(links2)

#link2 is an adjacency matrix for a two-mode network
links2<-as.matrix(links2)
dim(links2)
dim(nodes2)

#newtwork visualizationj with igraph

net<-graph.data.frame(links, nodes, directed=T)
net

E(net)
V(net)
E(net)$type
V(net)$media

net[1,]
net[5,7]

plot(net)

net<-simplify(net,remove.multiple=F, remove.loops=T)

plot(net,edge.arrow.size=.4, vertex.label=NA)

plot(x=1:10, y=rep(5,10), pch=19, cex=3, col="dark red")
points(x=1:10, y=rep(6,10), pch=19, cex=3, col="557799")
points(x=1:10, y=rep(4,10), pch=19, cex=3, col=rgb(.25, .5, .3))

startNum<-as.integer(1899)
endNum<-as.integer(2016)
diffNum<-(endNum-startNum)
help(plot)
plot(x=1899:2016, y=rep(5,diffNum),pch=19, cex=3, col="dark red")
plot()
