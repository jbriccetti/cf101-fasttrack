<cfscript>
	employees = [];
	employee = {};
	
	employee["First_Name"] = "Jon";
	employee["Last_Name"] = "Briccetti";
	employee["Age"] = 47;
	employee["isMember"] = true;
	ArrayAppend(employees,employee);

	employee = {};
	employee["First_Name"] = "Joe";
	employee["Last_Name"] = "Malohney";
	employee["Age"] = 21;
	employee["isMember"] = false;
	ArrayAppend(employees,employee);
	
	writedump(employees);


	info = [{"name"="jon","age"=47}
	,{"name"="bill","age"=27}
	,{"name"="dale","age"=19}
	];
	writedump(info);
	
	str = '[{"name":"jon","age":47},{"name":"bill","age":27},{"name":"dale","age":19}]';
	if(isJSON(str)){
		newdata = DeserializeJSON(str);
		writedump(newdata);
	}
</cfscript>

