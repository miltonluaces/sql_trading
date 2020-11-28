--SELECT isin, name, asset, value, currency, market, type, sector, risk, ogc, volatility, volatility1, broker FROM fund WHERE asset='S';

--SELECT id, type, amount, isinbuy, (SELECT name AS namebuy FROM fund WHERE fund.isin = isinbuy), prevsharesbuy, shares, postsharesbuy, isinsell, (SELECT name AS namesell FROM fund WHERE fund.isin = isinsell), prevsharessell, postsharessell FROM operation WHERE status = 'C' ORDER BY created DESC;

--SELECT round(sum(i.proportion * f.volatility))/100 AS volatility, round(sum(i.proportion * f.ogc))/100 AS ogc, round(sum(i.proportion * f.change))/100 AS change FROM fund AS f INNER JOIN invest AS i ON f.isin = i.isin;

--SELECT date, purchase, current, diff, reldiff, volatility FROM performance;

/* -- Sum Investments
SELECT size, round(sum(i.shares * purchvalue)) AS purchamount, round(sum(i.shares * f.value)) AS curramount, round(sum(i.shares * f.value - i.shares * purchvalue)) AS diffamount,  round(sum(((i.shares * f.value - i.shares * i.purchvalue)/ (i.shares * i.purchvalue))*100)) AS reldiffamount
FROM fund AS f INNER JOIN invest AS i ON f.isin = i.isin GROUP BY size ORDER BY reldiffamount DESC; 
*/


--DELETE FROM inv WHERE isin = 'ES0173394034'
--SELECT * FROM investView() WHERE asset='F' ORDER BY change DESC;

-
select * from fund;

