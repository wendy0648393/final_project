FROM --platform=linux/amd64 rocker/tidyverse AS base 
RUN apt-get update && apt-get install -y pandoc
RUN apt-get install -y vim

RUN mkdir /final_project
WORKDIR /final_project

RUN mkdir code
RUN mkdir output

COPY code code
COPY Makefile .
COPY datasim.csv .
COPY Untitled.Rmd .

COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN Rscript -e "renv::restore(prompt=FALSE)"
RUN mkdir final_report

CMD make && mv final_report.html final_report 