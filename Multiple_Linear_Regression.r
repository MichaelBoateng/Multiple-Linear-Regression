# Question 1: Create a scatter plot of the data
library(readxl)
library(ggplot2)

data <- read_excel('C:/Users/mboat/OneDrive - Georgia Institute of Technology/Desktop/SUMMER_24/6414/HW4/hw4-s24-SeaCows.xlsx')

plot <- ggplot(data, aes(x = data$x, y = data$y)) +
    geom_point() +
    labs(x = "X Value", y = "Y Value", title = "Scatter plot of Y vs X") +
    theme(text = element_text(size = 14), plot.title = element_text(size = 16, hjust = 0.5))

print(plot)

#Question 2: Fit a linear regression model to the data
model <- lm(y ~ x, data = data)
summary_model <- summary(model)

beta0 <- coef(model)[1]  # Intercept (β0)
beta1 <- coef(model)[2]  # Slope (β1)
sigma <- summary_model$sigma  # Standard deviation of the residuals (σ)
se_beta0 <- summary_model$coefficients[1, 2]  # Standard error of β0
se_beta1 <- summary_model$coefficients[2, 2]  # Standard error of β1

# Print values:
print(paste("β0: ", beta0))
print(paste("β1: ", beta1))
print(paste("σ: ", sigma))
print(paste("Standard error of β0: ", se_beta0))
print(paste("Standard error of β1: ", se_beta1))

#Question 3: Calculate the correlation coefficient
r_squared <- summary_model$r.squared
r_squared_percent <- r_squared * 100

print(paste("Percent of total variability explained by the model: ", r_squared_percent, "%"))


# Question 4: Linear regression diagnostics
residuals <- model$residuals

hist_res <- ggplot(data.frame(residuals), aes(residuals)) +
  geom_histogram(fill = 'blue', color = 'black', alpha = 0.7, bins = 30) +
  labs(title = "Histogram of Residuals", x = "Residuals", y = "Frequency")

# Set the plot layout to 2 rows and 2 columns
par(mfrow = c(2, 2))

# Create a histogram of residuals
hist(residuals, main = "Histogram of Residuals", xlab = "Residuals", ylab = "Frequency", col = 'blue')

# Create a Q-Q plot to check normality
qqnorm(residuals, main = "Q-Q Plot")
qqline(residuals)

# Create a residuals vs fitted values plot
plot(model$fitted.values, residuals, 
    main = "Residuals vs Fitted Values", xlab = "Fitted Values", ylab = "Residuals")
abline(h = 0, col = "red")

# Create a residuals vs predictor plot
plot(data$x, residuals, 
    main = "Residuals vs Predictor", xlab = "Predictor (x)", ylab = "Residuals")
abline(h = 0, col = "red")

#Question 5: Create a box plot of the recall percentages by group.
library(readxl)

data <- read_excel('C:/Users/mboat/OneDrive - Georgia Institute of Technology/Desktop/SUMMER_24/6414/HW4/hw4-s24-NameGameData.xlsx')

boxplot(RECALL ~ GROUP, data = data, main = "Box Plots of Recall Percentages by Group", xlab = "Group", ylab = "Recall Percentage")

#Question 6: Perform a one-way ANOVA to test for differences in recall percentages between the groups.
model <- aov(RECALL ~ GROUP, data = data)

anova_table <- anova(model)
print(anova_table)

#Question 8: Perform a Tukey HSD test to determine which groups have significantly different recall percentages.

# Perform a one-way ANOVA to test for differences in recall percentages between the groups
model <- aov(RECALL ~ GROUP, data = data)

anova_table <- anova(model)
print(anova_table)