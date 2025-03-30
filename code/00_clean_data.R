here::i_am("final_project/code/00_clean_data.R")
here::here("final_project/datasim.csv")
absolute_file_location<-here::here("final_project/datasim.csv")
data<-read.csv(absolute_file_location, header=TRUE)
head(data)

library(labelled)
library(gtsummary)
var_label(data)<-list(
  id="ID",
  age="Age(months)",
  region= "Census Region",
  sex= "Sex",
  race= "Race/Ethnicity",
  hgb= "Hemoglobin",
  los= "Length of Stay",
  hosp= "# of Hospitalizations"
)
data$hgb_levels <- ifelse(data$hgb < 11, "< 11", ">= 11")

saveRDS(
  data, 
  file = here::here("final_project/output/dataclean.rds")
)