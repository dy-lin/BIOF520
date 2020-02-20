library(tidytree)
library(tidyverse)
library(ggtree)
# library(ggrepel)


tree <- read.tree("case04_hw02_tree.nwk")

tree_tibble <- tidytree::as_tibble(tree)

metadata <- read_csv("case04_hw02_origins.csv", col_names = TRUE)

ggtree(tree) %<+% metadata + 
  geom_tiplab(aes(color=Country), size = 3.5) + 
  theme(legend.position = c(0.8,0.2),
        text = element_text(size =18),
        plot.title = element_text(hjust = 0.5)) + 
  geom_treescale() +
  guides(color=guide_legend(ncol=3)) +
  geom_cladelabel(node=49, label="top BLAST hit", colour = "red", fontsize = 4, offset=0.025, geom = "text") +
  ggtitle("Zika Virus: Envelope Genes from Various Countries")
 #  geom_text_repel(aes(label=node)) 
  # geom_cladelabel(node = 125, label = "Russia", offset = 0.08) +
  # geom_cladelabel(node = 140, label = "Senegal", offset = 0.08) +
# geom_cladelabel(node = 150, label = "Senegal", offset = 0.08) +
# ggtree(tree) + geom_tiplab(aes(fill=Country), colour = "black", geom="label")

ggsave("case04_hw02_tree.png", device = "png", width=50, height=30, units = "cm", dpi = 300)

ggsave("case04_hw02_tree.pdf", device = "pdf", width=50, height=30, units = "cm", dpi = 300)


