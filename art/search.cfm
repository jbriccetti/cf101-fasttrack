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
	<form action="search-results.cfm" method="post">
    <div class="form-group">
      <label for="artname">Art Name</label>
      <input name="artname" type="text" class="form-control" id="artname" placeholder="Art Name">
    </div>
  <div class="form-group">
    <label for="price">max price</label>
    <input name="price" type="text" class="form-control" id="price" placeholder="specify max price">
  </div>
  <div class="checkbox">
    <label>
      <input name="issold" type="checkbox"> include sold items in search
    </label>
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
</form>
</div>
</body>
</html>