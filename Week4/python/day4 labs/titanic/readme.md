# TITANIC - TOP SCORES CHEAT OR NOT???
**Summary:**
I analyzed 5 notebook used in a titanic competion promoted by kaggle. I selected them filtering the highest scores in the competition. The highest score is 1 and 20 user achieved this score. After checking 3 of those and see that they user cheat, I selected one that had more than 8500 votes with a gold medal and other one with around 125 votes and a bronze medal.
<br/><br/>
by [Thiago Costa](https://github.com/cosfer2804/cosferlabwork)

## Table of content

- [Data](https://github.com/cosfer2804/cosferlabwork/edit/main/Jupyter/Week2/Project/readme.md#data)
- [3 Cheaters](https://github.com/cosfer2804/cosferlabwork/edit/main/Jupyter/Week2/Project/readme.md#3-cheaters)
- [Bronze Medal](https://github.com/cosfer2804/cosferlabwork/edit/main/Jupyter/Week2/Project/readme.md#bronze-medal)
- [Gold Medal ](https://github.com/cosfer2804/cosferlabwork/edit/main/Jupyter/Week2/Project/readme.md#gold-medal)


## Data
[TITANIC LINK](https://www.kaggle.com/c/titanic/overview)<br/>
First I studied the dataset given. Using jupyter notebook and tableau it was possible to apply some EDA get some knowledge about the dataframe.<br/>
EDA insights:
- The train data has 12 columns, 7 of them numerical and 5 of them catecorical. It has 891 entries.
- The column 'cabin' need to be dropped, it has around 77% of null values. The column 'age' has around 20% of null values and the column 'embarked' has less than 1% of empty vlaues (only 2 values).
- After applying some EDA, I could see that 'age' is definitely correlated to survival probability, in this case the null values should be replaced by the age.mean(). 'embarked' may also be correlated with survival, so in this case need to replace de null as well.
- With the EDA was possible to see that creating some features may improve the results. Example: create a group for 'age' bands, leaving the 'age' alone gives you a lot of information that's hard to see and extract some information from it.<br/><br/>
## 3 Cheaters
[Cheater1](https://www.kaggle.com/evgenypotapov/notebook602c8b4de2),
[Cheater2](https://www.kaggle.com/maryragozina/notebook9849f51564),
[Cheater3](https://www.kaggle.com/andrej0marinchenko/titanic-machine-learning-from-disaster/notebook)<br/>
- The cheaters 1 and 2 are cheaters and lazy, because they just did a small and very confused for loop (the one below in the image) that play around the test table faking is doing something usefull. But in the end, they just extract the results from the internet and submit this csv as the predicted ones;
- The cheater 3 actually do the same as the others in the end, but at least did some good EDA. In the beginning look like that is working with the data to get some insights, he worked with the nulls in some columns and even did some plots using matplotlib pyplot, scatter_3d, scatter, FacetGrid. Actually was really nice to see different plots applied in the EDA, it was possible to get insights from this notebook even the author cheating. In the end of the notebook the author used an decision tree, however in the end, where he was suppose to submit the predict values gotten from decision tree, he did the same as the other 2 cheaters above.<br/>

"For" that the cheaters used to play around the test dataframe:
<img src="https://github.com/cosfer2804/cosferlabwork/blob/main/Week4/python/day4%20labs/titanic/for.png">
<br/>
In the end the 3 cheaters submited the answers from the competition instead of the predicted results:
<img src="https://github.com/cosfer2804/cosferlabwork/blob/main/Week4/python/day4%20labs/titanic/submit.png">

## Bronze Medal
[Bronze Medal](https://www.kaggle.com/tanmayunhale/titanic-top-4-hyperparameter-tuning/notebook)<br/>
In this notebook, the author did data visualisation, data preprocessing, fill missing values and encoding:
- He started dealing with empty values, filled the 'age' null values with the median;
- Then he did 'features' applied with visualisation, also converted categorical data into numerical using dummies;
- The author started looking for the numerical categories. Also found an relation with the 'fare' price and probability of surviving
- Merged some columns with others to get some 'features' as the passenger is alone or not.
- This notebook did a lot of analysis with plots and explanations. The author said in his notebook that the last notebook consist in the result of a lot of tries and using different methods;
- The author did feature scaling with standardisation (StandarScaler).
- For the machine learning model the author created a list with different kind of methods and applied them all. Then he did a for to check for the best accuracy in the models used. The RandomForestClassifier gave the highest accuracy.
- In the end he decided to apply hyperparamter tuning with RandomForestClassifier and that was how he got in the top 4%.

Here is the accuracy table comparing differend models:
<img src="https://github.com/cosfer2804/cosferlabwork/blob/main/Week4/python/day4%20labs/titanic/models%20table.png">

## Gold Medal


