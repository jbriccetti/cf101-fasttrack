<cfcomponent>
	<cfscript>
		this.name = "CF101";
		this.applicationTimeout = createTimeSpan(1,0,0,0); // 1 day
		this.sessionManagement = true;
		this.sessionTimeout = createTimeSpan(0,0,20,0); // 20 minutes
		this.clientManagement = false;
		this.setclientcookies = false; // this turns off the generation of cfid and cftoken - if are using jsessionid, we dont need these
		this.clientStorage = "cookie";
		this.datasource = "cfartgallery"; // used so in cf9 and above, you dont need to specify a datasource in cfquery tags

	</cfscript>

	<cffunction name="onApplicationStart" returntype="boolean" output="true">
    <cflock scope="application" timeout="10" type="exclusive">
      <cfquery name="application.artists" datasource="cfartgallery">
        SELECT * from artists
      </cfquery>
		</cflock>
		<cfreturn true/>
  </cffunction>
	
  <cffunction name="onSessionStart" returntype="void" output="false">
		<cfset session.cart = {"items"=[],"created"=now()} />
	  <cfreturn />
  </cffunction>

	<cffunction name="onRequestStart" returntype="boolean">
		<cfargument name="thePage" type="string" required="yes">
		<h1>the request has started</h1>
		
    <cfreturn true>
	</cffunction>
</cfcomponent>





































<!--- <cfcomponent>
	<!--- 
	http://help.adobe.com/en_US/ColdFusion/9.0/Developing/WSc3ff6d0ea77859461172e0811cbec22c24-7d39.html
	 --->
  <cfscript>
		/**
		* setup base global variables
		*/
		this["vars"] = {};
		this.vars["baseFilePath"] = getDirectoryFromPath(getCurrentTemplatePath());
		this.vars["sep"] = createObject("java", "java.lang.System").getProperty("file.separator");

		this.name = "#hash(this.vars.baseFilePath)#";
		this.applicationTimeout = createTimeSpan(1,0,0,0); // 1 day
		this.sessionManagement = true;
		this.sessionTimeout = createTimeSpan(0,0,20,0); // 20 minutes
		this.clientManagement = false;
		this.setclientcookies = false; // this turns off the generation of cfid and cftoken - if are using jsessionid, we dont need these
		this.clientStorage = "cookie";
		this.datasource = "cfartgallery"; // used so in cf9 and above, you dont need to specify a datasource in cfquery tags
		//this["customtagpaths"] = "#listAppend(this.vars.baseFilePath&"lib","customtags",this.vars.sep)#";
		this["mappings"] = {"lib"="#this.vars.basefilepath#cfcs"}; // these dont resolve for extends attributes in an Application.cfc

	</cfscript>


  <!--- EVENTS --->
<!---   <cffunction name="onApplicationStart" returntype="boolean" output="true">
		<cfreturn true/>
  </cffunction> --->
 <!---  <cffunction name="onApplicationEnd" returntype="void" output="false" hint="This event fires when the application timesout. while we are currently not executing any code in this event it, it is stubbed out here so we can perform needed debugging by using cflog to note the application end event.">
    <cfargument name="appScope" />
		<cflog file="#this.name#" type="information" text="SHUTDOWN #this.name#">
  	<cfreturn true />
  </cffunction> --->


  <!--- <cffunction name="onSessionStart" returntype="void" output="false">
		<cfset session.cart = {"items"=[],"created"=now()} />
	  <cfreturn />
  </cffunction> ---> 
  <!--- <cffunction name="onSessionEnd" returntype="void" output="true">
    <cfargument name="sessionScope" />
    <cfargument name="appScope" />
    <cfreturn true />
  </cffunction> --->
	
	<cffunction name="onRequestStart" returntype="boolean">
	  <cfargument name="thePage" type="string" required="true">
	  <cfscript>
			request.app =this;
    </cfscript>
		<cfreturn true>
	</cffunction>

  <!--- <cffunction name="onRequestEnd" returntype="void" output="true">
    <cfargument name="thePage" />
    <cfreturn super.onRequestEnd(thePage) />
  </cffunction> --->
	 
	
  <!--- <cffunction name="onError" returntype="void" output="true">
    <cfargument name="exception" />
    <cfargument name="eventname" />
    <!--- <cfdump var="#exception#" label="" abort="true"> --->
    <cfreturn super.onError(exception,eventname)/>
  </cffunction> --->
  
	<!--- <cffunction name="onMissingTemplate" returntype="boolean">
	  <cfargument name="targetPage" type="string" required="yes" />
	  <cfreturn super.onMissingTemplate(targetPage)/>
  </cffunction> --->
      
	<!--- <cffunction name="oncfcRequest" returnType="void"> 
    <cfargument type="string" name="cfcname"> 
    <cfargument type="string" name="method"> 
    <cfargument type="struct" name="args"> 
	</cffunction> --->


  <cffunction name="displayDate" output="true" access="public" returntype="any" hint="HINT">
		<cfargument name="thedate" type="date" required="no" default="#now()#" hint="HINT" />
		<cfoutput>#dateformat(thedate,"yyyy-mm-dd")#</cfoutput>

		<cfreturn />
	</cffunction>


</cfcomponent> --->