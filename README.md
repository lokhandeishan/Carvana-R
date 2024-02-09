<h1>Risk Analysis with Predictive Modeling for Vehicle Auctions</h1>

<h2>Description</h2>

In this project, we conduct a comprehensive analysis of vehicle auction data to assess the viability of car purchases. The primary goal was to predict whether a car is a "bad buy" by examining various factors such as vehicle age, mileage, acquisition cost, make, and origin. We used statistical analysis, correlation analysis, and regression modeling techniques to achieve our objectives.

<h2>Project Overview</h2>

In this project, we leveraged data from a delivery application to predict the likelihood of a restaurant's success. The key steps undertaken include:

- Data preprocessing and exploration.
- Feature engineering, encoding, and selection using pandas and numpy in Python.
- Deployment of machine learning algorithms, such as Decision Tree, Logistic Regression, Random Forest, and K-Nearest Neighbors (KNN).
- Visualization of results using libraries like Seaborn and Plotly.

<h2>Project Walkthrough</h2>
 <br />

Data Cleaning and Exploration: We started by loading and cleaning the dataset, ensuring data integrity and quality. We explored the dataset's characteristics using summary statistics and visualization, including identifying the most popular car makes, common car sizes, and car origin.

Correlation Analysis: To identify the factors most correlated with the target variable (IsBadBuy), we performed Pearson's correlation analysis. This analysis highlighted the significant predictors, including vehicle age, mileage, acquisition cost, and year of manufacture.

Regression Modeling: We developed a predictive model using logistic regression to forecast whether a car is a "bad buy." The model used key features, including Vehicle Age, Vehicle Year, Warranty Cost, Odometer Reading, and Acquisition Cost, to make predictions.

Model Evaluation: We evaluated the performance of the predictive model using metrics such as accuracy, precision, recall, and the confusion matrix. The model achieved an accuracy rate of 87%, indicating its effectiveness in predicting "bad buys."

<h2>Recommendations and Insights</h2>
 <br />

Based on our analysis and the predictive model, we provided valuable recommendations to Carvana to improve their vehicle acquisition strategy:

1. Focus on acquiring cars with lower odometer readings to ensure better condition and reduce wear and tear.
2. Target cars with an average age of around 4-4.5 years to strike a balance between cost and age.
3. Consider acquiring newer cars, as they tend to be in better condition and have a higher chance of being a "good buy."
4. Avoid purchasing cars from makes like Mercury and Mini, as they have shown a higher likelihood of being a "bad buy."
5. Pay attention to the age range indicated by dark blue patches in the analysis, as these cars are more likely to be "bad buys."
6. Prioritize acquiring vehicles from top-performing makes, as they tend to be more reliable regardless of their age.


<h2>Libraries Used</h2>

- tidyverse: For data manipulation and visualization.
- lfe: For statistical analysis and regression modeling.
- readxl: For reading Excel data files.
- ggplot2: For creating informative data visualizations.
- caTools: For splitting the dataset into training and testing sets.
- caret: For model evaluation and confusion matrix calculations.
- pROC: For generating ROC curves and AUC calculations (if needed).

<h2>Conclusion</h2>

This project provided Carvana with data-driven insights and a predictive model to make informed decisions when acquiring vehicles from various sources. By implementing the recommendations, Carvana can reduce the risk of purchasing "bad buys" and optimize its operations in the second-hand car market.

Feel free to provide details for your new project, and I'll be happy to assist you in creating a similar code template and project description

<h2>Data Source</h2>

The data was sourced from Kaggle.
