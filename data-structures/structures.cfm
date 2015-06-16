<cfscript>
	employee = structNew();
	employee.first_name = "Jon";
	employee["last_name"] = "Briccetti";
	employee.age = 47;
	employee.isAwesome = true;
	writedump(employee);

	employee = arrayNew(1);
	employee[1] = "Jon";
	employee[2] = "Briccetti";
	employee[3] = 47;
	employee[4] = true;

	writedump(employee);
</cfscript>