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
  <img src="" width=400 /> <img src="" width=400 />
	<br/>
	This is the general structure for Stored Procedures responsible for Creating, Reading, Updating, and Deleting records from each table. An @Command is coupled with IF-statements to consolidate all CRUD SQL routines pertaining to the same table, thus enhancing organization and maintainability.
	<br/>
	<br/>
	
 ### Create 
 <img src="" width=300/> <img src="" width=600/>
	<br/>
	Using the `Create command`, a new record is able to be added to the database.
	<br/>
	<br/> 
	
 ### Read
 <img src="" width=450/> <img src="" width=450/>
	<br/>
	Using the `GetAll command`, all the records within the database that are active are returned. Using the `GetOne` command in conjunction with a primary key ID returns one record if the record is active.
	<br/>
	<br/>
	
 ### Update
 <img src="" width=300/> <img src="" width=600/>
	<br/>
	Using the `Update command` in conjunction with a primary key ID updates the record of the ID.
	<br/>
	<br/>
	
 ### Delete
 <img src="" width=200/> <img src="" width=350/> <img src="" width=350/> 
	<br/>
	Using the `Delete command` in conjunction with a primary key ID performs a soft delete in which the record still exists on the system, but will not be returned when calling the `GetOne` and `GetAll` commands.
</details>

<details>
  <summary>Reports</summary>

  ###
   <img src="" width=300/> <img src="" width=600/>
</details>
