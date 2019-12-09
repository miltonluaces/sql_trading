-- Performance 
SELECT date, SUM(purchase) AS purchase, SUM(current) AS current, SUM(diff) AS diff FROM performance WHERE portfolioid = 2 GROUP BY date ORDER BY date DESC;
SELECT date, SUM(purchase) AS purchase, SUM(current) AS current, SUM(diff) AS diff FROM performance WHERE portfolioid = 1 GROUP BY date ORDER BY date DESC;
SELECT date, SUM(purchase) AS purchase, SUM(current) AS current, SUM(diff) AS diff FROM performance WHERE portfolioid = 0 GROUP BY date ORDER BY date DESC;

-- Portfolio
SELECT * FROM investView() WHERE asset = 'F' ORDER BY reldiffamount desc;

-- Volatility
select * from propVolatil() order by propvol desc;
select sum(propvol) from propVolatil()
