use SQLProject
Go

select *
from SQLProject.dbo.NashvilleHousing

select SaleDate, convert(date, SaleDate)
from SQLProject.dbo.NashvilleHousing

update NashvilleHousing
set SaleDate = CONVERT(date, SaleDate)

alter table NashvilleHousing
add SaleDateConverted date

update NashvilleHousing
set SaleDateConverted = CONVERT(date, SaleDate)


select *
from SQLProject.dbo.NashvilleHousing 
--where PropertyAddress is null
order by ParcelID

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
from SQLProject..NashvilleHousing a
join SQLProject..NashvilleHousing b
	on a.ParcelID = b.ParcelID
	and a.UniqueID <> b.UniqueID
where a.PropertyAddress is null


update a
set PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
from SQLProject..NashvilleHousing a
join SQLProject..NashvilleHousing b
	on a.ParcelID = b.ParcelID
	and a.UniqueID <> b.UniqueID
where a.PropertyAddress is null


select PropertyAddress
from SQLProject.dbo.NashvilleHousing 
--where PropertyAddress is null
--order by ParcelID


select
SUBSTRING( PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) as Address,
SUBSTRING( PropertyAddress, CHARINDEX(',', PropertyAddress)+1, LEN(PropertyAddress)) as Address
from NashvilleHousing


alter table NashvilleHousing
add PropertySplitAddress nvarchar(255)

update NashvilleHousing
set PropertySplitAddress = SUBSTRING( PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1)


alter table NashvilleHousing
add PropertySplitCity nvarchar(255)

update NashvilleHousing
set PropertySplitCity = SUBSTRING( PropertyAddress, CHARINDEX(',', PropertyAddress)+1, LEN(PropertyAddress))


select *
from NashvilleHousing


select OwnerAddress
from NashvilleHousing


select
PARSENAME(replace(OwnerAddress,',', '.'), 3)
,PARSENAME(replace(OwnerAddress,',', '.'), 2)
,PARSENAME(replace(OwnerAddress,',', '.'), 1)
from NashvilleHousing



alter table NashvilleHousing
add OwnerSplitAddress nvarchar(255)

update NashvilleHousing
set OwnerSplitAddress = PARSENAME(replace(OwnerAddress,',', '.'), 3)


alter table NashvilleHousing
add OwnerSplitCity nvarchar(255)

update NashvilleHousing
set OwnerSplitCity = PARSENAME(replace(OwnerAddress,',', '.'), 2)

alter table NashvilleHousing
add OwnerSplitState nvarchar(255)

update NashvilleHousing
set OwnerSplitState = PARSENAME(replace(OwnerAddress,',', '.'), 1)


select distinct(SoldAsVacant),  count(SoldAsVacant)
from NashvilleHousing
group by SoldAsVacant
order by 2

alter table NashvilleHousing
alter column SoldAsVacant nvarchar(50)

select SoldAsVacant,
case when SoldAsVacant = 0 then 'No'
	 when SoldAsVacant = 1 then 'Yes'
	 else SoldAsVacant
	 end
from NashvilleHousing

update NashvilleHousing
set SoldAsVacant = case when SoldAsVacant = 0 then 'No'
	 when SoldAsVacant = 1 then 'Yes'
	 else SoldAsVacant
	 end



with RowNumCTE as(
select *,
	ROW_NUMBER() over (
	partition by ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference
	order by uniqueID
	) row_num


from NashvilleHousing
--order by ParcelID
)


delete
from RowNumCTE
where row_num > 1
--order by PropertyAddress

--select *
--from RowNumCTE
--where row_num > 1

select *
from NashvilleHousing


alter table  NashvilleHousing
drop column OwnerAddress, TaxDistrict, PropertyAddress

alter table  NashvilleHousing
drop column SaleDate