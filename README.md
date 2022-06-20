# CranewareAssessment
 Creating a simple backend application using C# to view employee information

## Requirements

- .Net Core Version v6.0
- NUnit v3.13.3
- Microsoft.NET.Test.Sdk v17.2.0
- NUnit3TestAdapter v4.2.1
- Visual Studio 19
- MS SQL Server 19
- MS SQL Server Management Studio 19

## Folder Structure

There are 3 components to this code:
- DBScript (for setting up the db and sample data) located is base folder in [DBScripts.sql](https://github.com/Niramay-Kelkar/CranewareAssessment/blob/main/DBScripts.sql)
- Code Snippet (for running the api) located in [WebApplication2/WebApplication2](https://github.com/Niramay-Kelkar/CranewareAssessment/tree/main/WebApplication2/WebApplication2) folder
- Unit Testing Code (for running a sample test to check API) located in [WebApplication2/EmployeeInfo.Tests](https://github.com/Niramay-Kelkar/CranewareAssessment/tree/main/WebApplication2/EmployeeInfo.Tests)

## Prerequisites

- MS SQL Server installed and running (need to put that connection string in the appsettings.json)
- MS SQL Server Management Studio or Azure Data Studio (for running the DB script)
- Visual Studio (for running the code and unit tests)

## Brief Description of files in every component

1. [DBScripts.sql](https://github.com/Niramay-Kelkar/CranewareAssessment/blob/main/DBScripts.sql) : DB Scripts to be run before the code as it has scripts to create the db and tables and insert dummy values in it 
2. [./WebApplication2/WebAppilcation2/Controllers/EmployeeDetails.cs](https://github.com/Niramay-Kelkar/CranewareAssessment/blob/main/WebApplication2/WebApplication2/Controllers/EmployeeDetails.cs) : File where the controller is defined and call via API endpoint is made for fetching data from the db
3. [./WebApplication2/WebApplication2/Employee.cs](https://github.com/Niramay-Kelkar/CranewareAssessment/blob/main/WebApplication2/WebApplication2/Employee.cs) : File where in the model is defined i.e the fields mapped to the columns in the tables
4. [./WebApplication2/EmployeeInfo.Tests/EmployeeControllerTest.cs](https://github.com/Niramay-Kelkar/CranewareAssessment/blob/main/WebApplication2/EmployeeInfo.Tests/EmployeeControllerTest.cs) : Unit testing using NUnit framework to check if db is connected and check if data is fetched from the table for a given employee id

## References

- https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-docker-container-deployment?view=sql-server-ver16&pivots=cs1-bash 
- https://hub.docker.com/_/microsoft-mssql-server?tab=description
- https://carldesouza.com/getting-the-connection-string-to-an-azure-sql-database-using-visual-studio/
