
select * from fund where asset='F';
--SELECT isin, name, asset, value, currency, market, type, sector, risk, ogc, volatility, volatility1, broker FROM fund WHERE asset='S';

--SELECT id, type, amount, isinbuy, (SELECT name AS namebuy FROM fund WHERE fund.isin = isinbuy), prevsharesbuy, shares, postsharesbuy, isinsell, (SELECT name AS namesell FROM fund WHERE fund.isin = isinsell), prevsharessell, postsharessell FROM operation WHERE status = 'C' ORDER BY created DESC;

--SELECT round(sum(i.proportion * f.volatility))/100 AS volatility, round(sum(i.proportion * f.ogc))/100 AS ogc, round(sum(i.proportion * f.change))/100 AS change FROM fund AS f INNER JOIN invest AS i ON f.isin = i.isin;

--SELECT date, purchase, current, diff, reldiff, volatility FROM performance;
--delete from inv where isin = 'LU0607516092'


--select sum(proportion) from fund;
/*
DROP FUNCTION investView();
CREATE FUNCTION investView() RETURNS TABLE(isin varchar, name varchar, asset varchar, shares float, purchvalue float, purchamount float, currvalue float, curramount float, diffamount float,
reldiffamount float, change float, volatility float, proportion float, broker varchar) AS $$ 
SELECT isin, name, asset, shares, purchvalue, purchamount, currvalue, curramount, diffamount, reldiffamount, change, volatility, round(currAmount/totpurchamount*1000)/10 AS proportion, broker FROM
(SELECT i.isin AS isin, f.name AS name, f.asset AS asset, i.shares AS shares, i.purchvalue AS purchvalue, round(i.shares * purchvalue) AS purchamount, f.value AS currvalue, round(i.shares * f.value) AS curramount, round(i.shares * f.value - i.shares * purchvalue) AS diffamount,  round(((i.shares * f.value - i.shares * i.purchvalue)/ (i.shares * i.purchvalue))*100) AS reldiffamount, f.change AS change, f.volatility AS volatility, f.broker AS broker
FROM fund AS f INNER JOIN invest AS i ON f.isin = i.isin ORDER BY change DESC) AS t1, (SELECT round(sum(shares * purchvalue)) AS totpurchamount FROM fund AS f INNER JOIN invest AS i ON f.isin = i.isin) AS t2
ORDER BY reldiffamount DESC; $$ LANGUAGE SQL;
*/




--select * from propVolatil() order by propvol desc;
--select sum(propvol) from propVolatil()

--DELETE FROM performance WHERE date='2019-04-07';
--SELECT i.portfolioid, round(sum(f.value * i.shares)) FROM fund AS f INNER JOIN invest AS i ON f.isin = i.isin  GROUP BY i.portfolioId; 
--SELECT date, SUM(purchase) AS purchase, SUM(current) AS current, SUM(diff) AS diff FROM performance WHERE portfolioid = 1 GROUP BY date ORDER BY date DESC;
--SELECT date, portfolioid, purchase, current, diff FROM performance WHERE date=NOW()::DATE ORDER BY portfolioid DESC;
