 --Hotel managing system
 CREATE TABLE  Hotel (
	HotelID INT PRIMARY KEY,
	name VARCHAR(25),
	rate DECIMAL(5,2),
	reception_number INT,
	address VARCHAR(255)
);
CREATE TABLE Room(
	RoomID INT,
	number_of_beds INT,
	type VARCHAR(25),
	rate DECIMAL(5,2),
	price DECIMAL(10,2),
	HotelID INT,
	FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID) --This foreign key is used to now in which hotel this room is placed
);
ALTER TABLE Room ADD PRIMARY KEY (RoomID);
CREATE TABLE Reservation (
	ReservationID INT,
	number_of_day INT,
	RoomID INT, 
	HotelID INT,
	FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID), --This foreign key is used to know in which hotel
	FOREIGN KEY (RoomID) REFERENCES Room(RoomID) --And which room was reservated
);
ALTER TABLE Reservation ADD PRIMARY KEY (ReservationID); 

CREATE TABLE Users (
	UserID INT PRIMARY KEY,
	name VARCHAR (255),
	surname VARCHAR (255),
	gender VARCHAR(11),
	contact_number VARCHAR(11),
	HotelID INT,
	ReservationID INT,
	FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID), --Foreign key is used to know in which hotel user is leaving 
	FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID) --And what is reservationID, by reservationID we can find his room
);
CREATE TABLE Managers (
	ManagerID INT PRIMARY KEY,
	name VARCHAR(255),
	surname VARCHAR(255),
	contact_number VARCHAR(11),
	working_experience VARCHAR(5),
	salary DECIMAL (12,4),
	HotelID INT,
	FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID) --Foreign key is used to know in which hotel manager working
);

CREATE TABLE JobDescription(
	JobID INT PRIMARY KEY,
	name VARCHAR(50),
	description VARCHAR (255),
	salary  DECIMAL (12,4),
	skills VARCHAR (50)
);

CREATE TABLE Employees (
	EmployeeID INT PRIMARY KEY,
	name VARCHAR (255),
    surname VARCHAR(255),
	contact VARCHAR (60),
	marital_status VARCHAR (30),
	working_experience VARCHAR(10),
	JobID INT,
	ManagerID INT,
	HotelID INT,
	FOREIGN KEY (JobID) REFERENCES JobDescription(JobID), --Foreign key is used to get info about employees job
	FOREIGN KEY (ManagerID) REFERENCES Managers(ManagerID), --Foreign key is used to know who is the manager of this employee
	FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID) --Foreign key is used to know in which hotel worker works
);


CREATE TABLE Restaurants (
	RestaurantID INT PRIMARY KEY,
	floor VARCHAR(122),
	number_of_tables VARCHAR(255),
	HotelID INT,
	FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID) --Foreign key is used to know in which hotel this restaurant is placed
);

CREATE TABLE Menu(
	DishID INT PRIMARY KEY,
	name VARCHAR (60),
	description VARCHAR(255),
	price DECIMAL(10,2),
	RestaurantID INT,
	FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID) --Foreign key is used to store in which restaurant this dish can be ordered
);

CREATE TABLE DishUser( --This whole table is used to track user's order
	ID INT PRIMARY KEY,
	DishID INT,
	UserID INT,
	FOREIGN KEY (DishID) REFERENCES Dishes(DishID), --It will take dishID from Dishes table
	FOREIGN KEY (UserID) REFERENCES Users(UserID) --It will take userID from Users table
);

CREATE TABLE AdditionalServices (
	ServiceID INT PRIMARY KEY,
	name VARCHAR(255),
	description VARCHAR(255),
	price DECIMAL(10,2),
	age_limitations VARCHAR(255),
	HotelID INT,
	FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID) --This foreign key is used to know in which hotel this Additional service is work
);

CREATE TABLE UserService ( --This whole table is used to track which user was using services and what services did user used
    ID INT PRIMARY KEY, 
	ServiceID INT,
	UserID INT,
	FOREIGN KEY (ServiceID) REFERENCES AdditionalServices(ServiceID), --This foreign key is used to take ID of additional service
	FOREIGN KEY (UserID) REFERENCES Users(UserID) -- This will take ID from Users table
);
