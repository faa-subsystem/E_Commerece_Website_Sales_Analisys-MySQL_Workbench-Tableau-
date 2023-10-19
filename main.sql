CREATE DATABASE e_commercedb;
USE e_commercedb;

ALTER TABLE events MODIFY COLUMN event_time VARCHAR(30);
ALTER TABLE events MODIFY COLUMN category_id bigint;
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/events.csv"
INTO TABLE events
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*split event_time*/
alter table events rename column event_time to event_date;

alter table events add column event_time_zone varchar(4) after event_date;
alter table events add column event_year int after event_date;
alter table events add column event_month int after event_year;
alter table events add column event_day int after event_month;
alter table events add column event_time time after event_day;

-- INPUT DATA INTO NEW COLUMNS FROM EVENT_DATE:
SET SQL_SAFE_UPDATES = 0;
update events set event_time_zone = right(event_date,3);
update events set event_year = left(event_date,4);
update events set event_month = mid(event_date,6,2);
update events set event_day = mid(event_date,9,2);
UPDATE events 
SET 
    event_time = MID(event_date, 12, 8);
SET SQL_SAFE_UPDATES = 1;

/*sales by month*/
SELECT 
    event_year,
    monthname(event_date) as month,
    COUNT(event_type) AS net_sales,
    ROUND(SUM(price), 3) AS total_sales
FROM
    events
WHERE
    event_type = 'purchase'
GROUP BY event_year,month
ORDER BY total_sales desc;

/*time most views*/
-- make pie graph in tableau
SELECT 
    HOUR(event_time) AS time_hour_UTC, COUNT(event_type) AS views
FROM
    events
WHERE
    event_type = 'view'
        OR event_type = 'cart'
GROUP BY time_hour_UTC
ORDER BY views DESC;

/* daytime with the most sales*/
-- make pie graph in tableau
SELECT 
    HOUR(event_time) AS time_hour_UTC, 
    COUNT(event_type) AS purchases
FROM
    events
WHERE
    event_type = 'purchase'
GROUP BY time_hour_UTC
ORDER BY purchases DESC;

/*top 10 brands by sales*/

SELECT 
    brand, count(brand) as times_sold, round(SUM(price),3) AS total_Sales
FROM
    events
WHERE
    event_type = 'purchase'
    
GROUP BY brand
ORDER BY times_sold desc
limit 10;

/*bestselling products*/
-- make column chart by times purchased
SELECT 
    category_code,
    COUNT(category_code) AS times_purchased,
    ROUND(SUM(price), 3) AS total_sales
FROM
    events
WHERE
    event_type = 'purchase'
        AND category_code != ''
GROUP BY category_code
ORDER BY times_purchased DESC
LIMIT 10;

/*Client Retention and Frequency */
CREATE TABLE purchase_frequency  SELECT user_id, COUNT(user_id) AS times_purchased
FROM events
WHERE event_type = 'purchase' and event_type  != ''
GROUP BY user_id
ORDER BY times_purchased DESC;

ALTER TABLE purchase_frequency ADD COLUMN ranges VARCHAR(10);
SET SQL_SAFE_UPDATES = 0; -- SET  safe mode off to make changes without specify primary keys.
UPDATE purchase_frequency SET ranges=('1') WHERE times_purchased = 1;
UPDATE purchase_frequency SET ranges=('2-10') WHERE times_purchased BETWEEN 2 AND 10;
UPDATE purchase_frequency SET ranges=('10-20') WHERE times_purchased BETWEEN 10 AND 20;
UPDATE purchase_frequency SET ranges=('20-30') WHERE times_purchased BETWEEN 20 AND 30;
UPDATE purchase_frequency SET ranges=('30-40') WHERE times_purchased BETWEEN 30 AND 40;
UPDATE purchase_frequency SET ranges=('40-50') WHERE times_purchased BETWEEN 40 AND 50;
UPDATE purchase_frequency SET ranges=('50-60') WHERE times_purchased BETWEEN 50 AND 60;
SET SQL_SAFE_UPDATES = 1;

/*purchasing rate from viewed products*/
-- piechart
SELECT 
    COUNT(a.event_type) AS purchases,
    b.views,
    ROUND(COUNT(a.event_type) / (b.views + COUNT(a.event_type)) * 100,
            1) AS percentage
FROM
    events a,
    (SELECT 
        COUNT(event_type) AS views
    FROM
        events
    WHERE
        event_type = 'view'
    GROUP BY event_type) b
WHERE
    a.event_type = 'purchase'
GROUP BY b.views;

-- select count(distinct(month(event_date))), count(distinct(event_month)), count(distinct(event_year)) from events; keep and the amount 
select * from events limit 20;