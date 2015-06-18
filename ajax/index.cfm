<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>

<!--- 
create a component that returns data
call the component from coldfusion and dump the data to confirm
write an html page with (2) drops downs: artist & artwork
code the "changed" event of the make drop down to call back to our cfc and get the art work for a particular artist
 --->
<cfquery name="artists" datasource="cfartgallery">
	SELECT artistid AS id, firstname AS fname, lastname as lname FROM artists
	WHERE exists (select * from art where art.artistid = artists.	artistid)
</cfquery>


<cfif structKeyExists(form,"submit")>
	<cfinclude template="_process.cfm" />
</cfif>

<form id="artform" action="index.cfm" method="post">

	<cfinclude template="_form-elements.cfm" />

	<input type="submit" name="submit" />
</form>
<div id="pic"></div>

<script src="http://code.jquery.com/jquery.min.js" ></script>

<script type="text/javascript" charset="utf-8">
	$(document).ready(function name() {
		$("#artist").bind("click", function(e){
			showArt($(this).val());
    });
		$("#art").bind("click", function(e){
			showPic($(this).find(":selected"));
    });
	});

	function showPic(option){
		var pic = option.attr("data-img");
		$("#pic").html('<img src="images/'+pic+'" />');
	}

	function showArt(id){
		// call something on the server without reloading the page using magic get a list? array? some sort of series of values to put in the art selectbox
		//call this url: 
		var serviceURL = "http://localhost:8500/cf101/ajax/service.cfc?method=getart";
		$.getJSON(serviceURL,{artistid: id, ajax: 'true'}, function(j){
				$("#art").html(buildOptions(j,"NAME","ID","SRC"));
				showPic($("#art").find(":first-child"));
			});
	}
	
	function buildOptions(ary,displayCol,valCol,imgCol){
		var options = '';
		for (var i = 0; i < ary.length; i++) {
			options += '<option data-img="'+ary[i][imgCol]+'" value="' + ary[i][valCol] + '">' + ary[i][displayCol]+ '</option>';
		}	
		return options;
	}
</script>



</body>
</html>