library(tidyverse)
library(scales)



# Summarize categorical ---------------------------------------------------

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



# Diverging stacked bar ---------------------------------------------------

dk_diverging_stacked_bar <- function(dataset) {
     
     dataset <- dataset %>%
          ungroup() %>%
          mutate(question = str_wrap(question, width = 35))
     
     ggplot(dataset, aes(x = question, y = n_inv, fill = response)) +
          geom_bar(stat = "identity") +
          coord_flip() +
          geom_text(aes(label = n),
                    hjust = 0) +
          mna.bar.chart.theme +
          theme(legend.position = "bottom",
                legend.title = element_blank()) +
          geom_hline(yintercept=0, color = mna.medium.gray) +
          scale_y_continuous(breaks = pretty_breaks())
}



# 100 percent stacked bar -------------------------------------------------

dk_100_stacked_bar <- function(dataset) {
     
     dataset <- dataset %>%
          ungroup() %>%
          mutate(question = str_wrap(question, width = 30))
     
     ggplot(dataset, aes(x = question, y = pct, fill = response)) +
          geom_bar(stat = "identity", position = position_stack(reverse = TRUE)) +
          coord_flip() +
          geom_text(data = filter(dataset, pct != 0),
                    aes(label = percent(round(pct, digits = 2))),
                    position = position_stack(vjust = .5, reverse = TRUE),
                    color = "white") +
          mna.bar.chart.theme +
          theme(legend.position = "bottom",
                legend.title = element_blank()) +
          scale_y_continuous(label = percent)
}



