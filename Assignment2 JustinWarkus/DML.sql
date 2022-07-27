-----Justin-Thomas Warkus-Fortin


SELECT * FROM Student_Info_t;
DELETE FROM Student_Info_t;
INSERT INTO Student_Info_t (Address, Name, School, Age, sin_number) 
VALUES ('90 Monterey Drive', 'Justin Fortin', 'Algonquin College', '18', '123456');
INSERT INTO Student_Info_t (Address, Name, School, Age, sin_number) 
VALUES ('27 Portobello drive', 'Jack Stronge', 'Algonquin College', '19', '654321');
INSERT INTO Student_Info_t (Address, Name, School, Age, sin_number) 
VALUES ('250 Greenbank Drive', 'Alex Stranges', 'Algonquin College', '18', '652585');
INSERT INTO Student_Info_t (Address, Name, School, Age, sin_number) 
VALUES ('65 Sandra Street', 'Mark LaFlamme', 'Cambrian College', '22', '951854');
INSERT INTO Student_Info_t (Address, Name, School, Age, sin_number) 
VALUES ('985 Ottawa Street', 'Jim Hudson', 'Flemming College', '17', '956874');

SELECT * FROM School_Info_t;
DELETE FROM School_Info_t;
INSERT INTO School_Info_t (Address, Name_Of_School, Programs) 
VALUES ('Woodroffe ave', 'Algonquin College');
INSERT INTO School_Info_t (Address, Name_Of_School, Programs) 
VALUES ('College ave', 'Flemming College');
INSERT INTO School_Info_t (Address, Name_Of_School, Programs) 
VALUES ('Ramsey ave', 'Cambrian College');

SELECT * FROM Classes_t;
DELETE FROM Classes_t;
INSERT INTO Classes_t (Class_ID, Core_Classes) 
VALUES ('CST8215', 'Yes');
INSERT INTO Classes_t (Class_ID, Core_Classes) 
VALUES ('MATC8001', 'Yes');
INSERT INTO Classes_t (Class_ID, Core_Classes) 
VALUES ('CST8300', 'No');
INSERT INTO Classes_t (Class_ID, Core_Classes) 
VALUES ('CST8110', 'Yes');

SELECT * FROM Student_Activites_t;
DELETE FROM Student_Activities_t;
INSERT INTO Student_Activities_t (Sports_teams, Gaming_teams, Clubs) 
VALUES ('Soccer', 'Smash_Bros', 'Chess');
INSERT INTO Student_Activities_t (Sports_teams, Gaming_teams, Clubs) 
VALUES ('Basketball', 'Rocket League', 'Environment');
