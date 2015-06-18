<cfcomponent author="jon">
  <cffunction author="jon" name="calcNewSalary" returntype="numeric" hint="this calculates a new salary based on a standard inflation rate">
    <cfargument author="jon" name="currentpay" required="yes" hint="the employees current pay" />
    <cfargument author="jon" name="rate" required="no" hint="the employees current pay" />
    <cfset local.rate = 1.1 />
    <cfif isDefined("arguments.rate")>
			<cfset local.rate = arguments.rate />
		</cfif>
    
    <cfreturn currentpay * local.rate />
  </cffunction>

	<cffunction name="myFunction" access="public" returntype="string">
		<cfargument name="myArgument" type="string" required="yes">
		<cfset myResult="foo">
		<cfreturn myResult>
	</cffunction>
  <cfscript>
  /**
 * This function takes URLs in a text string and turns them into links.
 * Version 2 by Lucas Sherwood, lucas@thebitbucket.net.
 * Version 3 Updated to allow for ;
 * 
 * @param string 	 Text to parse. (Required)
 * @param target 	 Optional target for links. Defaults to "". (Optional)
 * @param paragraph 	 Optionally add paragraphFormat to returned string. (Optional)
 * @return Returns a string. 
 * @author Joel Mueller (jmueller@swiftk.com) 
 * @version 3, August 11, 2004 
 */
function ActivateURL(string) {
	var nextMatch = 1;
	var objMatch = "";
	var outstring = "";
	var thisURL = "";
	var thisLink = "";
	var	target = IIf(arrayLen(arguments) gte 2, "arguments[2]", DE(""));
	var paragraph = IIf(arrayLen(arguments) gte 3, "arguments[3]", DE("false"));
	
	do {
		objMatch = REFindNoCase("(((https?:|ftp:|gopher:)\/\/)|(www\.|ftp\.))[-[:alnum:]\?%,\.\/&##!;@:=\+~_]+[A-Za-z0-9\/]", string, nextMatch, true);
		if (objMatch.pos[1] GT nextMatch OR objMatch.pos[1] EQ nextMatch) {
			outString = outString & Mid(String, nextMatch, objMatch.pos[1] - nextMatch);
		} else {
			outString = outString & Mid(String, nextMatch, Len(string));
		}
		nextMatch = objMatch.pos[1] + objMatch.len[1];
		if (ArrayLen(objMatch.pos) GT 1) {
			// If the preceding character is an @, assume this is an e-mail address
			// (for addresses like admin@ftp.cdrom.com)
			if (Compare(Mid(String, Max(objMatch.pos[1] - 1, 1), 1), "@") NEQ 0) {
				thisURL = Mid(String, objMatch.pos[1], objMatch.len[1]);
				thisLink = "<A HREF=""";
				switch (LCase(Mid(String, objMatch.pos[2], objMatch.len[2]))) {
					case "www.": {
						thisLink = thisLink & "http://";
						break;
					}
					case "ftp.": {
						thisLink = thisLink & "ftp://";
						break;
					}
				}
				thisLink = thisLink & thisURL & """";
				if (Len(Target) GT 0) {
					thisLink = thisLink & " TARGET=""" & Target & """";
				}
				thisLink = thisLink & ">" & thisURL & "</A>";
				outString = outString & thisLink;
				// String = Replace(String, thisURL, thisLink);
				// nextMatch = nextMatch + Len(thisURL);
			} else {
				outString = outString & Mid(String, objMatch.pos[1], objMatch.len[1]);
			}
		}
	} while (nextMatch GT 0);
		
	// Now turn e-mail addresses into mailto: links.
	outString = REReplace(outString, "([[:alnum:]_\.\-]+@([[:alnum:]_\.\-]+\.)+[[:alpha:]]{2,4})", "<A HREF=""mailto:\1"">\1</A>", "ALL");
		
	if (paragraph) {
		outString = ParagraphFormat(outString);
	}
	return outString;
}
  </cfscript>
  
  <cfscript>
  /**
 * Creates a bread crumb trail based on your sites sirectory structure.
 * 
 * @return Returns a string. 
 * @author Jon Lesser (jdl1101@rit.edu) 
 * @version 1, July 25, 2006 
 */
function breadCrumb() {
	var baseLink = "/";
	var delimiter = " > ";
	var crumbs = "<a href='" & baseLink & "'>Home</a>" & delimiter;
	var breadCrumbArray = listToArray(replace(cgi.script_name, "_", " ", "all") , "/");
	var i = 1;
	
	for(i=1; i lt arrayLen(breadCrumbArray); i=i+1) {
		baseLink = baseLink & replace(breadCrumbArray[i], " ", "_", "all") & "/";
		
		if(i lt ArrayLen(breadCrumbArray)-1) crumbs = crumbs & "<a href='" & baseLink & "'>" & capFirstTitle(breadCrumbArray[i]) & "</a>" & delimiter;
		else crumbs = crumbs & capFirstTitle(breadCrumbArray[i]);		
	}
	return crumbs;
}
 /**
 * Returns a string with words capitalized for a title.
 * Modified by Ray Camden to include var statements.
 * Modified by James Moberg to use structs, added more words, and reset-to-all-caps list.
 * 
 * @param initText 	 String to be modified. (Required)
 * @return Returns a string. 
 * @author Ed Hodder (ed.hodder@bowne.com) 
 * @version 3, October 7, 2011 
 */
function capFirstTitle(initText){
       var j = 1; var m = 1;
       var doCap = true;
       var tempVar = "";
       /* Make each word in text an array variable */
       var Words = ListToArray(LCase(trim(initText)), " ");
       var excludeWords = structNew();
       var ResetToALLCAPS = structNew();
       /* Words to never capitalize */
       tempVar =  ListToArray("a,above,after,ain't,among,an,and,as,at,below,but,by,can't,don't,for,from,from,if,in,into,it's,nor,of,off,on,on,onto,or,over,since,the,to,under,until,up,with,won't");
       for(j=1; j LTE (ArrayLen(tempVar)); j = j+1){
               excludeWords[tempVar[j]] = 0;
       }
       /* Words to always capitalize */
       tempVar = ListToArray("II,III,IV,V,VI,VII,VIII,IX,X,XI,XII,XIII,XIV,XV,XVI,XVII,XVIII,XIX,XX,XXI");
       for(j=1; j LTE (ArrayLen(tempVar)); j = j+1){
               ResetToALLCAPS[tempVar[j]] = 0;
       }
       /* Check words against exclude list */
       for(j=1; j LTE (ArrayLen(Words)); j = j+1){
               doCap = true;
               /* Word must be less than four characters to be in the list of excluded words */
               if(LEN(Words[j]) LT 4){
                       if(structKeyExists(excludeWords,Words[j])){ doCap = false; }
               }
               /* Capitalize hyphenated words */
               if(ListLen(trim(Words[j]),"-") GT 1){
                       for(m=2; m LTE ListLen(Words[j], "-"); m=m+1){
                               tempVar = ListGetAt(Words[j], m, "-");
                               tempVar = UCase(Mid(tempVar,1, 1)) & Mid(tempVar,2, LEN(tempVar)-1);
                               Words[j] = ListSetAt(Words[j], m, tempVar, "-");
                       }
               }
               /* Automatically capitalize first and last words */
               if(j eq 1 or j eq ArrayLen(Words)){ doCap = true; }
               /* Capitalize qualifying words */
               if(doCap){ Words[j] = UCase(Mid(Words[j],1, 1)) & Mid(Words[j],2, LEN(Words[j])-1); }
               if (structKeyExists(ResetToALLCAPS, Words[j])) Words[j] = ucase(Words[j]);
       }
       return ArrayToList(Words, " ");
}
 
  </cfscript>
  
  
</cfcomponent>