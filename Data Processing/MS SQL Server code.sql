------------------------------------------------------------------------------------
--South African Soccer Dataset – SQL 

--1. View the first 100 rows of the dataset to understand its structure.

SELECT TOP 100 *
FROM [dbo].[ketro_sa_soccer_dataset_advanced];

------------------------------------------------------------------------------------
--2. Count the total number of players in the dataset. 

SELECT COUNT(*) AS Player_Count
FROM [dbo].[ketro_sa_soccer_dataset_advanced];

------------------------------------------------------------------------------------
--3. List all unique teams in the league.

SELECT DISTINCT team
FROM [dbo].[ketro_sa_soccer_dataset_advanced];

------------------------------------------------------------------------------------
--4. Count how many players are in each team. 

SELECT Team,
       COUNT(player_name) AS PLayer_Count
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY team;

------------------------------------------------------------------------------------
--5. Identify the top 10 players with the most goals.

SELECT TOP 10 Player_name,
       goals
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY goals DESC;

------------------------------------------------------------------------------------
--6. Find the average salary for players in each team.

SELECT Player_name,
       team,
       average_salary_zar
FROM [dbo].[ketro_sa_soccer_dataset_advanced];

------------------------------------------------------------------------------------
--7. Retrieve the top 10 players with the highest market value.

SELECT TOP 10 Player_name,
       market_value_zar
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY market_value_zar DESC; 

------------------------------------------------------------------------------------
--8. Calculate the average passing accuracy for each position.

SELECT 
    Position,
    AVG(CAST(passing_accuracy AS FLOAT)) AS AVG_Passing_Accuracy
FROM dbo.ketro_sa_soccer_dataset_advanced
GROUP BY Position;

------------------------------------------------------------------------------------
--9. Compare shot accuracy with goals to find correlations.

SELECT shot_accuracy,
       goals
FROM dbo.ketro_sa_soccer_dataset_advanced
ORDER BY Goals DESC;

------------------------------------------------------------------------------------
--10. Compute total goals and assists for each team.

SELECT Team,
       SUM(CAST(Goals AS FLOAT)) AS Total_Goals,
       SUM(CAST(Assists AS FLOAT)) AS Total_Assists
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Team;

------------------------------------------------------------------------------------
--11. Count players by their marital status. 

SELECT  Player_name,
       COUNT(marital_status) AS marital_status_count
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY player_name;

------------------------------------------------------------------------------------
--12. Count players by nationality.

SELECT  Player_name,
       COUNT(nationality) AS nationality_count
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY player_name;

------------------------------------------------------------------------------------
--13. Find average market value grouped by nationality. 

Select 
       nationality,
       AVG(CAST(market_value_zar AS FLOAT)) AS Avg_market_value_zar
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY nationality;

------------------------------------------------------------------------------------
--14. Determine how many player contracts end in each year. 

SELECT contract_end_year,
       COUNT(player_name) AS player_name
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY contract_end_year;
       
------------------------------------------------------------------------------------
--15. Identify players whose contracts end next year. 

SELECT player_name,
       contract_end_year
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
WHERE contract_end_year = '2026';

------------------------------------------------------------------------------------
--16. Summarize the number of players by injury status. 

SELECT injury_status,
       COUNT(player_name) AS player_name
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY injury_status;

------------------------------------------------------------------------------------
--17. Calculate goals per match ratio for each player. 

SELECT player_name,
       matches_played,
       goals,
       ROUND(CAST(goals AS FLOAT)/ NULLIF(matches_played,0), 3) AS goals_per_match_ratio
FROM [dbo].[ketro_sa_soccer_dataset_advanced];

------------------------------------------------------------------------------------
--18. Count how many players are managed by each agent. 

SELECT agent,
       COUNT(player_name) AS player_name
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY agent;

------------------------------------------------------------------------------------
--19. Calculate average height and weight by player position. 

SELECT position,
       ROUND(AVG(CAST(height_cm AS FLOAT)), 0) AS Avg_height_cm,
       ROUND(AVG(CAST(weight_kg AS FLOAT)), 0) AS Avg_weight_kg  
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY position;

------------------------------------------------------------------------------------
--20. Identify players with the highest combined goals and assists

SELECT player_name,
       goals,
       assists,
       CAST(goals AS FLOAT) + CAST(assists AS FLOAT) as Goals_And_Assists_combined
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER by CAST(goals AS FLOAT) + CAST(assists AS FLOAT) DESC;

------------------------------------------------------------------------------------
