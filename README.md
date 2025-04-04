#Instructions

Fork my repo first, then type 'git clone' to download your forked repo into your local computer 
Make sure you are in the right local project directory 
To render the final project analysis report, type 'make' in the terminal 

#Code Description
`code/00_clean_data.R`
- This code takes the simulated dataset 'datasim.csv' and cleaned it up 
- saves as dataclean.rds in output folder

`code/01_make_table1.R`
- This code creates the demographics table 
- saves as table1.rds in output folder

`code/02_make_scatter.R`
- This code creates a scatterplot for the relationship between hemoglobinlevels and number of hospitalizations
- saves as scatter.png in the output folder

`code/03_models.R`
- This code creates one linear and one regression model that examines how hemoglobin levels (continuous and categorical)
are affected by different exposure variables
- saves as two files" both_models.rds" and "both_tables.rds" in the output folder

`code04/render.R`
- This code uses the "Untitled.Rmd" file to render the report into an html file named "final_project.html"

#To synchronize package repository 
Type 'make install' in the terminal 