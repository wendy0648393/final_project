here::i_am("code/03_models.R")

data<-readRDS(
  file= here::here("output/dataclean.rds")
)

library(gtsummary)

mod<-glm(hgb~ hosp+age+sex+race+region+los,
         data=data)

#summary table
primary_table<-tbl_regression(mod) |>
  add_global_p()

#logistic model
binary_mod <-glm(
  I(hgb>=11)~ hosp+age+sex+race+region+los,
  data=data,
  family=binomial()
)

#summary table 
secondary_table<-tbl_regression(binary_mod, exponentiate=TRUE) |>
  add_global_p()

both_models <-list(
  primary=mod,
  secondary= binary_mod
)
saveRDS(
  both_models,
  file= here::here("output/both_models.rds")
)

both_regression_tables<-list(
  primary=primary_table,
  secondary=secondary_table
)

saveRDS(
  both_regression_tables,
  file= here::here("output/both_tables.rds")
)