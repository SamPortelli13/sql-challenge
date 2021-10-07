Update employees_input 
set birth_date= TO_DATE(birth_date_in,'MM/DD/YYYY'),
	hire_date= TO_DATE(hire_date_in,'MM/DD/YYYY');