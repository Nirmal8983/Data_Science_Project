-- Create the database
CREATE DATABASE amazon_sales;
-- Use the newly created database
USE amazon_sales;



-- Add timeofday column
ALTER TABLE sales_data ADD COLUMN timeofday VARCHAR(10);

-- Update timeofday based on the time of the transaction
UPDATE sales_data
SET timeofday = CASE
    WHEN HOUR(time) BETWEEN 6 AND 12 THEN 'Morning'
    WHEN HOUR(time) BETWEEN 12 AND 18 THEN 'Afternoon'
    ELSE 'Evening'
END;

-- Add dayname column
ALTER TABLE sales_data ADD COLUMN dayname VARCHAR(10);

-- Update dayname based on the date of the transaction
UPDATE sales_data
SET dayname = DAYNAME(date);

-- Add monthname column
ALTER TABLE sales_data ADD COLUMN monthname VARCHAR(10);

-- Update monthname based on the date of the transaction
UPDATE sales_data
SET monthname = MONTHNAME(date);

SET SQL_SAFE_UPDATES = 0;


SELECT COUNT(DISTINCT city) AS distinct_cities FROM amazon_sales;

    
    
