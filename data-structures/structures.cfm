<cfscript>
	employee = structNew();
	employee.first_name = "Jon";
	employee["last_name"] = "Briccetti";
	employee.age = 47;
	employee.isAwesome = true;
	//writedump(employee);

	employee = arrayNew(1);
	employee[1] = "Jon";
	employee[2] = "Briccetti";
	employee[3] = 47;
	employee[4] = true;

	//writedump(employee);
	
	
	data = {};
	data["first"] = "Jon";
	data["age"] = 47;
	data["middle"] = "louis";
	data["last"] = "Briccetti";
	keyname = "age";
	writeoutput(data[keyname]);
	//writedump(data);
</cfscript>

<cfloop collection="#data#" item="i">
	<cfoutput>#data[i]#</cfoutput>
</cfloop>


<!--- Create a structure and loop through its contents. ---> 
<cfset Departments = StructNew()> 
<cfset val = StructInsert(Departments, "John ", "Sales ")> 
<cfset val = StructInsert(Departments, "Tom ", "Finance ")> 
<cfset val = StructInsert(Departments, "Mike ", "Education ")> 
<!--- Build a table to display the contents ---> 
<cfoutput> 
<table> 
    <tr> 
        <td><b>Employee</b></td> 
        <td><b>Dept.</b></td> 
    </tr> 
<!--- Use item to create the variable person to hold value of key as loop runs. ---> 
<cfloop collection = "#Departments#" item = "person"> 
    <tr> 
        <td>#person#</td> 
        <td>#Departments[person]#</td></tr> 
</cfloop> 
</table> 
</cfoutput>