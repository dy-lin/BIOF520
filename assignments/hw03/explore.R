library(tidyverse)
library(ggtree)

data <-
  read_csv(
    "BIOF520/assignments/hw03/data/zombieOutbreak.csv",
    col_types = cols(
      ID = col_factor(),
      status = col_factor(),
      dateOfOnset = col_date(format = "%d-%b-%y"),
      dateOfExposureStart = col_date(format = "%d-%b-%y"),
      dateOfExposureEnd = col_date(format = "%d-%b-%y"),
      incubation = col_factor(),
      source = col_factor(),
      hospWard = col_factor(),
      exposureHousehold = col_factor(),
      exposureSharedMeal = col_factor(),
      exposureDroplet = col_factor(),
      exposureSex = col_factor(),
      exposureFaeces = col_factor(),
      exposureBite = col_factor(),
      Age = col_double(),
      Sex = col_factor(),
      Occupation = col_factor()
    )
  )

summary(data)

tree <- read.tree("BIOF520/assignments/hw03/data/zombieOutbreak_tree.newick")

ggtree(tree) %<+% data[-1,] +
  geom_tiplab(aes(color = hospWard)) +
  theme(legend.position = c(0.1,0.9))

ggtree(tree) %<+% data[-1,] +
  geom_tiplab(aes(color = source)) +
  theme(legend.position = c(0.2,0.9)) +
  guides(color=guide_legend(ncol=2))

table(data$hospWard)
table(data$source)
table(data$Occupation)
table(data$Age)

View(data)
