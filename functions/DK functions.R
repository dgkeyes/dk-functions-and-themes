library(tidyverse)

#### DK Summarize Categorical

dk.summarize.categorical <- function(dataset) {
     dataset <- dataset %>%
          gather() %>%
          group_by(key) %>%
          count(value) %>%
          filter(!is.na(value)) %>%
          ungroup() %>%
          set_names(c("item", "response", "number"))
     return(dataset)
}

usethis::use_git()

