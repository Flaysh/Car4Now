This car rental application based on Client-server model. In this application we used Relational Database - SQL Server, Server side technologies: C#, SQL, Entity Framework and RESTful Service (Web API) and Client side technologies: HTML, CSS, Bootstrap, JavaScript, TypeScript, Angular 7 and AJAX.

Data Base
The Data Base contains five tables: Users: This table contains inforamtion about the users like Username, Password etc. Cars: This table contains inforamtion about the cars like CarID, Model etc. CarDetails: This table contains cardetails like CarNumber, CarType etc. Rentals: This table contains inforamtion about the rentals like RentalID, UserID etc. Branches: This table contains inforamtion about the branches like BranchID, Address.

Server side
The Server side was built according to the 3-tier model:

Data Access Layer (DAL)
The DAL contains the Entity Framework for retrieving data from existing Database.

Business Logic Layer (BLL)
The BLL controls the functionality of the application by performing data processing.

User Interface Layer (UI)
The UI is responsible for managing user interaction with the application.
