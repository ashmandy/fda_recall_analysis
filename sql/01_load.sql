
CREATE DATABASE IF NOT EXISTS fda_recalls;
USE fda_recalls;

DROP TABLE IF EXISTS fda_recalls.raw_recalls;

CREATE TABLE fda_recalls.raw_recalls(
    fei_number VARCHAR(100),
    recalling_firm_name VARCHAR(255),
    product_type VARCHAR(100),
    product_classification VARCHAR(100),
    status VARCHAR(100),
    distribution_pattern VARCHAR(4000),
    recalling_firm_city VARCHAR(100),
    recalling_firm_state VARCHAR(100),
    recalling_firm_country VARCHAR(100),
    center_classification_date VARCHAR(100),
    reason_for_recall VARCHAR(2500),
    product_description VARCHAR(4000),
    event_id VARCHAR(100),
    event_classification VARCHAR(100),
    product_id VARCHAR(100),
    center VARCHAR(100),
    recall_details VARCHAR(250)
) CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Run from Terminal: mysql --local-infile=1 -u root -p
LOAD DATA LOCAL INFILE '/Users/mandylanglois/Documents/DATA ANALYSIS/FDA Recall and Compliance Analysis /data_raw/fda_recalls.csv'
INTO TABLE fda_recalls.raw_recalls
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    ESCAPED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- data Load check 
-- column count check
-- Value spot check 
SELECT 
    COUNT(*) AS total_rows,
    COUNT (DISTINCT event_id) AS distinct_events,
    COUNT(DISTINCT product_id) AS distinct_products
FROM fda_recalls.raw_recalls;

SELECT 
    COUNT(*) AS column_count
    FROM information_schema.COLUMNS
    WHERE table_schema = 'fda_recalls' 
        AND table_name = 'raw_recalls';
    
SELECT
    recalling_firm_name,
    product_type,
    event_classification,
    center_classification_date,
    recall_details
FROM fda_recalls.raw_recalls
LIMIT 10;

