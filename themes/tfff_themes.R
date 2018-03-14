#### Packages ####
library(extrafont)
library(ggplot2)



#### Define colors ####

tfff.dark.green <- "#265142"
tfff.light.green <- "#B5CC8E"
tfff.orange <- "#e65100"
tfff.yellow <- "#FBC02D"
tfff.blue <- "#283593"
tfff.red <- "#B71C1C"
tfff.brown <- "#51261C"
tfff.dark.gray <- "#545454"
tfff.medium.gray <- "#a8a8a8"
tfff.light.gray <- "#eeeeee"

tfff.blues <- c("#1a237e", "#303f9f", "#3f51b5", "#7986cb", "#c5cae9" )
tfff.oranges <- c("#ffe0b2", "#ffb74d", "#fb8c00", "#e65100")


#### Misc ####

# tfff.base.size <- 2
# tfff.base.font.size <- 9
# tfff.point.size <- tfff.base.size * 10
# tfff.line.point.size <- tfff.base.size * 10
# tfff.stroke.size <- tfff.base.size * 1
# tfff.label.size <- tfff.base.size * 3



#### Import font ####

# font_import(pattern="Calibri")


#### Themes ####

tfff.base.theme <- theme(
     panel.grid.minor = element_blank(),
     panel.background = element_rect(fill = "transparent",colour = NA),
     plot.background = element_rect(fill = "transparent",colour = NA),
     text = element_text(color = tfff.dark.gray, 
                         family = "Calibri",
                         size = 10),
     title = element_text(family = "Calibri"),
     axis.text = element_text(color = tfff.dark.gray),
     axis.title = element_blank(),
     axis.ticks = element_blank(),
     panel.grid.major = element_line(color = tfff.light.gray),
     legend.position = "none",
     plot.margin = margin(-3, -3, -3, -3, "pt"),
     panel.margin = margin(-3, -3, -3, -3, "pt")
)

tfff.area.theme <- tfff.base.theme + theme (
     panel.grid.major.x = element_blank()
)

tfff.line.theme <- tfff.base.theme + theme (
     panel.grid.major.x = element_blank()
     )

tfff.line.theme.faceted <- tfff.area.theme + theme (
     panel.spacing = unit(1, "lines"),
     strip.background = element_rect(fill = "white"),
     panel.grid.major.x = element_blank(),
     strip.text = element_blank()
     # axis.text.x = element_blank()
)

tfff.bar.chart.theme <- tfff.base.theme + theme(
     axis.text.x = element_blank(),
     axis.text.y = element_blank(),
     panel.grid.major.x = element_blank(),
     panel.grid.major.y = element_blank()
)

tfff.column.chart.theme <- tfff.base.theme + theme(
     axis.text.y = element_blank(),
     axis.text.x = element_text(color = tfff.dark.gray),
     panel.grid.major.x = element_blank(),
     panel.grid.major.y = element_blank()
)

tfff.population.pyramid.theme <- tfff.base.theme + theme(
     axis.text.x = element_text(color = tfff.dark.gray),
     axis.text.y = element_blank(),
     panel.grid.major.x = element_line(color = tfff.light.gray),
     panel.grid.major.y = element_blank(),
     plot.margin = margin(3, 3, 3, 3, "pt"),
     panel.margin = margin(3, 3, 3, 3, "pt")
)

tfff.bar.chart.with.benchmark.theme <- tfff.base.theme + theme(
     axis.text.x = element_blank(),
     panel.grid.major.x = element_blank(),
     panel.grid.major.y = element_blank()
)

tfff.bar.chart.with.benchmark.theme.kready <- tfff.base.theme + theme(
     axis.text.x = element_blank(),
     panel.grid.major = element_blank()
)

tfff.100.bar.chart.theme <- tfff.bar.chart.theme + theme(
     panel.grid.major.x = element_blank(),
     panel.grid.major.y = element_blank(),
     # legend.position = "right",
     # legend.justification = "top",
     axis.text.x = element_blank(),
     axis.text.y = element_blank()
     
     
)

tfff.map.theme <- tfff.base.theme + theme(
     panel.grid.major.x = element_blank(),
     panel.grid.major.y = element_blank(),
     axis.text = element_blank(),
     legend.position = "none",
     legend.title = element_blank()
)
