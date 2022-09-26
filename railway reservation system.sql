CREATE TABLE Train (
    Train_no INT NOT NULL,
    Train_name VARCHAR(255) NOT NULL,
    Train_type VARCHAR(255) NOT NULL,
    Destination VARCHAR(255),
    Availblity VARCHAR(255),
    Arrival VARCHAR(255),
    PRIMARY KEY (Train_no)
);

CREATE TABLE Compartment (
    Compartment_no INT NOT NULL,
    Type VARCHAR(225),
    Capacity INT,
    Availablity INT DEFAULT 'Yes',
    Train_no INT,
    PRIMARY KEY (Compartment_no),
    FOREIGN KEY (Train_no)
        REFERENCES Train (Train_no)
); 

CREATE TABLE Route_Info (
    From_Station_no INT NOT NULL,
    From_station_Name VARCHAR(255),
    TO_Station_no INT NOT NULL,
    TO_station_Name VARCHAR(255),
    Distance INT,
    Train_no INT,
    PRIMARY KEY (From_Station_no , TO_Station_no),
    FOREIGN KEY (Train_no)
        REFERENCES Train (Train_no)
); 
                   
CREATE TABLE Users (
    User_Id INT NOT NULL,
    User_type VARCHAR(255),
    pincode VARCHAR(255),
    Street_no VARCHAR(255),
    Fname VARCHAR(255),
    Lname VARCHAR(255),
    DOB DATE,
    PRIMARY KEY (User_Id)
);
                   
CREATE TABLE User_Train (
    Date_time_Stamp INT NOT NULL,
    User_Id INT,
    Train_no INT,
    FOREIGN KEY (Train_no)
        REFERENCES Train (Train_no),
    FOREIGN KEY (User_Id)
        REFERENCES Users (User_Id)
);    

CREATE TABLE User_Phone (
    Phone_no INT NOT NULL,
    User_Id INT,
    FOREIGN KEY (User_Id)
        REFERENCES Users (User_Id),
    PRIMARY KEY (Phone_no)
);
                        
                   
CREATE TABLE Ticket (
    PRN INT NOT NULL,
    Train_Number INT,
    Travel DATE,
    Departure VARCHAR(255),
    Departure_time TIME,
    Arrival_time TIME,
    User_Id INT,
    PRIMARY KEY (PRN),
    FOREIGN KEY (User_Id)
        REFERENCES Users (User_Id)
);
 
CREATE TABLE Ticket_Passenger (
    Seat_no INT NOT NULL,
    Name VARCHAR(225),
    Age INT,
    PRN INT,
    PRIMARY KEY (Seat_no),
    FOREIGN KEY (PRN)
        REFERENCES Ticket (PRN)
); 
                              
CREATE TABLE Payment_info (
    Transaction_Id INT NOT NULL,
    Bank VARCHAR(225),
    Card_no INT,
    Price INT,
    PRN INT,
    FOREIGN KEY (PRN)
        REFERENCES Ticket (PRN),
    PRIMARY KEY (Transaction_Id)
);
                        
CREATE TABLE Fare_Table (
    Train_type INT NOT NULL,
    Compartment_Type VARCHAR(225) NOT NULL,
    Fare_PerKM INT,
    PRIMARY KEY (Train_type , Compartment_Type)
); 

ALTER table ticket_passenger ADD CHECK(Age>=5); 

RENAME TABLE ticket_passeger to invoice;

Create view low_price AS select PRN,Price from Payment_info where price<=500;

TRUNCATE TABLE user_phone; 

DROP TABLE user_phone; 

 

                  
