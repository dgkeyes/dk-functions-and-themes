library(captioner)
library(tidyverse)
library(readxl)
library(googlesheets)
library(janitor)
library(skimr)
library(lubridate)
library(flextable)
library(scales)
library(lettercase)


# Summarize categorical ---------------------------------------------------

dk_summarize_categorical <- function(dataset) {
     dataset <- dataset %>%
          gather() %>%
          group_by(key) %>%
          count(value) %>%
          # filter(!is.na(value)) %>%
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




# Propotions --------------------------------------------------------------

dk_proportions <- function(n) {
     temp <- round(prop.table(n), digits = 2)
}

dk_delete_mna_extras <- function(item) {
     item <- str_replace(item, "\\[", "")
     item <- str_replace(item, "\\]", "")
     item <- str_replace(item, "\\.", "")
}

# Delete stuff in MNA survey questions ------------------------------------

dk_delete_mna_extras <- function(item) {
     item <- str_replace(item, "\\[", "")
     item <- str_replace(item, "\\]", "")
     item <- str_replace(item, "\\.", "")
}





# Word table --------------------------------------------------------------


dk_word_table <- function(df) {
     df %>%
          set_names(c('Response', 'Number')) %>%
          regulartable %>%
          width(width = 3) %>%
          theme_zebra() %>%
          align(align = "left", part = 'all') %>%
          fontsize(size = 11) %>%
          padding(padding = 10, part = 'all')
}


# Simple bar charts -------------------------------------------------------


dk_bar_chart_n <- function(df, lower_limit, upper_limit) {
     df %>%
          set_names(c("item", "n")) %>%
          ggplot(aes(x = reorder(item, n), 
                     y = n)) +
          geom_col(fill = mna.blue) +
          geom_text(aes(label = n),
                    color = 'white',
                    hjust = 1.65) +
          scale_y_continuous(limits = c(lower_limit, upper_limit),
                             breaks = pretty_breaks()) +
          coord_flip() +
          mna.bar.chart.theme
     
}


dk_bar_chart_pct <- function(df) {
     df %>%
          ggplot(aes(x = item, 
                     y = pct)) +
          geom_col(fill = mna.blue) +
          geom_text(aes(label = percent(pct)),
                    color = 'white',
                    hjust = 1.25) +
          scale_y_continuous(limits = c(0, 1),
                             breaks = pretty_breaks(),
                             labels = percent) +
          coord_flip() +
          mna.bar.chart.theme
     
}



# Sentence case -----------------------------------------------------------

# https://stackoverflow.com/questions/22976472/capitalize-the-first-word-of-a-sentence-regex-gsub-gregexpr

dk_sentence_case <- function(x) {
     
     gsub("([^.!?\\s])([^.!?]*(?:[.!?](?!['\"]?\\s|$)[^.!?]*)*[.!?]?['\"]?)(?=\\s|$)", 
          "\\U\\1\\E\\2", 
          x, 
          perl=T, 
          useBytes = F)
}


# Make bulleted list ------------------------------------------------------

dk_bulleted_list <- function(string.list) {
     
     cat(paste('-', string.list), sep = '\n')
     
}

# Prep quotes -------------------------------------------------------------

dk_prep_quotes <- function(x) {
     x %>%
          set_names('response') %>%
          filter(!is.na(response)) %>%
          filter(str_length(response) > 4) %>%
          # filter(!str_detect(response, "Nothing")) %>%
          arrange(-str_length(response)) %>%
          pull(response) %>%
          str_collapse_whitespace() %>%
          dk_sentence_case() %>%
          dk_bulleted_list()
     
}


# Summarize N and pct -----------------------------------------------------

dk_n_pct <- function(df, ...) {
     janitor::tabyl(df, ...) %>%
          janitor::adorn_pct_formatting(digits = 2) %>%
          janitor::adorn_totals("row")
}


