here::i_am("code/01_make_table1.R")

data<-readRDS(
  file= here::here("output/dataclean.rds")
)

library(gtsummary)
table1<- data |>
  select ("age","region","sex","los","hosp","hgb_levels") |>
  tbl_summary(by= hgb_levels) |>
  modify_spanning_header(c("stat_1","stat_2")~"**Hemoglobin Levels") |>
  add_overall() |>
  add_p()

saveRDS(
  table1, 
  file= here::here("output/table1.rds")
)