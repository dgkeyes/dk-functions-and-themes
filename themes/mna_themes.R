#### Themes ####

mna.red <- "#F05356"
mna.red.light <- "#F68689"
mna.blue <- "#2BAADF"
mna.blue.light <- "#94D7EE"
mna.green <- "#BFD958"
mna.dark.gray <- "#545454"
mna.medium.gray <- "#a8a8a8"
mna.light.gray <- "#eeeeee"

mna.text.size <- 14

# library(extrafont)
# font_import(pattern = "Arial")
# loadfonts()


mna.base.theme <- theme(
     panel.grid.minor = element_blank(),
     panel.background = element_rect(fill = "transparent",colour = NA),
     plot.background = element_rect(fill = "transparent",colour = NA),
     text = element_text(color = mna.dark.gray),
     axis.text = element_text(color = mna.dark.gray),
     axis.title = element_blank(),
     axis.ticks = element_blank(),
     panel.grid.major = element_line(color = mna.light.gray)
)


mna.bar.chart.theme <- mna.base.theme + theme(
     axis.text.x = element_text(color = mna.medium.gray),
     panel.grid.major.y = element_blank(),
     # panel.grid.major.x = element_blank(),
     strip.background = element_blank(),
     strip.text = element_text(face = "bold"),
     legend.position = "none"
)

mna.bar.chart.theme.faceted <- mna.base.theme + theme(
     strip.background = element_blank(),
     # strip.text = element_text(size = mna.text.size),
     legend.position = "none",
     panel.grid.major.y = element_blank(),
     # panel.grid.major.x = element_blank(),
     # axis.text.y = element_blank(),
     # axis.text.x = element_blank(),
     panel.spacing = unit(2, "lines")
)

mna.line.chart.theme <- mna.base.theme + theme(
     axis.text.x = element_text(color = mna.medium.gray),
     # axis.text.y = element_blank(),
     # panel.grid.major.y = element_blank(),
     panel.grid.major.x = element_blank(),
     strip.background = element_blank(),
     strip.text = element_text(face = "bold"),
     legend.position = "none"
)

mna.column.chart.theme <- mna.base.theme + theme(
     axis.text.y = element_blank(),
     panel.grid.major.y = element_blank(),
     panel.grid.major.x = element_blank()
)

mna.map.theme <- mna.base.theme + theme(
     axis.line = element_blank(),
     axis.line.y = element_blank(),
     axis.title.y = element_blank(),
     axis.title.x = element_blank(),
     axis.text.x = element_blank(),
     axis.text.y = element_blank(),
     axis.ticks = element_blank(),
     panel.grid = element_blank(),
     panel.border = element_blank(),
     panel.grid.major = element_blank()
)