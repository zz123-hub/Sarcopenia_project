library(ggplot2)

aa = read.csv("12345.txt",header=T,sep="\t")
pp = ggplot(aa,aes(log2FoldChange,Pathway))
pp + geom_point()
pp + geom_point(aes(size=Abundance))
pbubble = pp + geom_point(aes(size=Abundance,color=Pvalue))
p2 = pbubble + scale_colour_gradient(low="grey",high="dodgerblue4")
p2+x11(width=10.5,height=5.5)
