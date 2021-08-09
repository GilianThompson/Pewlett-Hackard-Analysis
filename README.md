# Pewlett-Hackard-Analysis

### Overview 
In this project, the data for all the employees of a company were analysed to determine which employees were approaching retirement age so that the company can better be prepared to replace those jobs once those positions begin to open up. Analysis was also done to determine which of those employees are also eligible for the company's mentorship program. An ERD diagram was created for the given data and this ERD was used to create an SQL database where the data was imported and manipulated by using different joins to create new tables that were then queried to get the necessary information the company needed. 

### Results 
- To determine which employees were eligible for retirement, the data was searched for employees born between 1952 and 1955 who were also hired between 1985 and 1988, which resulted in 41,380 employees. This data was saved into a new table named retirement_info. 

- Another table was created to hold the current titles of the employees born between 1952 and 1955, and this data was saved into the file retiring_titles.csv. Most of the retirees will be Senior Engineers and Senior Staff with 29,414 employees and 28,254 employees respectively. 
 
- A table was created for those retiring employees eligible for the retirement package by filtering the data to employees born in 1965. These results were saved into the file mentorship_eligibility. There are 1,549 employees eligible for the mentorship program. 

### Summary 
There are 41,380 employees eligible for retirement, so 41,380 jobs will need to be filled. Of these employees, only 1,549 are eligible to mentor the next generation of employees at the company which does not seem like a sufficient number. 

To gain more insight into the wave of upcoming retirements, an additional query could be made about ratio of retirement ready employees compared to the number of non-retiring employees in each department so the company could better understand how much of each department will be leaving and this might give insight into how much each department needs to focus on the mentorship program. A table of department retirement eligiblity and mentorship eligibilty could be made. 

