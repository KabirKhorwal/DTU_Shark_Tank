-- Query 1: Retrieving Full Episode Data
SELECT * FROM project..data

-- Query 2: Finding Maximum Episode Number
SELECT MAX(epno) FROM project..data
SELECT COUNT(DISTINCT epno) FROM project..data

-- Query 3: Calculating Pitch Diversity
SELECT COUNT(DISTINCT brand) FROM project..data

-- Query 4: Analyzing Pitch Conversions
SELECT CAST(SUM(a.converted_not_converted) AS FLOAT) / CAST(COUNT(*) AS FLOAT) FROM (
    SELECT amountinvestedlakhs, CASE WHEN amountinvestedlakhs > 0 THEN 1 ELSE 0 END AS converted_not_converted FROM project..data
) a

-- Query 5: Counting Male Participants
SELECT SUM(male) FROM project..data

-- Query 6: Counting Female Participants
SELECT SUM(female) FROM project..data

-- Query 7: Calculating Gender Ratio
SELECT SUM(female) / SUM(male) FROM project..data

-- Query 8: Total Investment Amount
SELECT SUM(amountinvestedlakhs) FROM project..data

-- Query 9: Average Equity Distribution
SELECT AVG(a.equitytakenp) FROM (
    SELECT * FROM project..data WHERE equitytakenp > 0
) a

-- Query 10: Identifying Highest Deal Amount
SELECT MAX(amountinvestedlakhs) FROM project..data

-- Query 11: Finding Highest Equity Allocation
SELECT MAX(equitytakenp) FROM project..data

-- Query 12: Counting Startups with Female Involvement
SELECT SUM(a.female_count) startups_with_female_contributors FROM (
    SELECT female, CASE WHEN female > 0 THEN 1 ELSE 0 END AS female_count FROM project..data
) a

-- Query 13: Analyzing Pitches with Female Involvement
SELECT * FROM project..data
