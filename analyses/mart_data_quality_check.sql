/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs quality checks to validate the integrity, consistency, 
    and accuracy of the Mart Layer. These checks ensure:
    - Uniqueness of surrogate keys in dimension tables.
    - Referential integrity between fact and dimension tables.
    - Validation of relationships in the data model for analytical purposes.

Usage Notes:
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/

-- ====================================================================
-- Checking 'mart_dim_customers' customer_key
-- ====================================================================
-- Check for Uniqueness of Customer Key in mart_dim_customers
-- Expectation: No results 
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM {{ref ('mart_dim_customers')}}
GROUP BY customer_key
HAVING COUNT(*) > 1

-- ====================================================================
-- Checking 'mart_dim_products' product_key
-- ====================================================================
-- Check for Uniqueness of Product Key in mart_dim_products
-- Expectation: No results 
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM {{ref ('mart_dim_products')}}
GROUP BY product_key
HAVING COUNT(*) > 1

-- ====================================================================
-- Checking 'mart_fact_sales'
-- ====================================================================
-- Check the data model connectivity between fact and dimensions
SELECT * 
FROM {{ref ('mart_fact_sales')}} f
LEFT JOIN {{ref ('mart_dim_customers')}} c
ON c.customer_key = f.customer_key
LEFT JOIN mart_dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL  
