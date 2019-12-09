DROP TABLE funddata;

CREATE TABLE funddata(
isin varchar(12) PRIMARY KEY NOT NULL,
name varchar(70) NOT NULL,
startdate date,
enddate date,
currency varchar(3),
type varchar(2),
transfer varchar(1),
dividends varchar(3), 
mininvest numeric(5, 0),
ocf numeric(5, 2),
suscr numeric(5, 2),
refund numeric(5, 2),
acufun1m numeric(5, 2), acufun3m numeric(5, 2), acufun6m numeric(5, 2), acufun1y numeric(5, 2), acufun3y numeric(5, 2), acufun5y numeric(5, 2), acufunini numeric(5, 2),
acuidx1m numeric(5, 2), acuidx3m numeric(5, 2), acuidx6m numeric(5, 2), acuidx1y numeric(5, 2), acuidx3y numeric(5, 2), acuidx5y numeric(5, 2), acuidxIni numeric(5, 2),
acucat1m numeric(2, 2), acucat3m numeric(5, 2), acucat6m numeric(5, 2), acucat1y numeric(5, 2), acucat3y numeric(5, 2), acucat5y numeric(5, 2), acucatini numeric(5, 2),
anufun0 numeric(5, 2), anufun1 numeric(5, 2), anufun2 numeric(5, 2), anufun3 numeric(5, 2), anufun4 numeric(5, 2), anufun5 numeric(5, 2),
anuidx0 numeric(5, 2), anuidx1 numeric(5, 2), anuidx2 numeric(5, 2), anuidx3 numeric(5, 2), anuidx4 numeric(5, 2), anuidx5 numeric(5, 2),
anucat0 numeric(5, 2), anucat1 numeric(5, 2), anucat2 numeric(5, 2), anucat3 numeric(5, 2), anucat4 numeric(5, 2), anucat5 numeric(5, 2),
stafunvol numeric(5, 2), stafunrat numeric(5, 2), staidxvol numeric(5, 2), staidxrat numeric(5, 2), staratbet numeric(5, 2), staratinf numeric(5, 2),
created date,
modified date);


/*
drop table openfunds;
create table openfunds (
	isin varchar(12),
	name varchar(80) not null,
	sector varchar(50),
	ytd numeric(4,2),
	y1 numeric(4,2),
	y3 numeric(4,2),
	y5 numeric(4,2),
	sel varchar(1)
);
*/
--select * from openfunds;

/*
drop table openfunds2;
create table openfunds2 (
	num int,
	name varchar(80) not null,
	cap numeric(6,0),
	risk numeric(4,2),
	vol numeric(4,2),
	sharpe numeric(4,2)
);
*/


