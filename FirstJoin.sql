SELECT*
From
	classes_t JOIN student_info_t
	ON
		classes_t.class_id = student_info_t.name
	
	