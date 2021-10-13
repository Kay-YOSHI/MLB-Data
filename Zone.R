#--------------------------------------------------------------------------------#
# Visualize the variable "zone"
#--------------------------------------------------------------------------------#

# Install packages
library(data.table)
library(dplyr)
library(ggplot2)

set.seed(0)

# Load the data
mlb2015 = fread("mlb_sc_2015.csv")
mlb2016 = fread("mlb_sc_2016.csv")
mlb2017 = fread("mlb_sc_2017.csv")
mlb2018 = fread("mlb_sc_2018.csv")
mlb2019 = fread("mlb_sc_2019.csv")

# Combine the data
mlb1519 = bind_rows(list(mlb2015, mlb2016, mlb2017, mlb2018, mlb2019)) %>% as_tibble()
attach(mlb1519)

# Strike zone
#----------------------------------------------

# Check min and max value of plate_x and plate_z by zone
mlb1519 %>% 
  group_by(zone) %>% 
  summarize(
  	min_px = min(plate_x), 
  	max_px = max(plate_x), 
  	min_pz = min(plate_z), 
  	max_pz = max(plate_z))

# Check mean(sz_top) and mean(sz_bot)
summary(sz_top)
summary(sz_bot)

# Draw boundaries in strike zone
strike_zone = data.frame(
	z = factor(c(7, 4, 1, 8, 5, 2, 9, 6, 3)), 
	left = c(-0.83, -0.83, -0.83, -0.28, -0.28, -0.28, 0.28, 0.28, 0.28),
	right = c(-0.28, -0.28, -0.28, 0.28, 0.28, 0.28, 0.83, 0.83, 0.83),
	bot = c(1.58, 2.20, 2.82, 1.58, 2.20, 2.82, 1.58, 2.20, 2.82),
	top = c(2.20, 2.82, 3.43, 2.20, 2.82, 3.43, 2.20, 2.82, 3.43)
)

# Draw boundaries in ball zone
ball_zone_11_12 = data.frame(x = c(0, 0), z = c(3.43, 5.0)) # Boundary b/w zone 11 and 12
ball_zone_13_14 = data.frame(x = c(0, 0), z = c(1.58, 0.0)) # Boundary b/w zone 13 and 14
ball_zone_11_13 = data.frame(x = c(-0.83, -3), z = c(2.51, 2.51)) # Boundary b/w zone 11 and 13
ball_zone_12_14 = data.frame(x = c(0.83, 3), z = c(2.51, 2.51)) # Boundary b/w zone 11 and 12

# Visualize 
randsamp = mlb1519 %>% sample_n(10000)
ggplot() + 
  # Axis labels
  xlim(-4, 4) + xlab("Horizontal location (ft.)") + 
  ylim(0, 5) + ylab("Vertical location (ft.)") + 
  theme_bw() + 
  # Pitch distribution colored by zone
  geom_point(data = randsamp, aes(x = plate_x, y = plate_z, color = factor(zone))) + 
  labs(color = "Zone") + 
  # Boundaries in strike zone
  geom_rect(data = strike_zone, aes(xmin = left, xmax = right, ymin = bot, ymax = top), fill = NA, color = "black") + 
  # Zone No. in strike zone
  geom_text(data = strike_zone, aes(x = left + (right - left)/2, y = bot + (top - bot)/2, label = z), size = 7, fontface = 2, color = I("grey20")) + 
  # Boundaries in ball zone
  geom_path(data = ball_zone_11_12, aes(x = x, y = z)) + 
  geom_path(data = ball_zone_13_14, aes(x = x, y = z)) + 
  geom_path(data = ball_zone_11_13, aes(x = x, y = z)) + 
  geom_path(data = ball_zone_12_14, aes(x = x, y = z)) + 
  # Zone No. in ball zone
  annotate("text", x = -1.2, y = 3.7, label = "11", size = 7, fontface = 2, color = I("grey20")) + 
  annotate("text", x = 1.2, y = 3.7, label = "12", size = 7, fontface = 2, color = I("grey20")) + 
  annotate("text", x = -1.2, y = 1.3, label = "13", size = 7, fontface = 2, color = I("grey20")) + 
  annotate("text", x = 1.2, y = 1.3, label = "14", size = 7, fontface = 2, color = I("grey20")) + 
  coord_equal()
