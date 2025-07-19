/*
===============================================================================
Quality Checks
===============================================================================
Query Purpose:
    This query performs various quality checks for data consistency, accuracy, 
    and standardization across the 'transformed' layer. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data have been loaded into various table in the transformed layer.
    - Investigate and resolve any discrepancies found during the checks.
*/

-- Checking 'trans.cust_info'
-- ============================================
-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Results
SELECT 
    cst_id,
    COUNT(*) 
FROM  {{ref ('trans_cust_info')}}
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL


-- Check for Unwanted Spaces
-- Expectation: No Results
SELECT 
    cst_key 
FROM  {{ref ('trans_cust_info')}}
WHERE cst_key != TRIM(cst_key)

-- Data Standardization & Consistency
SELECT DISTINCT 
    cst_marital_status 
FROM {{ref ('trans_cust_info')}}


-- ============================================
-- Checking 'trans_prd_info'
-- ============================================
-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Results
SELECT 
    prd_id,
    COUNT(*) 
FROM {{ref ('trans_prd_info')}}
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

-- Check for Unwanted Spaces
-- Expectation: No Results
SELECT 
    prd_nm 
FROM {{ref ('trans_prd_info')}}
WHERE prd_nm != TRIM(prd_nm)

-- Check for NULLs or Negative Values in Cost
-- Expectation: No Results
SELECT 
    prd_cost 
FROM {{ref ('trans_prd_info')}}
WHERE prd_cost < 0 OR prd_cost IS NULL

-- Data Standardization & Consistency
SELECT DISTINCT 
    prd_line 
FROM {{ref ('trans_prd_info')}}

-- Check for Invalid Date Orders (Start Date > End Date)
-- Expectation: No Results
SELECT 
    * 
FROM {{ref ('trans_prd_info')}}
WHERE prd_end_dt < prd_start_dt


-- ==========================================
-- Checking 'trans_sales_details'
-- ==========================================
-- Check for Invalid Dates
-- Expectation: No Invalid Dates


-- Check for Invalid Date Orders (Order Date > Shipping/Due Dates)
-- Expectation: No Results
SELECT 
    * 
FROM {{ref ('trans_sales_details')}}
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt

-- Check Data Consistency: Sales = Quantity * Price
-- Expectation: No Results
SELECT DISTINCT 
    sls_sales,
    sls_quantity,
    sls_price 
FROM {{ref ('trans_sales_details')}}
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL 
   OR sls_quantity IS NULL 
   OR sls_price IS NULL
   OR sls_sales <= 0 
   OR sls_quantity <= 0 
   OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price


-- ===========================================
-- Checking 'trans_cust_az12'
-- ===========================================
-- Identify Out-of-Range Dates
-- Expectation: Birthdates between 1924-01-01 and Today
SELECT DISTINCT 
    bdate 
FROM {{ref ('trans_cust_az')}}
WHERE bdate < '1924-01-01' 
   OR bdate > GETDATE()

-- Data Standardization & Consistency
SELECT DISTINCT 
    gen 
FROM {{ref ('trans_cust_az')}}

-- ===========================================
-- Checking 'trans_cust_loc'
-- ===========================================
-- Data Standardization & Consistency
SELECT DISTINCT 
    cntry 
FROM {{ref ('trans_cust_loc')}}
ORDER BY cntry

-- =============================================
-- Checking 'trans_prd_cat'
-- =============================================
-- Check for Unwanted Spaces
-- Expectation: No Results
SELECT 
    * 
FROM {{ref ('trans_prd_cat')}}
WHERE cat != TRIM(cat) 
   OR subcat != TRIM(subcat) 
   OR maintenance != TRIM(maintenance)

-- Data Standardization & Consistency
SELECT DISTINCT 
    maintenance 
FROM {{ref ('trans_prd_cat')}}

