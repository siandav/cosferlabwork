# TITANIC - TOP SCORES CHEAT OR NOT???
**Summary:**
I analyzed 5 notebook used in a titanic competion promoted by kaggle. I selected them filtering the highest scores in the competition. The highest score is 1 and 20 user achieved this score. After checking 3 of those and see that they user cheat, I selected one that had more than 8500 votes with a gold medal and other one with around 125 votes and a bronze medal.
<br/><br/>
by [Thiago Costa](https://github.com/cosfer2804/cosferlabwork)

## Table of content

- [Data](https://github.com/cosfer2804/cosferlabwork/edit/main/Jupyter/Week2/Project/readme.md#data)
- [3 Cheaters](https://github.com/cosfer2804/cosferlabwork/edit/main/Jupyter/Week2/Project/readme.md#3-cheaters)
- [Gold Medal](https://github.com/cosfer2804/cosferlabwork/edit/main/Jupyter/Week2/Project/readme.md#gold-medal)
- [Bronze Medal ](https://github.com/cosfer2804/cosferlabwork/edit/main/Jupyter/Week2/Project/readme.md#bronze-medal)

## Data
We picked data scraped from the Indeed website containing information of 7,000 data scientist jobs around the U.S. on August 3rd 2018. The information that we worked on is structured in: Company, Name, Position Name, Location, Job, Description, and Number of Reviews of the Company. 
**[Download](https://www.kaggle.com/sl6149/data-scientist-job-market-in-the-us?select=alldata.csv)**

## Data Processing
First, we did some basic cleaning and deleted the location columns since they didn't contribute to our analysis. Then, we standardized the different position names in 4 categories: Data Analyst, Data Scientist, Data Engineer and other. After that, we cleaned the description column so that we only considered the more relevant words for each of the positions. We did that by tokenizing the words and removing stop words. Finally, we iterated through all the rows in search of keywords from 4 different domains: tools, skills, education level and majors. Keywords can be found in the plots below. We accounted for just one appearance of the word per job description, so no keyword was overrepresented.

## Analysis
**Tools:** Excel is still very popular, specially for the data analyst position, possibly because it is not as technical as the others. As for Tableau, it is most demanded for Data Analysts (the percentage would probably be higher if we take into consideration some similar expressions such as visualization tools, Power BI, etc.). Also, from the graph we can infer that our position assignation was quite effective, since the percentages for the 'other' category are significantly lower except for Excel, the least specialized tool.

**Skills:** Machine learning is very demanded for data scientist and data engineers, but not so much for analyst, the same as for AI.

<img src="https://github.com/cosfer2804/cosferlabwork/blob/main/Jupyter/Week2/Project/chart1.png">

**Education level:** Most Data Analyst jobs require either a Bachelor's or Master's. For Data Scientist, on the other hand, we find higher education requirements: less percentage of job positions ask for Bachelor's, but a significant amount of them ask for a PhD, so we presume recruiters don't even list a Bachelor's in the job offer.

**Majors:** According to our results, business is the most common or demanded background. This can be biased by the popularity of the word itself. Very specialized majors (in the sense that they differ significantly from the data path), such as geography or psychology, have marginal niche demand.

<img src="https://github.com/cosfer2804/cosferlabwork/blob/main/Jupyter/Week2/Project/chart2.png">

## Conclusion
- Job positions overlap frequently, and roles in the data industry are not well-defined. Therefore, don't let job positions names differing from data analyst stop you from applying.
- You're okay with a bachelor's degree to access most of the jobs in terms of education level requirements.
- The most demanded tools in the industry for the data analyst role are excel and SQL

