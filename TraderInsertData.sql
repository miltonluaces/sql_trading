-- Miscellaneous


--delete from performance where portfolioid=0;
--SELECT * FROM performance ORDER by date desc;

-- Insert Performance : Funds
--INSERT INTO performance(date, purchase, current, diff, reldiff, volatility, ogc, change, portfolioId) 
--(SELECT NOW() AS date, purchase, current, current-purchase AS diff, (round(((current-purchase)/purchase)*10000))/100 AS relDiff, volatility, ogc, change, 1 as portfolioId FROM 
--(SELECT (round(sum(i.proportion * f.volatility)))/100 AS volatility, round(sum(i.proportion * f.ogc))/100 AS ogc, round(sum(i.proportion * f.change))/100 AS change, round(sum(shares * purchvalue)) AS purchase, round(sum(shares * f.value)) AS current FROM fund AS f INNER JOIN invest AS i ON f.isin = i.isin) AS t1);

/* -- Update proportions
UPDATE invest SET proportion = t.proportion FROM
(SELECT isin, round(currAmount/totcurramount*1000)/10 AS proportion FROM
(SELECT i.isin as isin, round(i.shares * f.value) AS curramount FROM fund AS f INNER JOIN invest AS i ON f.isin = i.isin) AS t1, 
(SELECT round(sum(shares * f.value)) AS totcurramount FROM fund AS f INNER JOIN invest AS i ON f.isin = i.isin) AS t2) AS t
WHERE invest.isin = t.isin;
*/

--DELETE FROM performance WHERE date='2019-04-07' AND portfolioId=0;
--INSERT INTO performance (date, purchase, current, diff, reldiff, volatility, portfolioId) 
--SELECT date('2019-04-07') as date, SUM(purchase) AS purchase, SUM(current) AS current, SUM(diff) AS diff, 0 AS reldiff, 0 as volatility, 0 AS portfolioId FROM performance WHERE date='2019-04-07' GROUP BY (date) ORDER BY date DESC;

--Update Invest, Operation
/*
UPDATE operation SET shares = 67.80, postsharesbuy = prevsharesbuy + 67.8, amount = 1743.60 WHERE isinbuy = 'LU0267388220'
UPDATE invest SET shares = shares + 67.80, purchvalue = round(((shares * purchvalue + 1743.6)/(shares+67.8))*100)/100 WHERE isin = 'LU0267388220';
SELECT * from invest WHERE isin = 'LU0267388220';
*/

