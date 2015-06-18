<cfcomponent>
<cfset this.vars= {} />
<cfset this.vars.msg = "global" />
<cfset this.vars.dsn ="employeedb" />
<cfset this.vars.baseURL = "http://#cgi.http_host#/cf101/" />



	<cffunction name="onRequestStart" access="public" returntype="boolean">
		<cfargument name="thePage" type="string" required="yes">
		<cfset request.app = this />
		<cfset request.vars = this.vars />


		<cfreturn true>
	</cffunction>
  
   <cffunction name="displayDate" output="true" access="public" returntype="any" hint="HINT">
		<cfargument name="thedate" type="date" required="no" default="#now()#" hint="HINT" />
		<cfoutput>#dateformat(thedate,"yyyy-mm-dd")#</cfoutput>

		<cfreturn />
	</cffunction>

  
</cfcomponent>