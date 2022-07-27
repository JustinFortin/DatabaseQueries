-----Justin-Thomas Warkus-Fortin


DROP TABLE Student_Info_t
CREATE TABLE Student_Info_t(
	Address VARCHAR (50) NOT NULL,
	Name VARCHAR (50) NOT NULL,
	School VARCHAR (50),
	Age int NOT NULL,
	Sin_number int NOT NULL PRIMARY KEY
);

DROP TABLE School_Info_t
CREATE TABLE School_Info_t (
	Address VARCHAR (50) NOT NULL,
	Name_Of_School VARCHAR (50) NOT NULL PRIMARY KEY,
	Programs VARCHAR (50)
);

DROP TABLE Classes_t
CREATE TABLE Classes_t (
	Class_ID VARCHAR (50) PRIMARY KEY NOT NULL,
	Prof_Names VARCHAR (50), 
	Core_classes VARCHAR (50)
);

DROP TABLES Student_Activities_t
CREATE TABLE Student_Activities_t (
	Sports_teams VARCHAR (50),
	Gaming_teams VARCHAR (50),
	Clubs VARCHAR (50)
);

CREATE INDEX Students
ON student_info_t (address, name, school, age, sin_number);

CREATE INDEX Schools
ON school_info_t (address, name_of_school, programs);


CREATE VIEW Algonquin_students AS
SELECT name, school
FROM student_info_t
WHERE school = 'Algonquin';
	
