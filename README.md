# SQL-Data-Cleaning-Project
This repository contains SQL scripts for cleaning and transforming layoffs dataset of 2024. The project addresses data quality issues such as missing values, duplicate records, inconsistent formats, and outliers. Key steps include removing duplicates, handling missing data, standardizing company names, and correcting data types.

# SQL Layoffs Data Cleaning Project

## Project Overview
This project aims to clean and transform a layoffs dataset using SQL. The raw dataset contains information on layoffs across different sectors, including dates, companies, and other related attributes. The data cleaning process resolves issues such as missing values, duplicates, and inconsistent formats, preparing the data for further analysis and visualization.

## Dataset Description
- **Name**: Layoffs Data 2024
- **Fields**: Company, Location, Industry, Country
- **Source**: Kaggle (https://www.kaggle.com/datasets/theakhilb/layoffs-data-2022/data)

## Key Data Cleaning Steps
1. **Handling Missing Data**: 
   - Identified and removed records with critical missing fields like company name or layoff date.
2. **Removing Duplicates**: 
   - Detected and deleted duplicate records based on company name and layoff date.
3. **Correcting Data Types**: 
   - Ensured date fields were properly formatted, and numerical fields were consistent.
4. **Standardizing Company Names**: 
   - Standardized capitalization and corrected spelling variations.
5. **Outlier Detection**: 
   - Identified unusually high or low layoff numbers that could skew analysis.

## Files in the Repository
- `Data Cleaning and Transformation in SQL.sql`: Contains all the SQL queries used to clean and transform the data.
- `layoffs_data.csv`: The original raw dataset used for the project.
