--1. View the first 100 rows of the dataset to understand its structure.

SELECT TOP 100 *
FROM [dbo].[ketro_sa_soccer_dataset_advanced];

-------------------------------------------------------------------------
--2. Count the total number of players in the dataset. 

SELECT COUNT(*) AS Player_Count
FROM [dbo].[ketro_sa_soccer_dataset_advanced];

-------------------------------------------------------------------------
--3. List all unique teams in the league.

SELECT DISTINCT team
FROM [dbo].[ketro_sa_soccer_dataset_advanced];

-------------------------------------------------------------------------
--4. Count how many players are in each team. 

SELECT Team,
       COUNT(player_name) AS PLayer_Count
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY team;

-------------------------------------------------------------------------
--5. Identify the top 10 players with the most goals.

SELECT TOP 10 Player_name,
       goals
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY goals DESC;

-------------------------------------------------------------------------
--6. Find the average salary for players in each team.

SELECT Player_name,
       team,
       average_salary_zar
FROM [dbo].[ketro_sa_soccer_dataset_advanced];

-------------------------------------------------------------------------
--7. Retrieve the top 10 players with the highest market value.

SELECT TOP 10 Player_name,
       market_value_zar
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY market_value_zar DESC; 

-------------------------------------------------------------------------
--8. Calculate the average passing accuracy for each position.

SELECT 
    Position,
    AVG(CAST(passing_accuracy AS FLOAT)) AS AVG_Passing_Accuracy
FROM dbo.ketro_sa_soccer_dataset_advanced
GROUP BY Position;

-------------------------------------------------------------------------
--9. Compare shot accuracy with goals to find correlations.

SELECT shot_accuracy,
       goals
FROM dbo.ketro_sa_soccer_dataset_advanced
ORDER BY Goals DESC;

-------------------------------------------------------------------------
--10. Compute total goals and assists for each team.

SELECT Team,
       SUM(CAST(Goals AS FLOAT)) AS Total_Goals,
       SUM(CAST(Assists AS FLOAT)) AS Total_Assists
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Team;

-------------------------------------------------------------------------
--11. Count players by their marital status. 

SELECT  Player_name,
       COUNT(marital_status) AS marital_status_count
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY player_name;

-------------------------------------------------------------------------
--12. Count players by nationality.

SELECT  Player_name,
       COUNT(nationality) AS nationality_count
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY player_name;
