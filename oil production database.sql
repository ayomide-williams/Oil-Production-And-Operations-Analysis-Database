-- i am Working on an Oil Production & Operations Analysis Database
-- i want to create a table for my data

CREATE TABLE Oil_Database (ProductionID VARCHAR(100) PRIMARY KEY,
WellName VARCHAR(100),
Field VARCHAR(100),
ProductionDate DATE,
BarrelsProduced INT,
Revenue DECIMAL(15,2),
Cost DECIMAL(15,2),
Operator VARCHAR(100),
Location VARCHAR(100)
);

--inserting values into  OIL DATABASE table

INSERT INTO Oil_Database (ProductionID , WellName, Field , ProductionDate , BarrelsProduced , Revenue , Cost, Operator , Location)
VALUES
      (01, 'Bonga', 'Bonga Field', '2005-01-17', 225000, 6000000.00, 150000.00, 'Shell Nigeria Exploration & Production Company', 'Offshore Nigeria'),
      (02, 'Rumaila', 'Rumaila Field', '1954-01-05', 400000, 30000000.00, 10000000.00, 'BP', 'Iraq'),
      (03, 'Agbami', 'Agbami Field', '2008-08-14', 250000, 60000000.00, 1200000.00, 'Chevron Nigeria Ltd', 'Offshore Nigeria'),
      (04, 'Ghawar', 'Ghawar Field', '1951-09-11', 3500000, 100000000.00, 30000000.00, 'Saudi Aramco', 'Saudi Arabia'),
      (05, 'Akpo', 'Akpo Field', '2009-04-20', 175000, 6000000000.00, 30000000.00, 'TotalEnergies', 'Offshore Nigeria'),
      (06, 'Zakum', 'Zakum Field', '1977-11-02', 750000, 20000000000.00, 10000000.00, 'ADNOC', 'UAE Offshore'),
      (07, 'Erha', 'Erha Field', '2006-07-25', 150000, 5000000000.00, 100000000.00, 'ExxonMobil', 'Offshore Nigeria'),
      (08, 'Johan Sverdrup', 'Johan Sverdrup Field', '2019-06-12', 700000, 22000000.00, 18000000.00, 'Equinor', 'Norway Offshore'),
      (09, 'Usan', 'Usan Field', '2012-12-08', 180000, 6000000000.00, 40000000.00, 'TotalEnergies', 'Offshore Nigeria'),
      (10, 'Burgan', 'Burgan Field', '1946-10-05', 1700000, 45000000000.00,250000000.00, 'Kuwait Oil Company', 'Kuwait'),
      (11, 'Egina', 'Egina Field', '2018-11-11', 200000, 7000000000.00,80000000.00, 'TotalEnergies', 'Offshore Nigeria'),
      (12, 'Safaniya', 'Safaniya Field', '1957-01-18', 1200000, 35000000000.00, 700000000.00, 'Saudi Aramco', 'Offshore Saudi Arabia'),
      (13, 'Ofon', 'Ofon Field', '1997-01-04', 60000, 2000000000.00, 50000000.00,'TotalEnergies', 'Offshore Nigeria'),
      (14, 'West Qurna', 'West Qurna Field', '2010-09-19', 400000, 15000000000, 890000000.00, 'ExxonMobil', 'Iraq'),
      (15, 'Amenam', 'Amenam Field', '2003-11-04', 90000, 3000000000.00, 1210000.00, 'TotalEnergies', 'Onshore Nigeria'),
      (16, 'Marjan', 'Marjan Field', '1973-04-11', 500000, 15000000000.00,76000000.00, 'Saudi Aramco', 'Offshore Saudi Arabia'),
      (17, 'Bonny', 'Bonny Field', '1960-01-03', 120000, 4000000.00, 267000.00, 'Shell Petroleum Development Company', 'Bonny Island'),
      (18, 'Shaybah', 'Shaybah Field', '1998-07-07', 1000000, 30000000.00, 400000.00, 'Saudi Aramco', 'Saudi Arabia'),
      (19, 'Forcados', 'Forcados Field', '1970-02-02', 200000, 7000000000.00,454000000.00, 'Shell Petroleum Development Company', 'Onshore/Swamp Nigeria'),
      (20, 'Troll', 'Troll Field', '1996-04-04', 100000, 4000000.00, 120000.00, 'Equinor', 'Norway Offshore'),
      (21, 'Escravos', 'Escravos Field', '1970-07-07', 160000, 500000000.00, 6000000.00, 'Chevron Nigeria Ltd', 'Onshore/Swamp Nigeria'),
      (22, 'Okan', 'Okan Field', '1968-12-12', 70000, 100000000.00, 50000000.00, 'Chevron Nigeria Ltd', 'Offshore Nigeria'),
      (23, 'Meren', 'Meren Field', '1970-10-12', 100000, 2000000000.00, 80900000.00, 'Chevron Nigeria Ltd', 'Offshore Nigeria'), 
      (24, 'Kolo Creek', 'Kolo Creek Field', '1979-10-08', 40000, 200000000.00, 1200000.00, 'Shell Petroleum Development Company', 'Bayelsa State'),
      (25, 'Gbaran', 'Gbaran Field', '2010-07-10', 150000, 500000000, 670000.00, 'Shell Petroleum Development Company', 'Bayelsa State');

  -- viewing my created table showing the values
      SELECT * FROM Oil_Database

  --sorting my oil operator data  alphabetically
SELECT * FROM Oil_Database
ORDER BY Operator;

--Calculating the TOTAL PRODUCTION PER FIELD on the oil production database
SELECT Field, SUM(BarrelsProduced) AS [TotalProduction]
FROM Oil_Database
GROUP BY Field;

--Calculating the TOP PERFORMING WELLS
--Listing from the top performing to thelowest performing wells

SELECT WellName, SUM(BarrelsProduced) AS [TotalOutput]
FROM Oil_Database
GROUP BY WellName
ORDER BY TotalOutput DESC;

--Listing  High revenue operations

SELECT * FROM Oil_Database
WHERE Revenue > 100000000

--Calculating the Operator performance by revenue

SELECT Operator, SUM(Revenue) AS [TotalRevenue]
FROM Oil_Database
GROUP BY Operator
ORDER BY TotalRevenue DESC;

--Calculating and Tracking how TOTAL PRODUCTION changes over time

SELECT ProductionDate, SUM (BarrelsProduced) AS DailyProduction
FROM Oil_Database
GROUP BY ProductionDate
ORDER BY ProductionDate;

--calculating efficiency [cost per barrel]
SELECT 
WellName, SUM(Revenue) / SUM (BarrelsProduced) AS RevenuePerBarrel
FROM Oil_Database
GROUP BY WellName
 
 --Calculating MONTHLY aNALYSIS
  SELECT
  YEAR (ProductionDate) AS Year,
  MONTH (ProductionDate) AS Month,
  SUM (BarrelsProduced)
  FROM Oil_Database
  GROUP BY YEAR (ProductionDate), MONTH (ProductionDate);

  