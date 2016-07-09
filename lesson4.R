#Day 2:
#  Challenges:
  
#  Calculate square root of 984 rounded to the second digit

#Execute the following function
sim.pi <- function(iterations = 1000) {
  # Generate two vectors for random points in unit circle
  x.pos <- runif(iterations, min=-1, max=1)
  y.pos <- runif(iterations, min=-1, max=1)
  # Test if draws are inside the unit circle
  draw.pos <- ifelse(x.pos^2 + y.pos^2 <= 1, TRUE, FALSE)
  draws.in <- length(which(draw.pos == TRUE))
  # Estimate Pi
  return(4*(draws.in/iterations))
}
#And run it with argument 1000000 report the results in this document


#sv https://s3-eu-west-1.amazonaws.com/pfigshare-u-files/4958788/some_file.c- use download.file() function, and read.csv() to read in the file into data/some_file.csv


download.file("https://s3-eu-west-1.amazonaws.com/pfigshare-u-files/4958788/some_file.csv",
              destfile = "data/some_file.csv")


some_file <- read.csv("~/data/some_file.csv", header = TRUE, sep = ';')
head(some_file)

class(some_file)


example_data <- data.frame(animal=c("dog", "cat", "sea cucumber", "sea urchin"),
                           feel=c("furry", "furry", "squishy", "spiny"),
                           weight=c(45, 8, 1.1, 0.8))
str(example_data)
example_data <- data.frame(animal=c("dog", "cat", "sea cucumber", "sea urchin"),
                           feel=c("furry", "furry", "squishy", "spiny"),
                           weight=c(45, 8, 1.1, 0.8), stringsAsFactors=FALSE)
str(example_data)

author_book <- data.frame(author_first=c("Charles", "Ernst", "Theodosius"),
                          author_last=c("Darwin", "Mayr", "Dobzhansky"),
                          year=c(1859, 1942, 1970))
str(author_book)


country_climate <- data.frame(country=c("Canada", "Panama", "South Africa", "Australia"),
                              climate=c("cold", "hot", "temperate", "hot/temperate"),
                              temperature=c(10, 30, 18, 15),
                              northern_hemisphere=c(TRUE, TRUE, FALSE, FALSE),
                              has_kangaroo=c(FALSE, FALSE, FALSE, 1))
dim(country_climate)
rownames(country_climate)
colnames(country_climate)
names(country_climate)

animals <- c("mouse", "rat", "dog", "cat")
animals[2]
animals[c(3,2)]
animals[2:4]
more_animals <- animals[c(1:3, 2:4)]
more_animals

seq(from = 1, to = 4, by = 4)
seq(50, by=5, length.out = 10) # length.out - returned vector length
seq(5, 10, 3)
temperature <- read.csv("data/temperature.csv")
head(temperature)
temperature[1, 7]
temperature[1, ] # first row
temperature[ , 8] # entire 8 column
temperature[ , "City"]
temperature[ , c("City", "Longitude", "Latitude")]
temperature$City[41009]
barplot(table(temperature$City))
table(temperature$City)


temperature_by_10 <- temperature[seq(from = 10, to = nrow(temperature), by = 10), ]
nrow(temperature_by_10)
head(temperature_by_10)
rownames(temperature_by_10)[1:10]
write.csv(x = temperature_by_10, file = "data/temperature_by_10.csv", row.names = FALSE)

animals == "rat"
which(animals == "rat")

animals[animals == "cat" & animals == "rat"] # returns nothing
animals[animals == "cat" | animals == "rat"] # returns both rat and cat
