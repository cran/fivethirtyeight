## ---- message=FALSE, warning=FALSE, echo=FALSE--------------------------------
library(fivethirtyeight)
library(ggplot2)
library(dplyr)
library(readr)
library(knitr)
library(tibble)
library(curl)

# Import master Google Sheet of all 538 data available here:
# https://docs.google.com/spreadsheets/d/1IMWAHNPIDzplafWW6AGnGyHmB1BMjohEw_V5HmT70Gs/edit#gid=840984416
datasets_master <- 
  "https://goo.gl/OT8iHa" %>% 
  read_csv() %>% 
  filter(!is.na(DATAFRAME_NAME)) %>% 
  transmute(
    `Data Frame Name` = DATAFRAME_NAME,
    `Article Title` = ARTICLE_TITLE,
    `Filed Under` = ARTICLE_FILED_UNDER,
    `Author 1` = ARTICLE_AUTHOR_1,
    `Author 2` = ARTICLE_AUTHOR_2,
    `Author 3` = ARTICLE_AUTHOR_3,
    `In fivethirtyeightdata?` = `IN FIVETHIRTYEIGHTDATA?`,
    Date = ARTICLE_DATE,
    URL = ARTICLE_URL
  ) %>% 
  mutate(
    `Filed Under` = ifelse(is.na(`Filed Under`), "", `Filed Under`),
    `Author 1` = ifelse(is.na(`Author 1`), "", `Author 1`),
    `Author 2` = ifelse(is.na(`Author 2`), "", `Author 2`),
    `Author 3` = ifelse(is.na(`Author 3`), "", `Author 3`)
  ) %>% 
  arrange(`Data Frame Name`)


# Pull all dataset names
all_datasets <-  datasets_master %>% 
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
    pull(Item) %>% 
    sort()
  
  # This should yield TRUE
  identical(all_fivethirtyeight_datasets, pkg_data_list)
}

## ---- message=FALSE, warning=FALSE, echo=FALSE--------------------------------
all_fivethirtyeightdata_datasets

## ---- eval = FALSE------------------------------------------------------------
#  library(fivethirtyeight)
#  library(fivethirtyeightdata)
#  senators

## ---- message=FALSE, warning=FALSE, echo=FALSE--------------------------------
datasets_master %>% 
  mutate(`Data Frame Name` = paste("`", `Data Frame Name`, "`", sep=""),
         `In fivethirtyeightdata?` = ifelse(is.na(`In fivethirtyeightdata?`), "", "Yes")) %>% 
  kable()

