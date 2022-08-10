library(ggplot2)
library(grid)
library(gridExtra) 
library(reshape2)

# Figure 2A
plotx <- read.table(plotx, "SourceData/Figure_2A_Source_Data.txt", sep = "\t", header = T)
p1 <- ggplot(plotx[which(plotx$Data == "SAMPLE_NUM"),], aes(Tissue, Number, fill = Tissue))+
  geom_bar(stat = "identity")+
  coord_flip() +
  scale_y_reverse(limits=c(max(plotx$Number),0)) +
  xlab("Sample Number")+
  geom_text(aes(label = Number, col = Tissue), hjust = 1.2)

p2 <- ggplot(plotx[which(plotx$Data == "Chosen_srQTL"),], aes(Tissue, Number, fill = Tissue))+
  geom_bar(stat = "identity")+
  coord_flip() +
  scale_y_continuous(limits=c(0,max(plotx$Number))) +
  xlab("irQTL Number")+
  geom_text(aes(label = Number, col = Tissue), hjust = -0.2)

# Figure 2B
x <- read.table("SourceData/Figure_2B_Source_Data.txt", sep = "\t", header = T)
p1 <- ggplot(x, aes(Tss_Distance, TISSUE, color = TISSUE, fill = TISSUE))+
  geom_tile()+
  theme_classic()+
  scale_color_manual(values = ccols)+
  scale_y_discrete(limits=rev)+NoLegend()+
  xlab("TSS Distance")+
  ylab("")

p2 <- ggplot(x, aes(Tss_Distance, TISSUE, fill = TISSUE))+
  geom_density_ridges(color = "black")+
  theme_classic()+
  scale_fill_manual(values = ccols)+
  scale_y_discrete(limits=rev)+NoLegend()+
  xlab("TSS Distance")+
  ylab("")

# Figure 2C
x <- read.table("SourceData/Figure_2C_Source_Data.txt", sep = "\t", header = T)
p1 <- ggplot(x, aes(tss_distance, TISSUE, color = TISSUE, fill = TISSUE))+
  geom_tile(size = 0.01)+
  theme_classic()+
  scale_color_manual(values = ccols)+
  scale_y_discrete(limits=rev)+NoLegend()+
  xlab("TSS Distance")+
  ylab("")

p2 <- ggplot(x, aes(tss_distance, TISSUE, fill = TISSUE))+
  geom_density_ridges(color = "black")+
  theme_classic()+
  scale_fill_manual(values = ccols)+
  scale_y_discrete(limits=rev)+NoLegend()+
  xlab("TSS Distance")+
  ylab("")
