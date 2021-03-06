install.packages("extrafont")
library(extrafont)


# Define pallette (gray, green, blue, red)

dkpallette <- c("#a9a9a9", "#5c9134", "#ffffff","#2667a7", "#c63320")
dkpallette2 <- c("#a9a9a9", "#5c9134", "#a9a9a9","#2667a7", "#c63320")



# Import fonts

# font_import(pattern="Montserrat")

# Define themes

dktheme <- theme(
  panel.background = element_rect(fill = "white"),
  plot.background = element_blank(),
  text = element_text(size=12, family="Montserrat"),
  title = element_text(size=12, family="Montserrat"),
  axis.title = element_blank(),
  axis.ticks = element_blank(),
  legend.position = "none"
)

dkmaptheme <- theme(
  axis.line = element_blank(),
  axis.line.y = element_blank(),
  axis.title.y = element_blank(),
  axis.title.x = element_blank(),
  axis.text.x = element_blank(),
  axis.text.y = element_blank(),
  axis.ticks = element_blank(),
  panel.grid = element_blank(),
  panel.border = element_blank()
)

dkbartheme <- dktheme + theme(
  axis.text.x = element_blank()
)



dkcolumntheme <- dktheme + theme(
  axis.text.y = element_blank()
)

dk_summarize_open_ended <- function(df) {
     responses <- df %>%
          select(contains(v)) %>%
          set_names("response") %>%
          filter(!is.na(response)) %>%
          mutate(response = str_trim(response)) %>%
          filter(!str_detect(response, fixed("n/a", ignore_case = TRUE))) %>%
          filter(!str_detect(response, fixed("No", ignore_case = TRUE))) %>%
          filter(!str_detect(response, fixed("None", ignore_case = TRUE))) %>%
          filter(!str_detect(response, fixed("Not sure", ignore_case = TRUE)))
     
     responses %>%
          kable("html", col.names = "Responses") %>%
          kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))
}

# dk_summarize_open_ended <- function(df, colnames) {
#      df %>%
#           kable("html", col.names = colnames) %>%
#           kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))
# }
