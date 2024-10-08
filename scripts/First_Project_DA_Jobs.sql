-- 1. How many rows are in the data_analyst_jobs table?

SELECT COUNT(*)
FROM data_analyst_jobs;

--Answer: 1793

-- 2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT (company)
FROM data_analyst_jobs
LIMIT 10;

-- Answer: ExxonMobil

--3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN'

SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY'

--Answer: TN = 21, TN or KY = 27

--4. How many postings in Tennessee have a star rating above 4?

SELECT *
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating >4;

--Answer : 3

--5. How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--Answer: 151

--6. Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?

SELECT location, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC

--Answer: NE

--7. Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT DISTINCT title
FROM data_analyst_jobs

--Answer: 881

--8. How many unique job titles are there for California companies?

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE location ='CA'

--Answer: 230

--9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT company, AVG(star_rating) AS star_rating
FROM data_analyst_jobs
WHERE review_count >5000
GROUP BY company;

-- Answer: Returns 40 company names.

--10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating? 

SELECT company, AVG(star_rating) AS star_rating
FROM data_analyst_jobs
WHERE review_count >5000
GROUP BY company
ORDER BY star_rating DESC;

-- Answer: The top 6 companies all have the same rating of 4.1999998090000000. Those companies are General Motors, Unilever, Microsoft, Nike, American Expres, and Kaiser Permanente.

--11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%analyst%';

--Answer: 774

--12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%analyst%' AND title NOT ILIKE '%analytics%';

--Answer: There are four positions that all have the word "Tableau" in the job description.

--BONUS: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.


SELECT COUNT(d.title), d.domain
FROM data_analyst_jobs AS d
WHERE d.days_since_posting >21 
	AND d.title IS NOT NULL 
	AND d.domain IS NOT NULL
	AND skill ILIKE '%SQL%'
GROUP BY d.domain
ORDER BY COUNT(d.title) DESC;


--Answer: Internet and Software has 62 jobs listed for over 3 weeks, Banks and Financial Services have 61 listed for over 3 weeks, and Consulting and Business Services has 57 jobs listed for over 3 weeks.