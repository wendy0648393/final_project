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
