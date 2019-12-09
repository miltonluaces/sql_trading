--USE AISTrading
--EXECUTE DROPTRADERTABLES;
--EXECUTE CREATETRADERTABLES;
--EXECUTE CREATETRADERINDEXES;

--EXEC InitParams
--SELECT * FROM AisParameter 

--EXEC AddStock 'GME', 'Game Stop';	
--SELECT * FROM AisStock

USE [master]
GO
EXEC KillConns

--SELECT * FROM AisStock
