# LAB | IMBALANCED DATA - CHURN
**Summary:**
Our goal is to predict if the customer churn or not using a logistic regression on the variables: tenure, SeniorCitizen, MonthlyCharges.
<br/><br/>
by [Thiago Costa](https://github.com/cosfer2804/cosferlabwork)
<br/><br/>

## Table of content

- [Import and Explore the Data](https://github.com/cosfer2804/cosferlabwork/edit/main/Jupyter/Week2/Project/readme.md#import-and-explore-the-data)
- [Data Processing](https://github.com/cosfer2804/cosferlabwork/edit/main/Jupyter/Week2/Project/readme.md#Data-Processing)
- [Regression Model](https://github.com/cosfer2804/cosferlabwork/edit/main/Jupyter/Week2/Project/readme.md#regression-model)
- [Evaluate the Model](https://github.com/cosfer2804/cosferlabwork/edit/main/Jupyter/Week2/Project/readme.md#evaluate-the-model)
- [Apply OverSampling](https://github.com/cosfer2804/cosferlabwork/edit/main/Jupyter/Week2/Project/readme.md#apply-oversampling)
- [Apply Tomek Links](https://github.com/cosfer2804/cosferlabwork/edit/main/Jupyter/Week2/Project/readme.md#apply-tomek-links)
- [Screenshots](https://github.com/cosfer2804/cosferlabwork/edit/main/Jupyter/Week2/Project/readme.md#final-insights)

## Import and Explore the Data
- First step I imported the database with pandas and then drop duplicates and 'customerID' and then reseted the index;
- Then used info() to learn more about the dataset, see if has any null values and de data types;

## Data Processing
- In this step I selected the columns that I used to apply the regression model and predict churn. The columns were 'SeniorCitizen', 'tenure', 'MonthlyCharges' and 'Churn'.

**Extract the Target Variable**: here I split the target ('churn') to be predicted and the rest (X) of the columns to be trained and tested.
**Extract the Indepedent Variables and Scale them**: in this step I split the X in numerical and categorical variables
- For the numerical I used Robust scaler to standardize the values;
- Actually after split the num and cat I found that was not necessary, because in X only has numerical data types;

## Regression Model
- First I used train_test_split (split randomly the variables in x_train, x_test, y_train, y_test using the test_size as 0,45 and random_state 40);
- Then I defined the model that I applyed, in this case was LogisticRegression;

## Evaluate the Model
- Here I evaluated the model with accuracy_score (0,79) and used a confusion_matrix that allows visualization of the performance of the model applyed. In the matrix you can see the true positive, true negative, false positive and false negative.

## Apply OverSampling
- To improve the accuracy of the model I decided to use SMOTE(synthetic minority oversampling technique). It's an over sampling technique that adds new points between existing points based on the nearest neighbors. In this case created synthetic values to the minority class predicted (in this case 'Yes') to balance the dataset to do the supervised learning. 
## Apply Tomek Links
- I checked also an under-sampling to see if it improved or not the accuracy. Under-sampling consist in remove some values from majority class, in this case 'No'.

## Sreenshots
- In the picture below it's possible to see how each sampling tryed to balance the values:
<img src="https://github.com/cosfer2804/cosferlabwork/blob/main/Week4/python/ML%20-%20readme/values_count.png">

- Correlation Matrix without any sampling:
<img src="https://github.com/cosfer2804/cosferlabwork/blob/main/Week4/python/ML%20-%20readme/nosampling%20matrix.png">

- Correlation Matrix with SMOTE:
<img src="https://github.com/cosfer2804/cosferlabwork/blob/main/Week4/python/ML%20-%20readme/smote%20matrix.png">

- Correlation Matrix with Tomek Links:
<img src="https://github.com/cosfer2804/cosferlabwork/blob/main/Week4/python/ML%20-%20readme/tomek%20matrix.png">



