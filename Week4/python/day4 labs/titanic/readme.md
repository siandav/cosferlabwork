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
- The cheater 3 actually do the same as the others in the end, but at least did some good EDA. In the beginning look like that is working with the data to get some insights, he worked with the nulls in some columns and even did some plots using matplotlib pyplot, scatter_3d, scatter, FacetGrid. Actually was really nice to see different plots applyed in the EDA, it was possible to get insights from this notebook even the author cheating. In the end of the notebook the author used an decision tree, however in the end, where he was suppose to submit the predict values gotten from decision tree, he did the same as the other 2 cheaters above.

<img src="https://github.com/cosfer2804/cosferlabwork/blob/main/Jupyter/Week2/Project/chart2.png">

## Bronze Medal
**Tools:** Excel is still very popular, specially for the data analyst position, possibly because it is not as technical as the others. As for Tableau, it is most demanded for Data Analysts (the percentage would probably be higher if we take into consideration some similar expressions such as visualization tools, Power BI, etc.). Also, from the graph we can infer that our position assignation was quite effective, since the percentages for the 'other' category are significantly lower except for Excel, the least specialized tool.

**Skills:** Machine learning is very demanded for data scientist and data engineers, but not so much for analyst, the same as for AI.

<img src="https://github.com/cosfer2804/cosferlabwork/blob/main/Jupyter/Week2/Project/chart1.png">

**Gold Medal** Most Data Analyst jobs require either a Bachelor's or Master's. For Data Scientist, on the other hand, we find higher education requirements: less percentage of job positions ask for Bachelor's, but a significant amount of them ask for a PhD, so we presume recruiters don't even list a Bachelor's in the job offer.

**Majors:** According to our results, business is the most common or demanded background. This can be biased by the popularity of the word itself. Very specialized majors (in the sense that they differ significantly from the data path), such as geography or psychology, have marginal niche demand.

<img src="https://github.com/cosfer2804/cosferlabwork/blob/main/Jupyter/Week2/Project/chart2.png">

## Conclusion
- Job positions overlap frequently, and roles in the data industry are not well-defined. Therefore, don't let job positions names differing from data analyst stop you from applying.
- You're okay with a bachelor's degree to access most of the jobs in terms of education level requirements.
- The most demanded tools in the industry for the data analyst role are excel and SQL

