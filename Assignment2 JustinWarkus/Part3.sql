-----Justin-Thomas Warkus-Fortin


SELECT * FROM student_info_t
WHERE school LIKE 'A%';


SELECT * FROM student_info_t
WHERE name LIKE 'J%'
ORDER BY name ASC;

SELECT * FROM classes_t
WHERE core_classes = 'No';

SELECT * FROM classes_t
WHERE core_classes = 'Yes';

SELECT * 
FROM 
	student_info_t JOIN school_info_t 
	ON 
		student_info_t.school = school_info_t.name_of_school;

SELECT * 
FROM 
	student_info_t JOIN school_info_t 
	ON 
		student_info_t.address = school_info_t.address;
----Students living on residence would count
		


SELECT name FROM student_info_t
UNION
SELECT name_of_school FROM school_info_t;


SELECT DISTINCT school
FROM student_info_t;

SELECT COUNT(name) 
FROM student_info_t;

SELECT COUNT(programs)
FROM school_info_t;

SELECT age FROM student_info_t
ORDER BY age;



