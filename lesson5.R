library(dplyr)
temperature <- read.csv("data/temperature.csv")

temperature <- temperature %>% mutate(AverageTemperatureCelsius = (AverageTemperatureFahr-32)*(5/9))

temperature %>%
  select(year, City, Country, AverageTemperatureFahr) %>%
  filter(year < 1800) %>%
  filter(City == "Lvov")

# Using pipes, subset the data to include measurements collected after 2011, 
# and retain the columns year, City, and Latitudefilter(City == "Lvov")

temperature %>% filter(year > 2011) %>% select(year, City, Latitude)

 temperature %>%
  filter(!is.na(AverageTemperatureFahr)) %>%
  mutate(AverageTemperatureCelsius = (AverageTemperatureFahr-32)*(5/9)) %>%
  head

# Create a new dataframe from the temperature data that meets the following 
# criteria: contains only thecountry_id,City, year columns and a column that 
# contains values that are half the AverageTemperatureCelsiusvalues 
# (e.g. a new column AverageTemperatureCelsius_half).
# In this AverageTemperatureCelsius_half column, there are no NA values and all
# values are < -7.

temperature %>% 
  mutate(AverageTemperatureCelsius = (AverageTemperatureFahr-32)*(5/9),
         AverageTemperatureCelsius_half = AverageTemperatureCelsius / 2) %>% 
  filter(!(is.na(AverageTemperatureCelsius_half)) & AverageTemperatureCelsius_half < -7) %>%
  select(country_id, City, year, AverageTemperatureFahr) %>% 
  head

temperature %>% 
  group_by(Country) %>% 
  tally #call n or sum(n) depending on whether you're tallying for the first time, or re-tallying

temperature %>%
  filter(!is.na(Country)) %>%
  group_by(Country, City) %>%
  summarize(mean_temperature = round(mean(AverageTemperatureCelsius, na.rm = TRUE)),
            min_temperature = round(min(AverageTemperatureCelsius, na.rm = TRUE)))

