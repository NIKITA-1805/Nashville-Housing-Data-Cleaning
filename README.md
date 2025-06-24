# 🏠 Nashville Housing Data Cleaning (SQL)

This project focuses on **cleaning and transforming raw housing data** from the Nashville Housing dataset using **T-SQL in Microsoft SQL Server Management Studio (SSMS)**.

---

## 📂 Project Overview

The dataset contains messy real-estate records that require:
- Standardizing formats
- Fixing missing data
- Splitting combined fields
- Removing duplicates
- Cleaning up unused columns

The goal is to prepare the data for further analysis and visualization.

---

## 📋 Steps Performed

### ✅ 1. Convert `SaleDate` to Standard Date Format
- Converted datetime to date using `CONVERT(date, SaleDate)`
- Optionally added a new column `SaleDateConverted` for transformed values

### ✅ 2. Fix Missing `PropertyAddress` Values
- Used `ISNULL` and a self-join to fill null addresses by matching `ParcelID`

### ✅ 3. Split `PropertyAddress` into `Address` and `City`
- Used `SUBSTRING()` and `CHARINDEX()` to create:
  - `PropertySplitAddress`
  - `PropertySplitCity`

### ✅ 4. Split `OwnerAddress` into Address, City, and State
- Used `PARSENAME()` after replacing commas with periods
- Added:
  - `OwnerSplitAddress`
  - `OwnerSplitCity`
  - `OwnerSplitState`

### ✅ 5. Standardize `SoldAsVacant` Values
- Changed data type to `NVARCHAR`
- Converted `0` → `'No'` and `1` → `'Yes'`

### ✅ 6. Remove Duplicates
- Used `ROW_NUMBER()` with a CTE to identify and delete exact duplicates

### ✅ 7. Drop Unnecessary Columns
- Removed:
  - `OwnerAddress`
  - `TaxDistrict`
  - Original `SaleDate`
  - `PropertyAddress`

---

## 💻 Tools Used

- **Microsoft SQL Server Management Studio (SSMS)**
- **T-SQL**

---

## 📁 Final Table Structure

After cleaning, the table includes:
- `ParcelID`
- `PropertySplitAddress`
- `PropertySplitCity`
- `OwnerSplitAddress`
- `OwnerSplitCity`
- `OwnerSplitState`
- `SaleDateConverted`
- `SoldAsVacant`
- `SalePrice`
- Other key attributes for analysis

---

## 📊 Next Steps (Optional)

- Export cleaned data for use in Power BI / Excel
- Perform exploratory data analysis (EDA)
- Create dashboards to visualize real estate trends

---

## 📌 Author

**Nikita Jadhao**  
Connect with me on [LinkedInhttps://www.linkedin.com/in/nikita-jadhao-40450b286/) or [GitHub](https://github.com/NIKITA-1805).

---

