## ---- message=FALSE, warning=FALSE, echo=FALSE--------------------------------
library(fivethirtyeight)
library(ggplot2)
library(dplyr)
library(readr)
library(knitr)
library(tibble)

# Pull all dataset names
all_datasets <- datasets_master %>% 
  pull(`Data Frame Name`) %>% 
  unique()


# Pull all fivethirtyeightdata dataset names
all_fivethirtyeightdata_datasets <- datasets_master %>% 
  filter(`In fivethirtyeightdata?` == "Y") %>% 
  pull(`Data Frame Name`) %>% 
  unique() %>% 
  sort()

if(FALSE){
  # Get data set names as listed in pkg
  pkg_data_list <- data(package = "fivethirtyeightdata")[["results"]] %>% 
    as_tibble() %>% 
    pull(Item) %>% 
    sort()
  
  # This should yield TRUE
  identical(all_fivethirtyeightdata_datasets, pkg_data_list)
}


# Pull all fivethirtyeight dataset names
all_fivethirtyeight_datasets <- datasets_master %>% 
  filter(is.na(`In fivethirtyeightdata?`)) %>% 
  pull(`Data Frame Name`) %>% 
  unique() %>% 
  sort()

if(FALSE){
  # Get data set names as listed in pkg
  pkg_data_list <- data(package = "fivethirtyeight")[["results"]] %>% 
    as_tibble() %>% 
    filter(Item != "datasets_master") %>% 
    pull(Item) %>% 
    sort()
  
  # This should yield TRUE
  identical(all_fivethirtyeight_datasets, pkg_data_list)
}

## ---- message=FALSE, warning=FALSE, echo=FALSE--------------------------------
all_fivethirtyeightdata_datasets

## ---- eval=FALSE--------------------------------------------------------------
#  install.packages('fivethirtyeightdata', repos = 'https://fivethirtyeightdata.github.io/drat/', type = 'source')

## ---- eval = FALSE------------------------------------------------------------
#  library(fivethirtyeight)
#  library(fivethirtyeightdata)
#  senators

## ---- message=FALSE, warning=FALSE, echo=FALSE--------------------------------
datasets_master %>% 
  mutate(`Data Frame Name` = paste("`", `Data Frame Name`, "`", sep=""),
         `In fivethirtyeightdata?` = ifelse(is.na(`In fivethirtyeightdata?`), "", "Yes")) %>% 
  kable()

