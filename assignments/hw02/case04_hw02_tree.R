library(tidyverse)
library(ggtree)

# Read in the Newick tree
tree <- read.tree("case04_hw02_tree.nwk")

# Read in the metadata
metadata <- read_csv("case04_hw02_origins.csv", col_names = TRUE)

# Fill in Continent for each entry of Country
metadata$Continent <- countrycode(sourcevar = metadata$Country, origin = "country.name", destination = "continent")

# Add counts to the metadata summary
countries <- metadata %>%
  group_by(Continent,Country) %>%
  summarise(count = n()) 

# Plot the distribution
countries %>%
  ggplot(aes(x = reorder(Country,-count), y = count, label = count)) +
  geom_col(aes(fill = Continent)) +
  geom_text(nudge_y = 1) +
  theme_bw() +
  theme(axis.text.x = element_text(angle=90, hjust=0.95,vjust=0.2),
        text = element_text(size = 18),
        plot.title = element_text(hjust = 0.5)) +
  xlab("Country") +
  ylab("Number of Sequences") +
  ggtitle("Geographic Distrubtion of Sequences") 

# Save the plot
ggsave("case04_hw02_hist.png", device = "png", height = 8, width = 12, dpi = 300)

# Plot the tree
ggtree(tree) %<+% metadata + # Plot default tree
  geom_tiplab(aes(color=Country), size = 3.5) + # Label the tips with colour by country
  theme(legend.position = c(0.8,0.2), # Change the position of the legend to be in the bottom right
        text = element_text(size =18), # Increase overall font size
        plot.title = element_text(hjust = 0.5)) +  # Center the title
  geom_treescale() + # Show scale of branches
  guides(color=guide_legend(ncol=3)) + # Split the legend into three columns
  ggtitle("Zika Virus: Envelope Genes from Various Countries") +
  geom_hilight(node=168, fill = "green") # Highlight the internal node corresponding to our NA sequence

# Save the plots in png and pdf
ggsave("case04_hw02_tree.png", device = "png", width=50, height=30, units = "cm", dpi = 300)

ggsave("case04_hw02_tree.pdf", device = "pdf", width=50, height=30, units = "cm", dpi = 300)

# Plot the same tree as above, but as a cladogram for aesthetic purposes.
ggtree(tree, branch.length = "none") %<+% metadata + 
  geom_tiplab(aes(color=Country), size = 3.5) + 
  theme(legend.position = c(0.2,0.8),
        text = element_text(size =18),
        plot.title = element_text(hjust = 0.5)) + 
  guides(color=guide_legend(ncol=3)) +
  ggtitle("Zika Virus: Envelope Genes from Various Countries") +
  geom_hilight(node=168, fill = "green")

ggsave("case04_hw02_cladogram.png", device = "png", width=50, height=30, units = "cm", dpi = 300)

ggsave("case04_hw02_cladogram.pdf", device = "pdf", width=50, height=30, units = "cm", dpi = 300)
