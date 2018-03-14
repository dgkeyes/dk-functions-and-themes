install.packages("extrafont")
library(extrafont)


# Define pallette (gray, green, blue, red)

dkpallette <- c("#a9a9a9", "#5c9134", "#ffffff","#2667a7", "#c63320")
dkpallette2 <- c("#a9a9a9", "#5c9134", "#a9a9a9","#2667a7", "#c63320")



# Import fonts

font_import(pattern="Montserrat")

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
