library(janitor)
library(readxl)
library(tidyverse)
library(dplyr)

getwd()
## pagina a descargarhttps://www.argentina.gob.ar/sites/default/files/ejecuciones_presupuestarias_apnf_2024_-_trim_iv.xls
https://www.argentina.gob.ar/sites/default/files/ejecuciones_presupuestarias_apnf_2011_-_trim._iv.xls


url_1 <- "https://www.argentina.gob.ar/sites/default/files/ejecuciones_presupuestarias_apnf_"
#url_2 <- "/3trim.xls"
url_2 <- "_-_trim._iv.xls"

anios <- 2011:2022

links <- paste0(url_1, anios, url_2)

rango <- "A9:Z57"


lista_output <-  list()

for(i in seq_along(links)) {
  temp <- tempfile(fileext = ".xls")
  download.file(links[i], temp, mode="wb")
  data <- read_excel(temp, range=rango)
  unlink(temp)
  data <- data %>% 
    filter(if_all(.cols=everything(),
                  ~!is.na(.))) %>% 
    janitor::clean_names()
  
  lista_output[[i]] <- data
}

names(lista_output) <- paste0("anio_", anios)

require(openxlsx)

write.xlsx(lista_output, file = "2TAPNF2.xlsx")
#write.xlsx(lista_output, file = "writeXLSX3.xlsx")


