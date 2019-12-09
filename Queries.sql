--SELECT isin, name, asset, value, currency, market, type, sector, risk, ogc, volatility, volatility1, broker FROM fund WHERE asset='S';

--SELECT id, type, amount, isinbuy, (SELECT name AS namebuy FROM fund WHERE fund.isin = isinbuy), prevsharesbuy, shares, postsharesbuy, isinsell, (SELECT name AS namesell FROM fund WHERE fund.isin = isinsell), prevsharessell, postsharessell FROM operation WHERE status = 'C' ORDER BY created DESC;

--SELECT round(sum(i.proportion * f.volatility))/100 AS volatility, round(sum(i.proportion * f.ogc))/100 AS ogc, round(sum(i.proportion * f.change))/100 AS change FROM fund AS f INNER JOIN invest AS i ON f.isin = i.isin;

--SELECT date, purchase, current, diff, reldiff, volatility FROM performance;

/* -- Sum Investments
SELECT size, round(sum(i.shares * purchvalue)) AS purchamount, round(sum(i.shares * f.value)) AS curramount, round(sum(i.shares * f.value - i.shares * purchvalue)) AS diffamount,  round(sum(((i.shares * f.value - i.shares * i.purchvalue)/ (i.shares * i.purchvalue))*100)) AS reldiffamount
FROM fund AS f INNER JOIN invest AS i ON f.isin = i.isin GROUP BY size ORDER BY reldiffamount DESC; 
*/

/*
DROP FUNCTION investView();
CREATE FUNCTION investView() RETURNS TABLE(isin varchar, name varchar, asset varchar, shares float, purchvalue float, purchamount float, currvalue float, curramount float, diffamount float,
reldiffamount float, change float, proportion float) AS $$ 
SELECT isin, name, asset, shares, purchvalue, purchamount, currvalue, curramount, diffamount, reldiffamount, change, round(currAmount/totpurchamount*1000)/10 AS proportion FROM
(SELECT i.isin AS isin, f.name AS name, f.asset AS asset, i.shares AS shares, i.purchvalue AS purchvalue, round(i.shares * purchvalue) AS purchamount, f.value AS currvalue, round(i.shares * f.value) AS curramount, round(i.shares * f.value - i.shares * purchvalue) AS diffamount,  round(((i.shares * f.value - i.shares * i.purchvalue)/ (i.shares * i.purchvalue))*100) AS reldiffamount, f.change AS change
FROM fund AS f INNER JOIN invest AS i ON f.isin = i.isin ORDER BY change DESC) AS t1, (SELECT round(sum(shares * purchvalue)) AS totpurchamount FROM fund AS f INNER JOIN invest AS i ON f.isin = i.isin) AS t2
ORDER BY reldiffamount DESC; $$ LANGUAGE SQL;
*/

--DELETE FROM inv WHERE isin = 'ES0173394034'
--SELECT * FROM investView() WHERE asset='F' ORDER BY change DESC;

--SELECT * FROM performance ORDER BY date DESC;
--delete from performance where date='2019-04-07';
--SELECT date, SUM(purchase) AS purchase, SUM(current) AS current, SUM(diff) AS diff FROM performance WHERE portfolioid=1 GROUP BY (date) ORDER BY date DESC;
--SELECT date, SUM(purchase) AS purchase, SUM(current) AS current, SUM(diff) AS diff FROM performance GROUP BY (date) ORDER BY date DESC;

select * from fund;

