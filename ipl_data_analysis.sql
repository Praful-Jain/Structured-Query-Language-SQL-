-- IPL DATA ANALYSIS

-- Create database
CREATE DATABASE ipl_data_analysis;

-- Create a new user
CREATE USER new_user;

-- Change the owner of the database to new_user
ALTER DATABASE ipl_data_analysis OWNER TO new_user;

-- Change the owner of the database back to postgres (assuming 'postgres' is the default superuser)
ALTER DATABASE ipl_data_analysis OWNER TO postgres;

-- Drop the new_user
DROP USER new_user;

-- Drop the ipl_data_analysis database
DROP DATABASE ipl_data_analysis;

-- Create database
CREATE DATABASE ipl_data_analysis;

-- Create the matches table
CREATE TABLE matches (
    id integer, 
    season integer,
    city text,
    date text, 
    team1 text,
    team2 text,
    toss_winner text,
    toss_decision text,
    result text,
    dl_applied integer,
    winner text,
    win_by_runs integer,
    win_by_wickets integer,
    player_of_match text,
    venue text,
    umpire1 text,
    umpire2 text,
    umpire3 text
);

-- Create the deliveries table
CREATE TABLE deliveries(
    match_id integer,
    inning integer,
    batting_team text,
    bowling_team text,
    over integer,
    ball integer,
    batsman text,
    non_striker text,
    bowler text,
    is_super_over integer,    
    wide_runs integer,
    bye_runs integer,
    legbye_runs integer,
    noball_runs integer,
    penalty_runs integer,
    batsman_runs integer,
    extra_runs integer,
    total_runs integer,
    player_dismissed text,
    dismissal_kind text,
    fielder text
);

-- Create the umpires table
CREATE TABLE umpires(
    umpire text,
    country text
);

-- Load data into the matches table
COPY matches FROM '/home/praful/PROJECT/IPL dataset analytics/matches.csv' DELIMITER ',' CSV HEADER;

-- Load data into the deliveries table
COPY deliveries FROM '/home/praful/PROJECT/IPL dataset analytics/deliveries.csv' DELIMITER ',' CSV HEADER;

-- Load data into the umpires table
COPY umpires FROM '/home/praful/PROJECT/IPL dataset analytics/umpires.csv' DELIMITER ',' CSV HEADER;

-- Problems 
-- 1. Total runs scored by each team
SELECT batting_team, SUM(total_runs) AS total_runs 
FROM deliveries 
GROUP BY batting_team;    

-- 2. Top 10 run scorers for Royal Challengers Bangalore
SELECT batsman, SUM(total_runs) AS runs_scored
FROM deliveries 
WHERE batting_team = 'Royal Challengers Bangalore'
GROUP BY batsman
ORDER BY runs_scored DESC
LIMIT 10;

-- 3. Count of umpires from each country except India
SELECT country, COUNT(country) as umpire_count
FROM umpires
WHERE country != ' India'
GROUP BY country;

-- 4. Matches played by each team in each season
SELECT season, teams, COUNT(teams) matches_played
FROM 
(
    SELECT season, team1 AS teams FROM matches
    UNION ALL
    SELECT season, team2 AS teams FROM matches
) AS data
GROUP BY season, teams
ORDER BY season;

-- 5. Number of matches played per year for all the years in IPL
SELECT season, COUNT(id) as matches_played
FROM matches 
GROUP BY season 
ORDER BY season;

-- 6. Number of matches won by each team in each season
SELECT season, winner AS teams, COUNT(winner) AS matches_won
FROM matches
GROUP BY season, teams
ORDER BY season;

-- 7. Extra runs conceded per team in the year 2016
SELECT winner, SUM(win_by_runs) as runs_scored
FROM matches 
WHERE season = 2016 
GROUP BY winner;

-- 8. Top 10 economical bowlers in the year 2015 
WITH Record AS (
    SELECT 
        deliveries.bowler AS bowler,
        CAST(COUNT(deliveries.bowler) AS FLOAT) / 6 AS overs,
        SUM(deliveries.total_runs) AS runs
    FROM deliveries 
    INNER JOIN matches 
    ON deliveries.match_id = matches.id 
    WHERE matches.season = 2015
    GROUP BY deliveries.bowler
)
SELECT 
    bowler, 
    ROUND(CAST(runs AS NUMERIC) / CAST(overs AS NUMERIC), 2) AS economy
FROM Record
ORDER BY economy
LIMIT 10;








