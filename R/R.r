# Instalar paquetes si no están presentes
if (!requireNamespace("datasauRus", quietly = TRUE)) install.packages("datasauRus")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

library(ggplot2)
library(datasauRus)

datos_dots <- datasaurus_dozen[datasaurus_dozen$dataset == "dots", ]

modelo <- lm(y ~ x, data = datos_dots)
pendiente <- round(coef(modelo)[2], 3)
intercepto <- round(coef(modelo)[1], 3)

ggplot(datos_dots, aes(x = x, y = y)) +
  geom_point(aes(color = y), size = 2.5, alpha = 0.8) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "#ff007f",
    linewidth = 1.2,
    linetype = "dashed"
  ) +
  annotate(
    "text",
    x = 60,
    y = 80,
    label = paste("y =", intercepto, "+", pendiente, "* x"),
    color = "#ff007f",
    fontface = "italic",
    size = 4
  ) +
  theme_classic(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", color = "#333333", hjust = 0.5),
    panel.grid = element_blank()
  ) +
  scale_color_viridis_c(option = "plasma") +
  labs(
    title = "💫 Dataset 'dots' - línea de regresión personalizada",
    subtitle = "Visualización recreada con ggplot2",
    x = "Eje X",
    y = "Eje Y",
    color = "Valor de Y"
  )
