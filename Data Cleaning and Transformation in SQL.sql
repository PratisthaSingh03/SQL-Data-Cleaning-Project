-- DATA CLEANING --
SELECT * 
FROM layoffs_data;

-- staging

CREATE TABLE layoffs_staging
LIKE layoffs_data;

SELECT * 
FROM layoffs_staging; 

# Remove duplicates
SELECT * , 
ROW_NUMBER() 
OVER(PARTITION BY company, industry, laid_Off_count,percentage, `date`) AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS
(
SELECT * , 
ROW_NUMBER() 
OVER(PARTITION BY company, location_HQ, industry,stage, laid_Off_count,percentage,`date`, country, Funds_Raised) AS row_num
FROM layoffs_staging
)
SELECT * 
FROM duplicate_cte 
WHERE row_num > 1;

SELECT * FROM layoffs_staging
WHERE Company = 'cazoo';

 # DELETING DUPLICATES

CREATE TABLE `layoffs_staging2` (
  `Company` text,
  `Location_HQ` text,
  `Industry` text,
  `Laid_Off_Count` bigint DEFAULT NULL,
  `Date` text,
  `Source` text,
  `Funds_Raised` bigint DEFAULT NULL,
  `Stage` text,
  `Date_Added` text,
  `Country` text,
  `Percentage` text,
  `List_of_Employees_Laid_Off` text,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM layoffs_staging;
INSERT INTO layoffs_staging2
SELECT * , 
ROW_NUMBER() 
OVER(PARTITION BY company, location_HQ, industry,stage, laid_Off_count,percentage,`date`, country, Funds_Raised) AS row_num
FROM layoffs_staging;

DELETE 
FROM layoffs_staging2
WHERE row_num >1;

-- Standardizing Data
SELECT company, TRIM(company)
FROM layoffs_staging2;
 
UPDATE layoffs_staging2
SET company = TRIM(company);
 
SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;
 
SELECT* 
FROM layoffs_staging2;
SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;
 --
SELECT `date` ,
 str_to_date (`date`, '%Y-%m-%d' )
 FROM layoffs_staging2;
 
 UPDATE layoffs_staging2
 SET `date` = str_to_date (`date`, '%Y-%m-%d' ) ; 
 
-- Changing datatype of date 
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

SELECT* 
FROM layoffs_staging2;

#Removing any NULL Values
SELECT * FROM layoffs_staging2
WHERE percentage IS NULL
OR percentage = '';  
 -- missing val
SELECT * FROM layoffs_staging2
WHERE industry = '';

-- Changing Blank space into NULL values
UPDATE layoffs_staging2
SET percentage = NULL
WHERE percentage = ' ';

SELECT * 
FROM layoffs_staging2
WHERE percentage IS NULL OR percentage = ' ';


-- Unimportant columns removed

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

ALTER TABLE layoffs_staging2
DROP COLUMN `source`;

ALTER TABLE layoffs_staging2
DROP COLUMN `date_added`;

ALTER TABLE layoffs_staging2
DROP COLUMN `list_of_employees_laid_off`;










