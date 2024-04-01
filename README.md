# Helping Hands Database
![Microsoft SQL Server Badge](https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927?logo=microsoftsqlserver&logoColor=fff&style=plastic)
![Microsoft Azure Badge](https://img.shields.io/badge/Microsoft%20Azure-0078D4?logo=microsoftazure&logoColor=fff&style=plastic)

## Project Overview
### Description
This database serves as the backbone for Helping Hands, an innovative online platform connecting volunteer nurses with underserved communities. It efficiently manages and organizes crucial information including nurse profiles, their preferred service areas, patient data, contracts, visit schedules, medical conditions, and various other pertinent details essential for the seamless functioning of Helping Hands. Through meticulously designed stored procedures and routines, the system ensures smooth operations by generating vital reports for both administrative purposes and user accessibility, thereby enhancing the overall effectiveness and dynamism of Helping Hands.

## Data Model
### Logical ERD
![Deliverable1](https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/7e03a73f-c631-46a4-b0f3-64d47e99d646)

<details>
  <summary>Data Dictionary</summary>
  
   ### EndUser
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| UserId | AutoNumber | 10 | Mandatory. Integers only | Primary Key. Must be unique. |  
| Firstname | String | 15 | Mandatory.| | 
| Lastname | String | 20 | Mandatory.| | 
| DateOfBirth | DateTime | 15 | Date Validation. Mandatory | Storing in YYYY/MM/DD format | 
| EmailAddress | String | 30 | Email Validation. Mandatory.| Email Format |
| ContactNumber | String | 20 | Mandatory.| Must be in “+27 00 000 (0000)” format  |
| UserType | String | 5 | Mandatory.| |
| ApplicationType | String | 5 | Mandatory.| |
| IDNumber | String | 15 | Mandatory.| | 
| Gender | String | 15 | Mandatory.| | 
| ProfilePicture | String | Auto | | |
| ProfilePictureName | String | 50 | | |

   ### Patient
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| PatientId | Number | 10 | Mandatory. Integers only | Primary Key. Must be unique. Foreign Key |  
| AddressLineOne | String | 50 | | | 
| AddressLineTwo | String | 50 | | | 
| SuburbId | Number | 10 | | Foriegn Key | 
| ICEName | String | 20 | Mandatory.| | 
| ICENumber | String | 20 | Mandatory.| Must be in “+27 00 000 (0000)” format  |
| AdditionalInfo | String | 100 | | | 

   ### PatientCondition
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| PatientId | Number | 10 | Mandatory. Integers only | Composite Key. Foreign Key |
| ConditionId | Number | 10 | Mandatory. Integers only | Composite Key. Foreign Key |

   ### Condition
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| ConditionId | AutoNumber | 10 | Mandatory. Integers only | Primary Key. Must be unique. |  
| Conditionname | String | 30 | Mandatory.| | 
| ConditionDescription | String | Auto | | | 

   ### Nurse
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| NurseId | Number | 10 | Mandatory. Integers only | Primary Key. Must be unique. Foreign Key |  
| Grade | String | 5 | Mandatory.| |

   ### Suburb
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| SuburbId | Number | 10 | Mandatory. Integers only | Primary Key. Must be unique. |  
| SuburbName | String | 30 | Mandatory.| | 
| PostalCode | Number | 50 | | | 
| CityId | Number | 10 | | Foriegn Key | 

   ### City
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| CityId | Number | 10 | Mandatory. Integers only | Primary Key. Must be unique. |  
| CityName | String | 20 | Mandatory.| | 
| CityAbbreviation | String | 5 | | | 

   ### PreferredSuburb
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| NurseId | Number | 10 | Mandatory. Integers only | Composite Key. Foreign Key |
| SuburbId | Number | 10 | Mandatory. Integers only | Composite Key. Foreign Key |

   ### Wound
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| WoundId | Number | 10 | Mandatory. Integers only | Primary Key. Must be unique. |  
| WoundName | String | 20 | Mandatory.| | 
| Grade | String | 5 | Mandatory.| |
| WoundDescription | String | Auto | | | 


   ### Contract
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| ContractId | AutoNumber | 10 | Mandatory. Integers only | Primary Key. Must be unique. | 
| ContractDate | DateTime | 15 | Date Validation. Mandatory | Storing in YYYY/MM/DD format |
| StartDate | DateTime | 15 | Date Validation. Mandatory | Storing in YYYY/MM/DD format |
| EndDate | DateTime | 15 | Date Validation. Mandatory | Storing in YYYY/MM/DD format |
| AddressLineOne | String | 50 | | | 
| AddressLineTwo | String | 50 | | | 
| SuburbId | Number | 10 | | Foriegn Key | 
| WoundId | Number | 10 | | Foriegn Key | 
| NurseId | Number | 10 | | Foriegn Key | 
| Status | String | 5 | Mandatory.| |
| Comment | String | Auto | | | 


   ### Visit
| Attribute | Data type | Length | Validation | Business Rule|
| --- | --- | --- | --- | --- |
| VisitId | AutoNumber | 10 | Mandatory. Integers only | Primary Key. Must be unique. | 
| VisitDate | DateTime | 15 | Date Validation. Mandatory | Storing in YYYY/MM/DD format |
| ContractId | Number | 10 | | Foriegn Key | 
| ApproxTime | Time | 15 | Time Validation. Mandatory | Storing in HH:MM format |
| Arrival | Time | 15 | Time Validation. Mandatory | Storing in HH:MM format |
| Departure | Time | 15 | Time Validation. Mandatory | Storing in HH:MM format |
| WoundCondition | String | 150 | | | 
| Note | String | Auto | | | 
</details>

### Relationships
- Each user is either a patient or nurse (One-to-One relationship between User and Patient and Nurse)
- Each patient is afflicated by one or more conditions, and each condition can be burdened by one or more patients (Many-to-Many relationship between Nurse and Condition, resolved by PatientCondition)
- Each nurse operates in one or more suburbs, and each suburb can have one or more nurses working (Many-to-Many relationship between Nurse and Suburb, resolved by PreferredSuburb)
- Each contract is created by one patient, but a patient can create multiple contracts (One-to-Many relationship between Contract and Patient)
- Each contract is created to treat one wound, but the wound can be linked to multiple contracts (One-to-Many relationship between Contract and Wound)
- Each contract is taken by one Nurse, but can take on multiple contracts (One-to-Many relationship between Contract and Nurse)
- Each contract is linked to one suburb, but a suburb can be linked to multiple contracts (One-to-Many relationship between Contract and Suburb)
- Each visit is booked within a contract, but a contract has multiple visits booked (One-to-Many relationship between Contract and Visit)

## Stored Procedures
<details>
  <summary>CRUD</summary>

  ### General Structure
  <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/93de9f0f-2163-4756-b0e0-3af88aafaeec" width=350 /> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/cd76bf1c-fd9b-4917-b710-eb0558bbdc31" width=350 /> 
	<br/>
	This is the general structure for Stored Procedures responsible for Creating, Reading, Updating, and Deleting records from each table. An @Command is coupled with IF-statements to consolidate all CRUD SQL routines pertaining to the same table, thus enhancing organization and maintainability.
	<br/>
	<br/>
	
 ### Create 
 <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/77ca1330-c376-48cd-9305-f342eca59671" width=250/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/871a6420-0937-4852-895e-7ebfc9612172" width=550/>
	<br/>
	Using the `Create command`, a new record is able to be added to the database.
	<br/>
	<br/> 
	
 ### Read
 <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/ab36491b-b693-4e39-a787-cc02c1869515" width=400/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/8a309dc9-2f41-47d8-b262-c05ba7bca68d" width=400/>
	<br/>
	Using the `GetAll command`, all the records within the database that are active are returned. Using the `GetOne` command in conjunction with a primary key ID returns one record if the record is active.
	<br/>
	<br/>

	
 ### Update
 <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/32fbe166-2dd9-448e-89da-c36c2bb211eb" width=350/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/3015a7f0-ba98-4a8c-bffc-8c7f96fca750" width=500/>
	<br/>
	Using the `Update command` in conjunction with a primary key ID updates the record of the ID.
	<br/>
	<br/>
	
 ### Delete
 <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/e87887d4-9488-4663-8837-e715faa8ab13" width=250/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/d5082ef3-ef0f-4ce6-bfd2-3a27587e6c4b" width=250/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/6eea41a0-1893-4d5e-b3c1-370c27cc7209" width=250/> 
	<br/>
	Using the `Delete command` in conjunction with a primary key ID performs a soft delete in which the record still exists on the system, but will not be returned when calling the `GetOne` and `GetAll` commands.
</details>


<details>
  <summary>Reports</summary>

  ### Assigned Patient Contracts
   <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/731165ce-bf3d-45cf-b189-2e372264f981" width=250/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/b9e757f0-b435-444c-80ab-4582cdc771b7" width=600/>
   <br/>
   This report returns the contracts a patient has opened and have been taken on by a nurse.
   <br/>
   <br/>
   
  ### Available Nurses
   <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/9d7344ba-a25e-438c-8b51-48b31d0d3114" width=250/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/82d61074-e3e0-425e-99a1-15f8ea4ea3f9" width=600/>
   <br/>
   This report returns the nurses that have signed up to work in a specific suburb.
   <br/>
   <br/>
   
  ### Care Contracts
   <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/6f5e2ca0-b9c0-4dee-b7bd-8f58b2b21402" width=250/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/d02ddfb6-1cae-439e-8211-454595373069" width=600/>
   <br/>
   This report returns the contracts that were started between specified dates for a specific patient.
   <br/>
   <br/>

   
  ### Contract Status
   <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/c696e58d-8e0c-4982-818c-c603c6969f1f" width=250/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/dff529d8-0d49-4b7a-a4b7-a6a5533c0ff0" width=600/>
   <br/>
   This report returns the contract that have a specific contract status. <br/>
   	A contract can only have 3 statuses:<br/>
    		~ N for "New" - A nurse hasn't taken the contract.<br/>
      		~ A for "Assigned" - A nurse has taken the contract and has started logging care visits.<br/>
		~ C for "Closed" - A nurse has closed the contract because the visits have healed the patient.
   <br/>
   <br/>
   
  ### Contract Visits
   <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/b86bb35d-8b22-4339-b357-f6dbcda27e53" width=250/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/c517ac7d-945e-4217-8178-61bd06421cf4" width=600/>
   <br/>
   This report returns the visits that have been booked/undergone for a specific contract.
   <br/>
   <br/>

  ### Patient Contracts
   <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/a057f0af-1dcb-466c-aa5c-f983200928c8" width=250/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/0f0668fe-ce72-4158-b8c5-8b1d20c97c65" width=600/>
   <br/>
   This report returns all of the contracts a patient has ever started.
   <br/>
   <br/>
   
  ### Patient Visits
   <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/083437ce-3557-4483-b57d-4aac34c92bd9" width=300/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/a041b05d-65f0-42c9-963f-b18447be718a" width=350/>
   <br/>
   This reports returns all of a patient's visits.
   <br/>
   <br/>

  ### Suburb Contracts
   <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/834e0500-87a3-4336-9bac-d54cf0ea223a" width=250/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/9e7d27db-8b53-416b-8821-8a124e894fcf" width=600/>
   <br/>
   This report returns the contracts opened in specified suburbs.
   <br/>
   <br/>

  ### Nurse Contracts
   <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/6b994896-0c13-4869-8c8a-f6724354ec57" width=250/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/333fe501-7f62-45c5-8f63-2d7e8a73b4f5" width=600/>
   <br/>
   This report returns all the contracts a nurse has ever taken on (Closed or Assigned).
   <br/>
   <br/>
   
  ### Nurse Assigned Contracts
   <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/0b32fae4-dff4-43b8-9a4f-fb90a0e0e929" width=250/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/b9c140fd-525c-4139-a32b-453ecbd2d0bb" width=600/>
   <br/>
   This report returns all the contracts a nurse is assigned to.
   <br/>
   <br/>
   
  ### Contracts by Grade
   <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/17891c28-7ba2-4d51-881b-638a275c560e" width=250/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/4d92a7a3-82b8-4466-a5d6-16f9023f7bea" width=600/>
   <br/>
   This report returns all the contracts that have been started in the same suburb as a specified nurse and have the same wound grade as the specified nurse's grade.
   <br/>
   <br/>

  ### Nurse Contracts by Status
   <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/da8270e9-1159-4ddd-a1cb-107e73b6477f" width=250/> <img src="https://github.com/LitMgwebi/Helping-Hands-Database/assets/29978279/36cf262b-2720-4f30-9c42-95c97201f95f" width=600/>
   <br/>
   This report returns all the contracts for a specific nurse with a specified contract status.
   <br/>
   <br/>
</details>
