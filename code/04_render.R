here::i_am("code/04_render.R")

library(rmarkdown)
report_filename<- paste0(
  "final_report",
  ".html"
)
render(
  "Untitled.Rmd",
  output_file= report_filename
)