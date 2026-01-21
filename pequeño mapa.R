library(sf)
library(ggplot2)
library(dplyr)

getwd()

departamentos_cba <- st_read("C:/Users/20309017006/Downloads/departamentos/departamentos.shp") |>
  st_transform(4326)

names(departamentos_cba)


# Dataframe con la cantidad de empresas por departamento (ejemplo)
alumnos_por_depto <- data.frame(
  departamento = c("CALAMUCHITA", "CAPITAL", "COL\xd3N", "CRUZ DEL EJE", "GENERAL ROCA", "GRAL. SAN MART\xcdN", "ISCHIL\xcdN", "JU\xc1REZ CELMAN", "MARCOS JUAREZ",  "PTE. ROQUE SAENZ PE\xd1A", "PUNILLA",
                   "R\xcdO CUARTO", "R\xcdO PRIMERO", "R\xcdO SECO", "R\xcdO SEGUNDO", "SAN ALBERTO", "SAN JAVIER", "SAN JUSTO", "SANTA MAR\xcdA", "SOBREMONTE", "TERCERO ARRIBA", "TOTORAL", "TULUMBA", "UNI\xd3N"),
  cantidad_alumnos = c(623, 19147, 688, 425, 14, 2317, 76, 413, 477, 0, 1538, 1421, 305, 0, 565, 428, 1053, 1644, 170, 0, 1033, 44, 0, 926)
)

# Unir la data de empresas al shapefile
departamentos_cba <- departamentos_cba %>%
  left_join(alumnos_por_depto, by = c("nombre" = "departamento")) 
# Ajustá el nombre de la columna para que coincida con la de tu shapefile

# Ahora plotear con ggplot2
ggplot(data = departamentos_cba) +
  geom_sf(aes(fill = cantidad_alumnos), color = "black", size = 0.3) +
  scale_fill_gradient(low = "moccasin", high = "darkorange", na.value = "grey90", name = "Cantidad de alumnos") +
  theme_minimal() +
  labs(title = "Cantidad de alumnos por Departamento",
       subtitle = "Provincia de Córdoba") +
  theme(legend.position = "right")

library(sf)

departamentos_cba <- st_read()

departamentos_cba
names(departamentos_cba)




