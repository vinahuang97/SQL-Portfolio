# Healthcare Dataset
## Outline
[Data Background]()</br>

[Data Cleaning]()</br>
- [1. Duplicated Data]()</br>
- [2. Standardize the Data]()</br>
- [3. Null or Blank Data]()</br>
- [4. Remove Unecessary Column]()</br>



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
### 2. get unique values each column
### 3. min, max, avg age
### 4. avg group distribution
### 5. gender distribution
### 6. blood type distribution
### 7. medical condition distribution
### 8. hospital distribution
### 9. insurance provider distribution
### 10. min, max, avg, billing amount
### 11. room number frequency
### 12. admission and discharge information
### 13. admission type distribution
### 14. medication frequency
### 15. test result frequency
### 16. top doctors
### 17. billing amount outlier
















