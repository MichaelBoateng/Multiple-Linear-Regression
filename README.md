This R script is performing two main tasks on a dataset of sea cows:

1. **Creating a Scatter Plot:** The script first loads the necessary libraries (`readxl` and `ggplot2`). It then reads an Excel file containing the data using the `read_excel()` function. A scatter plot is created using `ggplot()`, with `geom_point()` to add points to the plot. The `labs()` function is used to add labels to the x and y axes and a title to the plot. The `theme()` function is used to adjust the text size for the plot and center the title.

2. **Fitting a Linear Regression Model:** The script fits a linear regression model to the data using the `lm()` function, with `y` as the dependent variable and `x` as the independent variable. The `summary()` function is used to get a summary of the model, which includes the coefficients, the residuals, and the R-squared value. The coefficients of the model (the intercept and the slope) are extracted using the `coef()` function.

Overall, this script is a basic analysis of the relationship between two variables in a dataset, visualizing the data with a scatter plot and quantifying the relationship with a linear regression model.

![graph_plot_23](https://github.com/MichaelBoateng/Multiple-Linear-Regression/assets/47555566/c8c942ba-9d5e-4553-811d-a3e46ddb50fc)
