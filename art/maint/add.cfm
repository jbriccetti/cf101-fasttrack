<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>
<cfparam name="variables.err" default="" />
<cfparam name="variables.showForm" default="true" />
<cfparam name="form.artname" default="" />

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
			dao = new art();
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



<cffunction name="hasErrors">
	<cfreturn Len(variables.err) GT 0 />
</cffunction>
<cffunction name="formPosted">
	<cfreturn structKeyExists(form,"add-record") && form["add-record"] EQ "submit" />
</cffunction>
<cffunction name="validate">
	<cfset local.result = "" />
	<cfif form.artname EQ "">
		<cfset local.result &= "<li>art name cant be blank</li>" />
	</cfif>
	<cfreturn result />
</cffunction>
</body>
</html>