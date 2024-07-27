library(reshape2)
library(ggplot2)

aaa<-read.table("7778.txt",row.names = 1, stringsAsFactors = FALSE, check.names = FALSE)

aaa$Taxa <- factor(rownames(aaa), levels = rev(rownames(aaa)))
aaa <- melt(aaa, id = 'Taxa')
group <- read.delim('group.txt', sep = '\t', stringsAsFactors = FALSE)
names(group)[1] <- 'variable'
aaa <- merge(aaa, group, by = 'variable')
p <- ggplot(aaa, aes(variable, value, fill = Taxa)) +
  geom_col(position = 'stack', width = 0.8) +theme_bw()+
  facet_wrap(~group, scales = 'free_x', ncol = 2) +
  scale_fill_manual(values =  rev(c('#FB8072', '#8DD3C7', '#FFFFB3','#BEBADA' ,'#80B1D3', '#FDB462', '#B3DE69', '#FCCDE5', '#BC80BD', '#CCEBC5', '#d1d1d1'))) +
  labs(x = "Sample", y = "Relative proportion") + 
  theme(axis.text.x=element_blank(),axis.ticks.x=element_blank(),
        axis.title = element_text(face = "bold"),plot.title = element_text(face = "bold"),
        legend.title = element_text(face = "bold"))
p+x11(width=10.5,height=5.5)
help("geom_col")
