#Report rules (This is for docker)
final_report.html: code/04_render.R Untitled.Rmd output/table1.rds \
	output/scatter.png output/both_models.rds output/both_tables.rds
	Rscript code/04_render.R
	
output/dataclean.rds: code/00_clean_data.R datasim.csv
	Rscript code/00_clean_data.R
	
output/table1.rds: code/01_make_table1.R output/dataclean.rds
	Rscript code/01_make_table1.R

output/scatter.png: code/02_make_scatter.R output/dataclean.rds
	Rscript code/02_make_scatter.R
	
output/both_models.rds output/both_tables.rds&: \
	code/03_models.R output/dataclean.rds
	Rscript code/03_models.R

.PHONY: install
install: 
	Rscript -e "renv::restore(prompt=FALSE)"

#docker rules (run on local machine)
PROJECTFILES=Untitled.Rmd code/01_make_table1.R code/02_make_scatter.R code/03_models.R code/04_render.R Makefile
RENVFILES= rev.lock renv/activate.R renv/settings.json

#rule to build image 
project_image: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t image .
	touch $@
  
#rule to build report automatically in our container
final_report/final_report.html: project_image
	docker run -v "$$(pwd)/final_report":/final_project/final_report wendy0648393/image
