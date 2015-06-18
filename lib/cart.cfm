<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>

<cfscript>
	//cart = createObject("component","cart").init();
	cart = new cart();
	cart.add("book");
	cart.add("cd");
	cart.add("book");
	cart.display();
	cart.delete(2);
	cart.display();

	cart.add("cd");
	cart.add("book");
	cart.display();

	cart.add("cd");
	cart.add("book");
	cart.add("cd");
	cart.add("book");
	cart.add("cd");
	cart.add("book");
	cart.add("cd");
	cart.add("book");
	cart.add("cd");
	cart.add("book");
	cart.add("cd");
	cart.add("book");
	cart.add("cd");
	cart.add("book");
	cart.add("cd");
	cart.add("book");
	cart.add("cd");
	cart.add("book");
	cart.add("cd");
	cart.add("book");
	cart.add("cd");
	cart.add("book");
	cart.add("cd");
	cart.add("book");
	cart.add("cd");
	cart.add("book");
	cart.add("cd");
	cart.add("book");
	cart.add("cd");
	cart.add("book");
	cart.add("cd");
	cart.add("book");
	cart.display();
	cart.setName("olivers's awesome cart");
	cart.display();
</cfscript>

<cfdump var="#cart.getItems()#" />



</body>
</html>