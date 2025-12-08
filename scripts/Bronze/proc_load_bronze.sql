/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE Bronze.load_bronze as
begin

		PRINT '========================================';
		PRINT 'LOADING BRONZE LAYER';
		PRINT '========================================';

		
		PRINT '========================================';
		PRINT 'LOADING CRM TABLE';
		PRINT '========================================';

		PRINT '<<TRUNCATING TABLE:-Bronze.crm_cust_info';
		Truncate TABLE Bronze.crm_cust_info;

		PRINT '<<INSERTING DATA INTO:-Bronze.crm_cust_info';
		BULK INSERT Bronze.crm_cust_info 
		FROM 'C:\Users\Siddharth\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
		with(
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);

		PRINT '<<TRUNCATING TABLE:-Bronze.crm_prd_info';
		Truncate TABLE Bronze.crm_prd_info;

		PRINT '<<INSERTING DATA INTO:-Bronze.crm_prd_info';
		BULK INSERT Bronze.crm_prd_info 
		FROM 'C:\Users\Siddharth\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
		with(
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);

		PRINT '<<TRUNCATING TABLE:-Bronze.crm_sales_details';
		Truncate TABLE Bronze.crm_sales_details;

		PRINT '<<INSERTING DATA INTO:-Bronze.crm_sales_details';
		BULK INSERT Bronze.crm_sales_details 
		FROM 'C:\Users\Siddharth\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
		with(
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);

		PRINT '========================================';
		PRINT 'LOADING ERP TABLE';
		PRINT '========================================';

		PRINT '<<TRUNCATING TABLE:-Bronze.erp_cust_az12';
		Truncate TABLE Bronze.erp_cust_az12;

		PRINT '<<INSERTING DATA INTO:-Bronze.erp_cust_az12';
		BULK INSERT Bronze.erp_cust_az12 
		FROM 'C:\Users\Siddharth\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\cust_az12.csv'
		with(
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);

		PRINT '<<TRUNCATING TABLE:-Bronze.erp_loc_a101';
		Truncate TABLE Bronze.erp_loc_a101;

		PRINT '<<INSERTING DATA INTO:-Bronze.erp_loc_a101';
		BULK INSERT Bronze.erp_loc_a101 
		FROM 'C:\Users\Siddharth\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\loc_a101.csv'
		with(
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);

		PRINT '<<TRUNCATING TABLE:-Bronze.erp_px_cat_g1v2';
		Truncate TABLE Bronze.erp_px_cat_g1v2;

		PRINT '<<INSERTING DATA INTO:-Bronze.erp_px_cat_g1v2';
		BULK INSERT Bronze.erp_px_cat_g1v2 
		FROM 'C:\Users\Siddharth\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\px_cat_g1v2.csv'
		with(
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);
END
