# Loading Libraries
library(tidyverse)
library(lfe) 
library(readxl)
library(ggplot2)
options(scipen=999) 


# Load the libraries
library(caTools) # For sample.split
library(caret)   # For confusionMatrix and potentially for createDataPartition
library(pROC)    # For ROC curve and AUC, if needed


# Setting the Path and Reading the Data
path <- "/Users/ishanlokhande/Downloads/DontGetKicked/training.csv"
df <- read_csv(path)

# Summary Statistics
glimpse(df)
summary(df)

# Exploratory Data Analysis

# Number of unique cars
num_cars <- n_distinct(df$RefId)
cat("Number of unique cars:", num_cars, "\n")

# Most popular car makes
top_makes <- df %>%
  count(Make) %>%
  arrange(desc(n)) %>%
  head(10)
print(top_makes)

# Visualizing top car makes
ggplot(top_makes, aes(x = reorder(Make, n), y = n)) +
  geom_bar(stat="identity") +
  coord_flip() +
  xlab("Make") +
  ylab("Count") +
  ggtitle("Top 10 Car Makes")

# Most common car sizes
common_sizes <- df %>%
  count(Size) %>%
  arrange(desc(n))
print(common_sizes)

# Visualizing car sizes
ggplot(common_sizes, aes(x = reorder(Size, n), y = n)) +
  geom_bar(stat="identity") +
  coord_flip() +
  xlab("Size") +
  ylab("Count") +
  ggtitle("Common Car Sizes")

# Average age of the cars
avg_age <- mean(df$VehicleAge, na.rm = TRUE)
cat("Average age of cars:", avg_age, "years\n")

# Average miles (odometer)
avg_miles <- mean(df$VehOdo, na.rm = TRUE)
cat("Average miles on cars:", avg_miles, "\n")

# Car origin
car_origin <- df %>%
  count(Nationality) %>%
  arrange(desc(n))
print(car_origin)

# Visualizing car origin
ggplot(car_origin, aes(x = reorder(Nationality, n), y = n)) +
  geom_bar(stat="identity") +
  coord_flip() +
  xlab("Nationality") +
  ylab("Count") +
  ggtitle("Car Origin")

# Correlation Analysis
cor_analysis <- function(x, y) {
  result <- cor.test(x, y, use = "complete.obs")
  return(c(correlation = result$estimate, p_value = result$p.value))
}

cor_results <- tibble(
  variable = c("VehicleAge", "VehOdo", "VehBCost", "WarrantyCost", "VehYear"),
  results = map(variable, ~cor_analysis(df[[.x]], df$IsBadBuy))
)

print(cor_results)

# Regression Model
df_model <- lm(IsBadBuy ~ VehicleAge + VehYear + WarrantyCost + VehOdo + VehBCost, data = df)
summary(df_model)

# Visualizing Regression Results
plot(df_model)

# Recommendations and Final Insights
# Based on the analysis and regression model, provide insights and recommendations.



# Predictive model
# Splitting the data into training and testing sets
set.seed(123) # For reproducibility
split <- sample.split(df$IsBadBuy, SplitRatio = 0.7)
train_data <- subset(df, split == TRUE)
test_data <- subset(df, split == FALSE)

# Building a logistic regression model
model <- glm(IsBadBuy ~ VehicleAge + VehYear + WarrantyCost + VehOdo + VehBCost, 
             data = train_data, family = binomial())

# Summary of the model
summary(model)

# Predicting and evaluating the model
predictions <- predict(model, test_data, type = "response")
predicted_class <- ifelse(predictions > 0.5, 1, 0)

# Convert predicted_class and test_data$IsBadBuy to factors with the same levels
predicted_class <- factor(predicted_class, levels = c(0, 1))
test_data$IsBadBuy <- factor(test_data$IsBadBuy, levels = c(0, 1))

# Now use the confusionMatrix function from the caret package
confusion_matrix <- confusionMatrix(predicted_class, test_data$IsBadBuy)
print(confusion_matrix)
