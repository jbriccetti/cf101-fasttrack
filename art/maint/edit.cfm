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
<cfset dao = new art() />

<cfif formposted()>
	form posted
	<!--- validate--->
  <cfif isDelete()>
		<cfscript>
    dao.deletebyid(form.artid);
    location("../index.cfm");
		</cfscript>
	<cfelse>
		<cfset err = validate() />
    <cfif hasErrors()>
      <ol>
        <cfoutput>#err#</cfoutput>
      </ol>
    <cfelse>
      <cfscript>
        dao.update(form);
        location("../index.cfm");
      </cfscript>
    </cfif>
	</cfif>
<cfelse>
	<!--- the form didnt post so its the first trip to the page. get art id from the url (it has to be there) --->
  <cfparam name="url.artid" />
	<!--- go get the record --->
	<cfscript>
  record = dao.getbyID(url.artid);
  structAppend(form,record);
	</cfscript>
</cfif>


<cfif showform>
  <cfoutput><form action="#cgi.script_name#" method="post"></cfoutput>
		<cfinclude template="_form-elements.cfm" />
    <cfoutput><input type="hidden" name="artid" value="#form.artid#" /></cfoutput>
		<input type="submit" name="update-record" value="update" />  
		<input type="submit" name="update-record" value="delete" />  
  </form>
</cfif>



<cffunction name="hasErrors">
	<cfreturn Len(variables.err) GT 0 />
</cffunction>
<cffunction name="formPosted">
	<cfreturn (structKeyExists(form,"update-record") && form["update-record"] EQ "update")
    || (isDelete())
     />
</cffunction>
<cffunction name="isDelete">
  <cfreturn structKeyExists(form,"update-record") && form["update-record"] EQ "delete" />
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