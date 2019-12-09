--CREATE DATABASE
--CREATE DATABASE trading;

/*
DROP TABLES
DROP TABLE operation;
DROP TABLE invest;
DROP TABLE portfolio;
DROP TABLE fund;
DROP TABLE performance;
*/

--CREATE TABLES
/*
CREATE TABLE fund ( 
isin varchar(12) PRIMARY KEY NOT NULL, 
name varchar(32) NOT NULL, 
currency varchar(3) NOT NULL,
market varchar(2) NOT NULL,
type varchar(2) NOT NULL,
sector varchar(15) NOT NULL,
size varchar(3) NOT NULL,
value float,
change float,
risk float NOT NULL,
ogc float NOT NULL,
volatility float,
propValue float,
propProfit float,
manager varchar(15) NOT NULL,
broker varchar(15) NOT NULL,
url varchar(60), 
update varchar(1) NOT NULL,
created date NOT NULL,
modified date NOT NULL);
*/

/*
CREATE TABLE portfolio (
id int PRIMARY KEY NOT NULL,
name varchar(60), 
asset varchar(10),
created date NOT NULL,
modified date NOT NULL);
*/

/*
CREATE TABLE invest (
id serial PRIMARY KEY NOT NULL,
isin varchar(12) NOT NULL REFERENCES fund(isin),
open date NOT NULL,
close date,
shares float NOT NULL,
purchValue float NOT NULL, 
currValue float,
purchAmount float,
currAmount float,
diff float,
relDiff float,
proportion float, 
stopLoss float,
takeProfit float,
portfolioId int NOT NULL REFERENCES portfolio(id),
created date NOT NULL,
modified date NOT NULL);
*/

/*
CREATE TABLE operation (
id serial PRIMARY KEY NOT NULL, 
type varchar(1) NOT NULL,
amount float NOT NULL,
isinBuy varchar(12) NOT NULL REFERENCES fund(isin),	
prevSharesBuy float,
postSharesBuy float,
isinSell varchar(12) NOT NULL REFERENCES fund(isin),
prevSharesSell float,
postSharesSell float,
comission float,
status varchar(1) NOT NULL,
portfolioId int NOT NULL REFERENCES portfolio(id),
created date NOT NULL,
modified date NOT NULL); 
*/

/*
CREATE TABLE performance (
id serial PRIMARY KEY NOT NULL, 
date date NOT NULL,
purchase float NOT NULL,
current float NOT NULL,
diff float NOT NULL,
relDiff float NOT NULL,
volatility float NOT NULL,
ogc float,
change float NOT NULL,
portfolioId int NOT NULL REFERENCES portfolio(id));
*/

/*
DROP TABLE histdata;
CREATE TABLE histdata (
isin varchar(12) NOT NULL REFERENCES fund(isin),
name varchar(70) NOT NULL,
currency varchar(3) NOT NULL,
startdate date NOT NULL,
enddate date NOT NULL,
data bytea,
updated bool,
created date,
modified date);
*/

--CREATE INDEXES
/*
CREATE INDEX indNamePortfolio ON portfolio(name);
CREATE INDEX indDateInvest ON invest(open);
CREATE INDEX indIsinInvest ON invest(isin);
CREATE INDEX indDateOperation ON operation(date);
CREATE INDEX indIsinBuyOperation ON operation(isinBuy);
CREATE INDEX indPerformanceDate ON performance(date);
CREATE INDEX indHistData ON histdata(isin)
*/

--ALTER TABLE fund ADD update varchar(1);
