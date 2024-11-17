# Healthcare Dataset
## Outline
[Data Background](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#data-background)</br>

[Data Cleaning](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#data-cleaning)</br>
- [1. Duplicated Data](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#1-duplicated-data)</br>
- [2. Standardize the Data](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#2-standardize-the-data)</br>
- [3. Null or Blank Data](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#3-null-or-blank-value)</br>
- [4. Remove Unecessary Column](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#4-remove-unecessary-column)</br>

[Exploratory Data Analysis (EDA)](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#exploratory-data-analysis-eda)</br>
- [1. get total numbers of rows](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#1-get-total-numbers-of-rows)</br>
- [2. get unique values each column](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#2-get-unique-values-each-column)</br>
- [3. min, max, avg age](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#3-min-max-avg-age)</br>
- [4. avg group distribution](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#4-avg-group-distribution)</br>
- [5. gender distribution](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#5-gender-distribution)</br>
- [6. blood type distribution](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#6-blood-type-distribution)</br>
- [7. medical condition distribution](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#7-medical-condition-distribution)</br>
- [8. hospital distribution](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#8-hospital-distribution)</br>
- [9. insurance provider distribution](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#9-insurance-provider-distribution)</br>
- [10. min, max, avg billing amount](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#10-min-max-avg-billing-amount)</br>
- [11. room number frequency](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#11-room-number-frequency)</br>
- [12. admission and discharge information](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#12-admission-and-discharge-information)</br>
- [13. admission type distribution](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#13-admission-type-distribution)</br>
- [14. medication frequency](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#14-medication-frequency)</br>
- [15. test result frequency](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#15-test-result-frequency)</br>
- [16. top doctors](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#16-top-doctors)</br>
- [17. billing amount outlier](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/README.md#17-billing-amount-outlier)</br>

## Data Background
Each column provides specific information about the patient, their admission, and the healthcare services provided, making this dataset suitable for various data analysis and modeling tasks in the healthcare domain. Here's a brief explanation of each column in the dataset</br>
</br>
- Name: This column represents the name of the patient associated with the healthcare record.</br>
- Age: The age of the patient at the time of admission, expressed in years.</br>
- Gender: Indicates the gender of the patient, either "Male" or "Female."</br>
- Blood Type: The patient's blood type, which can be one of the common blood types (e.g., "A+", "O-", etc.).</br>
- Medical Condition: This column specifies the primary medical condition or diagnosis associated with the patient, such as "Diabetes," "Hypertension," "Asthma," and more.</br>
- Date of Admission: The date on which the patient was admitted to the healthcare facility.</br>
- Doctor: The name of the doctor responsible for the patient's care during their admission.</br>
- Hospital: Identifies the healthcare facility or hospital where the patient was admitted.</br>
- Insurance Provider: This column indicates the patient's insurance provider, which can be one of several options, including "Aetna," "Blue Cross," "Cigna," "UnitedHealthcare," and "Medicare."</br>
- Billing Amount: The amount of money billed for the patient's healthcare services during their admission. This is expressed as a floating-point number.</br>
- Room Number: The room number where the patient was accommodated during their admission.</br>
- Admission Type: Specifies the type of admission, which can be "Emergency," "Elective," or "Urgent," reflecting the circumstances of the admission.</br>
- Discharge Date: The date on which the patient was discharged from the healthcare facility, based on the admission date and a random number of days within a realistic range.</br>
- Medication: Identifies a medication prescribed or administered to the patient during their admission. Examples include "Aspirin," "Ibuprofen," "Penicillin," "Paracetamol," and "Lipitor."</br>
- Test Results: Describes the results of a medical test conducted during the patient's admission. Possible values include "Normal," "Abnormal," or "Inconclusive," indicating the outcome of the test.</br>

## Data Cleaning
I duplicated the table so if I were to make mistake, I still have the original data

### 1. Duplicated Data
Remove 5500 duplicated rows

### 2. Standardize the data
- Separate the name into first and last name, and capitalize only the first letter
- change the date format for date_of_admission and discharge_date
- standardize billing_amount from many numbers after comma to 2 numbers after comma
- cleaning up the hospital column and standardize it

### 3. Null or Blank Value
There's no null or blank values that needed to be dropped

### 4. Remove unecessary column
Remove row_num column

## Exploratory Data Analysis (EDA)

### 1. get total numbers of rows

![total numbers of rows](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/01.png)

### 2. get unique values each column

![unique values each column](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/02.png)

### 3. min, max, avg age

![min, max, avg age](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/03.png)

### 4. avg group distribution

![avg group distribution](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/04.png)

### 5. gender distribution

![gender distribution](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/05.png)

### 6. blood type distribution

![blood type distribution](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/06.png)

### 7. medical condition distribution

![medical condition distribution](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/07.png)

### 8. hospital distribution

![hospital distribution](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/08.png)

### 9. insurance provider distribution

![insurance provider distribution](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/09.png)

### 10. min, max, avg billing amount

![min, max, avg billing amount](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/10.png)

### 11. room number frequency

![room number frequency](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/11.png)

### 12. admission and discharge information

![admission and discharge information](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/12.png)

### 13. admission type distribution

![admission type distribution](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/13.png)

### 14. medication frequency

![medication frequency](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/14.png)

### 15. test result frequency

![test result frequency](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/15.png)

### 16. top doctors

![top doctors](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/16.png)

### 17. billing amount outlier

![billing amount outlier](https://github.com/vinahuang97/SQL-Portfolio/blob/main/04%20healthcare%20dataset/pict/17.png)

There's no outliers














