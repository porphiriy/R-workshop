weight_kg <- 55
weight_lb <- weight_kg * 2.2
weight_kg <- 100

mass <- 47.5            # mass?
age  <- 122             # age?
mass <- mass * 2.0      # mass?
age  <- age - 20        # age?
mass_index <- mass/age

# vectors in R
weights <- c(50, 60, 65, 82)
length(weights)
class(weights)
str(weights)
c(weights, 5)
weights <- c(5, weights)

animals <- c("mouse", "rat", "dog")

## We’ve seen that atomic vectors can be of type character, numeric, integer, and
## logical. But what happens if we try to mix these types in a single
## vector?

## What will happen in each of these examples? (hint: use `class()` to
## check the data type of your object)
num_char <- c(1, 2, 3, 'a')
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c('a', 'b', 'c', TRUE)
tricky <- c(1, 2, 3, '4')

## Why do you think it happens?

## Can you draw a diagram that represents the hierarchy of the data
## types?

weights <- c(2, 4, 4, NA, 6)
mean(weights)
mean(weights, na.rm = T)
max(weights, na.rm = T)

na.omit(weights)

