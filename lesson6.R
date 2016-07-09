library(ggplot2)
library(magrittr)
# modern dataframe manipulations
library(dplyr)
temperature_raw <- read.csv("data/temperature.csv")

temperature_complete <- temperature_raw %>%
  filter(!is.na(City)) %>%
  filter(!is.na(Country)) %>%        
  filter(!is.na(AverageTemperatureFahr)) %>%        
  filter(!is.na(AverageTemperatureUncertaintyFahr))

table(temperature_complete$day) # day with only one number

temperature_complete <- select(temperature_complete, -day) #all except day

temperature_complete <- temperature_complete %>%
  mutate(AverageTemperatureCelsius = (AverageTemperatureFahr-32)*(5/9)) %>%
  mutate(AverageTemperatureUncertaintyCelsius = (AverageTemperatureUncertaintyFahr-32)*(5/9))# get rid of `day` column

temperature_complete %>% head

temperature_complete$AverageTemperatureFahr <- NULL
temperature_complete$AverageTemperatureUncertaintyFahr <- NULL
head(temperature_complete)

plot(x = temperature_complete$year, 
     y = temperature_complete$AverageTemperatureCelsius)

ggplot(data = temperature_complete, 
       aes(x = year, y = AverageTemperatureCelsius)) + geom_point(alpha = 0.1, color = "green")

ggplot(data = temperature_complete, aes(x = country_id, y = AverageTemperatureCelsius)) +
  geom_point(alpha = 0.1, color = "green") +
  geom_boxplot()
# Boxes contain 50% of data
ggplot(data = temperature_complete, aes(x = country_id, y = AverageTemperatureCelsius)) +
  geom_jitter(alpha = 0.1, color = "green") +  #для плотности 
  geom_boxplot()

ggplot(data = temperature_complete, aes(x = country_id, y = AverageTemperatureCelsius)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.05, color = "green") 
  

ggplot(data = temperature_complete, aes(x = country_id, y = AverageTemperatureCelsius)) +
  geom_violin() + # point distribution
  geom_jitter(alpha = 0.05, color = "green") 


yearly_country_temp <- temperature_complete %>%
  group_by(year, Country) %>%
  summarise(countryAverage = mean(AverageTemperatureCelsius)) # year mean

ggplot(data = yearly_country_temp, aes(x = year, y = countryAverage)) + #all countries
  geom_line()

ggplot(data = yearly_country_temp, aes(x = year, y = countryAverage, group = Country, color = Country)) + #by countries
  geom_line()

#each line in seperate plot
ggplot(data = yearly_country_temp, aes(x = year, y = countryAverage, group = Country, color = Country)) + #by countries
  geom_line() +
  facet_wrap(~Country)

# + City
yearly_city_country_temp <- temperature_complete %>%
  group_by(year, City, Country) %>%
  summarise(cityAverage = mean(AverageTemperatureCelsius))

#Фасеты по странам, цвета - по городам
ggplot(data = yearly_city_country_temp, aes(x = year, y = cityAverage, group = City, color = City)) + #by countries
  geom_line() +
  facet_wrap(~Country) +
  theme_bw() # подписи

perfect_graph <- ggplot(data = yearly_city_country_temp, aes(x = year, y = cityAverage, group = City, color = City)) + #by countries
  geom_line() +
  facet_wrap(~Country) +
  theme_bw() 

ggsave(filename = "figures/perfect_graph.png", plot = perfect_graph,
       width = 640, height = 480)

