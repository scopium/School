CREATE TABLE Student
(
SID int NOT NULL AutoNumber,
FirstName varchar(255) NOT NULL,
LastName varchar(255) NOT NULL,
Address varchar(255),
Zip int,
Major varchar(255),
Status varchar(255),
PRIMARY KEY (SID)
);

CREATE TABLE Class
(
ClassID int NOT NULL
Name varchar(255) NOT NULL UNIQUE
Credits int
CONSTRAINT MINIMUM '1'
CONSTRAINT MAXIMUM '4'
CONSTRAINT NOT NULL
CONSTRAINT ERROR MESSAGE 'you entered a bad value.',
Description varchar(255),
PRIMARY KEY (ClassID)
);

CREATE TABLE Instructor 
(
 InstructorID int NOT NULL AutoNumber,
FirstName varchar(255) NOT NULL,
LastName varchar(255) NOT NULL,
Dept varchar(255),
YearsService int,
StartDate Date,
PRIMARY KEY (InstructorID)
);

CREATE TABLE Schedule
(
ClassStart  DATE NOT NULL,
ClassEnd DATE, 
Instructor varchar(255)
Time varchar(50)
Campus varhchar(255),
RoomNo int,
Term  varchar(255),
Grade ENUM("A","B","C","D","E","F","I","W"),
SID int,
ClassID int,
PRIMARY KEY (ClassStart),
CONSTRAINT fk_StuSchedule FOREIGN KEY (SID) REFERENCES Student(SID)
CONSTRAINT fk_ClassSchedule FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

CREATE TABLE Approved_Course 
(
ApprovedFlag ENUM (1,0),
DateApproved Date,
CONSTRAINT fk_ClassAC FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
CONSTRAINT fk_InstAC FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);


CREATE TABLE Campus 
(
CampusID int NOT NULL UNIQUE PRIMARY KEY,
Name varchar(255),
Address varchar(255),
Phone int,
DeanName varchar(255),
);

CREATE TABLE Room 
(
RoomNo int NOT NULL UNIQUE PRIMARY KEY,
Size int,
Lab_Flag ENUM (1,0),
Capacity int,
Phone int,
CONSTRAINT fk_RoomCampusID FOREIGN KEY (CampusID) REFERENCES Campus(CampusID)
);

CREATE TABLE Facilities 
(
FacilityID int NOT NULL UNIQUE PRIMARY KEY,
Description varchar(255)
)

CREATE TABLE Room_Facilities (
CONSTRAINT fk_RFFacilityID FOREIGN KEY (FacilityID) REFERENCES Facilities(FacilityID),
CONSTRAINT fk_RFCampusID FOREIGN KEY (CampusID) REFERENCES Room(CampusID),
CONSTRAINT fk_RFRoomNo FOREIGN KEY (RoomNo) REFERENCES Room(RoomNo)
);