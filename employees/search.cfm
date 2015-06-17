<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>cf101</title>
<cfinclude template="../includes/head.cfm" />
</head>

<body>
<cfinclude template="../includes/nav.cfm" />
<div class="container">
	<form method="post" action="search-results.cfm">
  <div class="form-group">
    <label for="exampleInputEmail1">Last Name</label>
    <input name="last_name" type="text" class="form-control" id="exampleInputEmail1">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">First Name</label>
    <input name="first_name" type="text" class="form-control" id="exampleInputPassword1">
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
</form>
</div>
</body>
</html>