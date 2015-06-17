<cfparam name="url.debug" default="false" />
<!--- make sure the parameter we need for the page exists --->
<cfparam name="url.emp_no" default="0" />
<!--- make sure it's numeric --->
<cfif NOT isNumeric(url.emp_no)>
	<cfset url.emp_no = 0 />
</cfif>

<!--- <cfif NOT isDefined("url.emp_no") OR NOT isNumeric(url.emp_no)>
	<cflocation url="index.cfm" addtoken="no" />
</cfif> --->

<cfquery name="q" datasource="#dsn#" result="info">
	SELECT *  
  FROM employees 
  JOIN salaries ON employees.emp_no = salaries.emp_no
	<!--- WHERE employees.emp_no = #url.emp_no# --->
  WHERE employees.emp_no = 
  <cfqueryparam cfsqltype="cf_sql_integer" value="#url.emp_no#" />
  ORDER BY TO_DATE DESC
</cfquery>

<cfif q.recordcount EQ 0>
	<cflocation url="index.cfm" addtoken="no" />
</cfif>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Employee Detail Information</title>
  <cfinclude template="../includes/head.cfm" />

</head>

<body>
<cfinclude template="../includes/nav.cfm" />

<cfif url.debug EQ "true">
  <cfdump var="#url#" label="url variables" />
  <cfdump var="#info#" label="information from the result attribute of cfquery" />
  <cfdump var="#getMetaData(q)#" label="information from the getMetaData global function about the query" />
  <cfdump var="#q#" label="the query" />
</cfif>



    <div class="container">

      <div class="starter-template">
        <h1>Employee Information</h1>
        <div class="panel panel-default">
          <div class="panel-heading">
          	<cfoutput>#q.first_name# #q.last_name#</cfoutput>
          </div>
          <div class="panel-body">
            <p>next years salary:<cfoutput>#calcNewSalary(q.salary)#</cfoutput></p>
            <ul class="list-group">
						<cfoutput query="q">
							<li class="list-group-item">#dateformat(from_date,"mm/dd/yyyy")# #dollarformat(salary)#</li>
						</cfoutput>
          	</ol>
            <cfdump var="#q#" />
          </div>
        </div>

      </div>

    </div>

</body>
</html>
<cfdump var="#variables#" />
  

<cffunction name="calcNewSalary">
	<cfargument name="currentpay" />
  <cfset local.rate = 1.1 />
  <cfreturn currentpay * rate />
</cffunction>