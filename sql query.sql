# SQL Examples

# 1 – See all shipments

SELECT Product, s.Date, Amount, Boxes FROM shipments s;

# 2 – All shipments by SP02

select * from shipments s
where s.`Sales Person` = ‘SP02’;

 


# 3 – All shipments by SP02 to G3

select * from shipments s
where s.`Sales Person` = ‘SP02’ and s.Geo = ‘G3’
order by s.amount desc;


# 4 – All shipments in Jan 2023

SELECT * FROM ac_telugu.shipments_new s
where s.Date between ‘2023-1-1’ and ‘2023-1-31’;

select * from shipments_new s
where Extract(year_month from s.Date) = 202301;

# 5 – All shipments by SP02, SP03, SP12, SP15

select * from shipments_new s
where s.`Sales Person` = “SP02”
or s.`Sales Person` = “SP03”
or s.`Sales Person` = “SP12”
or s.`Sales Person` = “SP15”;

select * from shipments_new s
where s.`Sales Person` in (“SP02”, “SP03”, “SP12”, “SP15”);

# 6 – Products that have the word choco in them

select * from products
where product like ‘%choco%’;

# 7 – Sales persons whose name begins with S

select * from people
where `Sales Person` LIKE ‘S%’;

# 8 – Sales per box of chocolates in Feb 2023

SELECT S.DATE, s.Amount, s.Boxes, round(S.Amount / S.Boxes, 1) as ‘Amount per Box’ FROM SHIPMENTS_NEW S
WHERE extract(year_month from s.Date) = 202302;

# 9 – All shipment data for Subbarao

select * from people
where `sales person` like ‘subba%’;

select * from shipments_new
where `sales person` = ‘sp11’;

select p.`sales person`, s.Date, s.Amount, s.boxes from shipments_new s
join people p on p.`sp id` = s.`sales person`
where p.`sales person` LIKE ‘Subba%’;

 


# 10 – All shipment data for Subbarao by month


select extract(year_month from s.Date), sum(s.Amount), sum(s.boxes)
from shipments_new s
join people p on p.`sp id` = s.`sales person`
where p.`sales person` LIKE ‘Subba%’
group by extract(year_month from s.Date);


# H1 – All shipment data for Subbarao to USA
# H2 – What is the maximum amount in each month?
# H3 – How many shipments we do by each country in the month of March 2023