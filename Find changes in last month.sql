/* Find changes in the last month */

Select 
	NAME, 
	create_date, 
	modify_date, 
	type_desc 
from 
	SYS.objects
	where (create_date > dateadd(MM, -1, GETDATE()) or modify_date > dateadd(MM, -1, GETDATE()))
Order by modify_date desc, create_date DESC 
