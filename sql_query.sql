CREATE database `Gen_Z`;
Use `Gen_Z`;
create table  Gen_Z_career(
Country varchar(10),
Zip_Code int,
Gender varchar(10),
Influence_Factors varchar(50),
Study_Abroad varchar(10),
Employer_for_3_Years varchar(50),
Missionless_Org varchar(50),
Misaligned_Mission_Org varchar(50),
Lack_of_Social_Impact INT,
Work_Environment varchar(50),
Learning_Aspirations varchar(50),
Learning_Environment varchar(50),
Aspirational_Job varchar(50),
Inspiring_Manager varchar(50),
Work_Setup varchar(50),
Layoff_Prone varchar(50),
7_Years_or_more_in_an_Org varchar(50),
Salary_for_Early_Careers varchar(50),
Salary_for_Mid_Careers varchar(50),
Non_Remote_Org INT,
Expected_Salary_Monthly_for_First_Job varchar(50),
Preferred_Type_of_Company varchar(50),
Abusive_Manager varchar(50),
Working_Hours varchar(50),
Healthy_Work_life_Balance varchar(50),
Work_Satisfaction_Factors varchar(50),
Frustration_Factors varchar(50)
);

LOAD DATA LOCAL INFILE 'C:/Users/manda/Desktop/Career.csv'
INTO TABLE Gen_Z_career
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


select *
from Gen_Z_career;



SELECT 
    Preferred_Type_of_Company AS Career_Interest,
    COUNT(*) AS Number_of_Respondents
FROM Gen_Z_career
WHERE Preferred_Type_of_Company IS NOT NULL
  AND Preferred_Type_of_Company <> ''
GROUP BY Preferred_Type_of_Company
ORDER BY Number_of_Respondents DESC;





SELECT 
    Influence_Factors AS Career_Influencing_Factor,
    COUNT(*) AS Number_of_Respondents
FROM Gen_Z_career
WHERE Influence_Factors IS NOT NULL
  AND Influence_Factors <> ''
GROUP BY Influence_Factors
ORDER BY Number_of_Respondents DESC;





SELECT 
    Work_Environment AS Desired_Work_Environment,
    COUNT(*) AS Number_of_Respondents
FROM Gen_Z_career
WHERE Work_Environment IS NOT NULL
  AND Work_Environment <> ''
GROUP BY Work_Environment
ORDER BY Number_of_Respondents DESC;


SELECT 
    Work_Environment AS Desired_Work_Environment,
    COUNT(*) AS Number_of_Respondents,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Gen_Z_career),
        2
    ) AS Percentage
FROM Gen_Z_career
WHERE Work_Environment IS NOT NULL
  AND Work_Environment <> ''
GROUP BY Work_Environment
ORDER BY Percentage DESC;





SELECT 
    Expected_Salary_Monthly_for_First_Job,
    COUNT(*) AS Respondent_Count,
    ROUND(
        COUNT(*) * 100.0 / 
        (SELECT COUNT(*) 
         FROM Gen_Z_career
         WHERE Expected_Salary_Monthly_for_First_Job IS NOT NULL
           AND Expected_Salary_Monthly_for_First_Job <> ''
        ),
        2
    ) AS Percentage
FROM Gen_Z_career
WHERE Expected_Salary_Monthly_for_First_Job IS NOT NULL
  AND Expected_Salary_Monthly_for_First_Job <> ''
GROUP BY Expected_Salary_Monthly_for_First_Job
ORDER BY Respondent_Count DESC;

SELECT 
    Lack_of_Social_Impact AS Social_Impact_Importance,
    COUNT(*) AS Respondent_Count,
    ROUND(
        COUNT(*) * 100.0 / 
        (SELECT COUNT(*) FROM Gen_Z_career),
        2
    ) AS Percentage
FROM Gen_Z_career
GROUP BY Lack_of_Social_Impact
ORDER BY Percentage desc;




SELECT COUNT(*) AS male_count
FROM gen_z_career
WHERE Country = 'IND'
  AND Gender = 'M';



SELECT COUNT(*) AS Female_count
FROM gen_z_career
WHERE Country = 'IND'
  AND Gender = 'F';
  
  
SELECT COUNT(*) AS parent_influenced_count
FROM gen_z_career
WHERE Country = 'IND'
  AND Influence_Factors LIKE '%Parent%';



SELECT COUNT(*) AS female_parent_influenced
FROM gen_z_career
WHERE Country = 'IND'
  AND Gender = 'F'
  AND Influence_Factors LIKE '%Parent%';



SELECT COUNT(*) AS male_parent_influenced
FROM gen_z_career
WHERE Country = 'IND'
  AND Gender = 'M'
  AND Influence_Factors LIKE '%Parent%';


SELECT COUNT(*) AS social_media_influencer_count
FROM gen_z_career
WHERE Country = 'IND'
  AND Influence_Factors LIKE '%Social Media%'
  AND Influence_Factors LIKE '%Influencer%';







