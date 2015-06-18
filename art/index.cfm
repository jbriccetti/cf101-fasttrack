<cfparam name="url.sort" default="artname" />
<cfif NOT listFindNoCase("artname,price",url.sort)>
	<cfset url.sort = "artname" />
</cfif>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>cf101</title>
<cfinclude template="../includes/head.cfm" />
</head>

<!--- use cfquery to select all the art in the cfartgallery database --->
<cfquery name="qart" datasource="cfartgallery">
  SELECT ARTID,ARTNAME,DESCRIPTION,PRICE
  FROM ART
  ORDER BY #url.sort# ASC
</cfquery>
<body>
<cfinclude template="../includes/nav.cfm" />
<div class="container">
<div class="text-right"><a href="maint/add.cfm">add new</a></div>
<ul class="nav nav-tabs">
  <li role="presentation" <cfif url.sort EQ "artname">class="active"</cfif>><a class="btn btn-default" href="index.cfm?sort=artname">sort by name</a></li>
  <li role="presentation" <cfif url.sort EQ "price">class="active"</cfif>><a class="btn btn-default" href="index.cfm?sort=price">sort by price</a></li>
</ul>


<cfoutput query="qart">
<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">#artname#</h3>
  </div>
  <div class="panel-body">
  	<div>#dollarformat(price)#</div>
  	<div>#description#</div>
    <a class="btn btn-default btn-sm" href="details.cfm?artid=#qart.artid#">more info</a>
    <a class="btn btn-default btn-sm" href="maint/edit.cfm?artid=#qart.artid#">edit</a>
  </div>
</div>
</cfoutput>
<!--- use cfoutput to display the art from the query. display the art name, the description and the price --->
<!--- next, make each list item a link to details.cfm, pass the artid on the url --->
<!--- bonus - format the price to use dollars --->

</div>
</body>
</html>