/*
CREATE PROCEDURE InitParams AS
	DELETE FROM AisParameter;
	DECLARE @creationDate DATE;
	SET @creationDate = CONVERT(DATE, '2014-01-01');
	INSERT INTO AisParameter (id, code, descr, type, value, creation) VALUES (1, 'closure', 'Ultima fecha realizado cierre diario', 'D', @creationDate, @creationDate); 
	INSERT INTO AisParameter (id, code, descr, type, value, creation) VALUES (2, 'nnMovWin', 'Ventana movil para el pron. redes neuronales', 'I', '10', @creationDate); 
	INSERT INTO AisParameter (id, code, descr, type, value, creation) VALUES (3, 'nnEpochs', 'Iteraciones para el pron. redes neuronales', 'I', '200', @creationDate);
	INSERT INTO AisParameter (id, code, descr, type, value, creation) VALUES (4, 'nnTrendValues', 'Numero de Dias para considerar si hay tendencia en redes neuronales', 'I', '5', @creationDate);
	INSERT INTO AisParameter (id, code, descr, type, value, creation) VALUES (5, 'nnTrendPerc', 'Pocentaje cercano al maximo para tendencie en redes neuronales', 'R', '15', @creationDate); 
	INSERT INTO AisParameter (id, code, descr, type, value, creation) VALUES (6, 'fcstMethod', 'Metodo para utilizar para el calculo de pronóstico', 'S', 'ANN', @creationDate); 
	INSERT INTO AisParameter (id, code, descr, type, value, creation) VALUES (7, 'debug', 'Debug: F (Fcst) P (Plan) FP (Ambos) '' (Ninguno)', 'S', 'F', @creationDate); 
GO

CREATE PROCEDURE AddStock @code VARCHAR(10), @name VARCHAR(100) AS
	INSERT INTO AisStock (code, name, type, per, ebitda, creation) VALUES (@code,@name, 0, 0, 0, '20100101');
GO


CREATE PROCEDURE KillConns AS
	SET NOCOUNT ON

	DECLARE @DBName varchar(50)
	DECLARE @spidstr varchar(8000)
	DECLARE @ConnKilled smallint

	SET @ConnKilled=0
	SET @spidstr = ''
 
	Set @DBName = 'AisTrading'
	IF db_id(@DBName) < 4
	BEGIN
	PRINT 'Connections to system databases cannot be killed'
	RETURN
	END
	SELECT @spidstr=coalesce(@spidstr,',' )+'kill '+convert(varchar, spid)+ '; '
	FROM master..sysprocesses WHERE dbid=db_id(@DBName)
 
	IF LEN(@spidstr) > 0
	BEGIN
	EXEC(@spidstr)
	SELECT @ConnKilled = COUNT(1)
	FROM master..sysprocesses WHERE dbid=db_id(@DBName)
	END
GO
*/

--INSERT INTO AisClient (code, name, address, city, phone, creation) VALUES ('CVF', 'Carlos Vaz Ferreira', 'Rio Branco 202', 'Mexico DF',  '54321', '1963-17-01');
--SELECT * FROM AisClient

--INSERT INTO AisPortfolio (code, name, clientId, creation) VALUES ('ESP-IDN', 'ESPAÑA ITERDIN', 2, '1963-17-01');
--SELECT * FROM AisPortfolio

--INSERT INTO AisStock (code, name, type, per, ebitda, creation) VALUES (@code,@name, 0, 0, 0, '20100101');
--SELECT * FROM AisStock

--INSERT INTO AisInvest(stockId, portfolioId, qty) VALUES (8, 4, 11)  
--SELECT * FROM AisInvest;


--UPDATE AisParameter SET value = '2015-12-12' WHERE code = 'closure';


--SELECT * FROM AisMarketData WHERE date > (SELECT date FROM AisStock WHERE AisStock.id = AisMarketData.stockId) ORDER BY stockId, date
--DELETE FROM AisMarketData WHERE id = 1797020
--SELECT stockId, MAX(date) FROM AisMarketData GROUP BY stockId ORDER BY stockId
--SELECT id, code, date FROM AisStock ORDER BY id
--UPDATE AisStock SET date = (SELECT MAX(date) FROM AisMarketData WHERE AisStock.id = AisMarketData.stockId GROUP BY stockId)
--UPDATE AisStock SET date = '2013-01-01' WHERE date IS NULL

UPDATE AisStock SET date = '2013-01-01'
UPDATE AisStock SET code = 'MSFT', name = 'Microsoft', type = 0, source = 'YFin', date = '2013-01-01' WHERE id = 1;
UPDATE AisStock SET code = 'SBUX', name = 'Starbux', type = 0, source = 'YFin', date = '2013-01-01' WHERE id = 2;
UPDATE AisStock SET code = 'KO', name = 'Coca Cola', type = 0, source = 'YFin', date = '2013-01-01' WHERE id = 3;
UPDATE AisStock SET code = 'AAPL', name = 'Apple', type = 0, source = 'YFin', date = '2013-01-01' WHERE id = 4;
UPDATE AisStock SET code = 'AMZN', name = 'Amazon', type = 0, source = 'YFin', date = '2013-01-01' WHERE id = 5;
UPDATE AisStock SET code = 'BAC', name = 'Bank of America', type = 0, source = 'YFin', date = '2013-01-01' WHERE id = 6;
UPDATE AisStock SET code = 'MANH', name = 'Manhattan', type = 0, source = 'YFin', date = '2013-01-01' WHERE id = 7;
UPDATE AisStock SET code = 'CAT', name = 'Caterpillar', type = 0, source = 'YFin', date = '2013-01-01' WHERE id = 8;
UPDATE AisStock SET code = 'MYL', name = 'Mylan', type = 0, source = 'YFin', date = '2013-01-01' WHERE id = 10;
UPDATE AisStock SET code = 'GME', name = 'Game Stop', type = 0, source = 'YFin', date = '2013-01-01' WHERE id = 11;
UPDATE AisStock SET code = 'LNKD', name = 'LinkedIn', type = 0, source = 'YFin', date = '2013-01-01' WHERE id = 18;
UPDATE AisStock SET code = 'ITX.MC', name = 'Inditex', type = 0, source = 'YFin', date = '2013-01-01' WHERE id = 19;
SELECT * FROM AisStock

SELECT * FROM AisMarketData
