--DROP TABLES
CREATE PROCEDURE DropTraderTables AS
    DROP TABLE AisMarketData;
	DROP TABLE AisPortfolio;
	DROP TABLE AisClient;
	DROP TABLE AisInvest;
	DROP TABLE AisTSeries;
	DROP TABLE AisStock;
GO

--CREATE TABLES
CREATE PROCEDURE CreateTraderTables AS
CREATE TABLE AisParameter( 
id bigint NOT NULL, 
code varchar(30), 
descr varchar(150), 
type varchar(1), 
value varchar(30), 
creation datetime NOT NULL,
CONSTRAINT PkParameter PRIMARY KEY (id));

CREATE TABLE AisClient (
id bigint IDENTITY(1,1) NOT NULL,
code varchar(30), 
name varchar(60), 
address varchar(120), 
city varchar(30), 
phone varchar(30), 
mail1 varchar(50),
mail2 varchar(50),
mail3 varchar(50),
creation datetime NOT NULL,
CONSTRAINT PkClient PRIMARY KEY (id));

CREATE TABLE AisStock( 
id bigint IDENTITY(1,1) NOT NULL, 
code varchar(10), 
name varchar(100), 
type varchar(1), 
value float,
per float,
ebitda float,
source varchar(6), 
currency varchar(1),
market varchar(1),
date datetime, 
creation datetime NOT NULL,
CONSTRAINT PkStock PRIMARY KEY (id));

CREATE TABLE AisMarketData (
id bigint IDENTITY(1,1) NOT NULL,
date datetime NOT NULL, 
openVal float,
high float,
low float,
closeVal float,
volume bigint,
adjClose float,
stockId bigint NOT NULL REFERENCES AisStock(id), 
CONSTRAINT PkMarketData PRIMARY KEY (id));

CREATE TABLE AisPortfolio (
id bigint IDENTITY(1,1) NOT NULL,
code varchar(30), 
name varchar(60), 
creation datetime NOT NULL,
clientId bigint NOT NULL REFERENCES AisClient(id), 
CONSTRAINT PkPortfolio PRIMARY KEY (id));

CREATE TABLE AisInvest (
id bigint IDENTITY(1,1) NOT NULL,
code varchar(10),
date datetime NOT NULL,
stockId bigint NOT NULL,
portfolioId bigint NOT NULL,
qty float, 
purchValue float,
proportion float, 
stopLoss float,
takeProfit float,
creation datetime NOT NULL,
CONSTRAINT PkInvest PRIMARY KEY (id));

CREATE TABLE AisTSeries (
id bigint IDENTITY(1,1) NOT NULL, 
code varchar(30), 
iniHist datetime,
endHist datetime,
openVal text, 
low text, 
high text,
closeVal text,
volume text,
fcst text,
creation datetime NOT NULL,
stockId bigint NOT NULL REFERENCES AisStock(id), 
CONSTRAINT PkTSeriesId PRIMARY KEY (id));

CREATE TABLE AisOperation (
id bigint IDENTITY(1,1) NOT NULL, 
code varchar(30), 
buyDate datetime,
sellDate datetime,
type int,
status int,
qty int,
buyValue float,
sellValue float,
buyCom float,
sellCom float,
creation datetime NOT NULL,
portfolioId bigint NOT NULL REFERENCES AisPortfolio(id), 
stockId bigint NOT NULL REFERENCES AisStock(id), 
CONSTRAINT PkOperationId PRIMARY KEY (id));
GO
        
--CREATE INDEXES
CREATE PROCEDURE CreateTraderIndexes AS
	CREATE INDEX index_TSeries_stockId ON AisTSeries(stockId);
	CREATE INDEX index_Stock_Code ON AisStock(code);
GO

