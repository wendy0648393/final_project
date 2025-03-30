here::i_am("code/02_make_scatter.R")
data<-readRDS(
  file= here::here("output/dataclean.rds")
)

library(ggplot2)

scatterplot<-
ggplot(data, aes(x = hgb, y = hosp)) +
  geom_point() +
  geom_smooth(method = lm) +
  theme_bw()+
  xlab("Hemoglobin")+
  ylab("Hospitalizations")

ggsave(
  here::here("output/scatter.png"),
  plot=scatterplot,
  device="png"
)
