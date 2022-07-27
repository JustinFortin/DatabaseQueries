CREATE INDEX Students
ON student_info_t (address, name, school, age, sin_number)

CREATE INDEX Schools
ON school_info_t (address, name_of_school, programs)

SELECT * FROM student_info_t join school_info_t ON student_info_t.school = school_info_t.name_of_school

SELECT * FROM 
Student_Info_t ORDER BY name;
