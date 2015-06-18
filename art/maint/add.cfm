<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
<cfinclude template="../../includes/head.cfm" />
</head>

<body>
<cfinclude template="../../includes/nav.cfm" />
<div class="container">
<cfparam name="variables.err" default="" />
<cfparam name="variables.showForm" default="true" />
<cfparam name="form.artname" default="" />
<cfparam name="form.price" default="0" />
<cfset dao = new art() />

<cfif formposted()>
	form posted
	<!--- validate--->
  <cfset err = validate() />
	<cfif hasErrors()>
	  <ol>
    	<cfoutput>#err#</cfoutput>
    </ol>
	<cfelse>
  	<cfscript>
			dao.create(form);
			location("../index.cfm");
    </cfscript>
	</cfif>
</cfif>


<cfif showform>
  <cfoutput><form action="#cgi.script_name#" method="post"></cfoutput>
		<cfinclude template="_form-elements.cfm" />
		<input type="submit" name="add-record" value="submit" />  
  </form>
</cfif>
</div>


<cffunction name="hasErrors">
	<cfreturn Len(variables.err) GT 0 />
</cffunction>
<cffunction name="formPosted">
	<cfreturn structKeyExists(form,"add-record") && form["add-record"] EQ "submit" />
</cffunction>
<cffunction name="validate">
	<cfset local.result = "" />
	<cfif form.artname EQ "" >
		<cfset local.result &= "<li>art name cant be blank</li>" />
	</cfif>
	<cfif form.artname EQ "len" >
		<cfset local.result &= "<li>no lens allowed</li>" />
	</cfif>
	<cfreturn result />
</cffunction>
</body>
</html>