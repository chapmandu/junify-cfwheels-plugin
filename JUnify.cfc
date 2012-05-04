<cfcomponent output="false" mixin="controller">

	<cffunction name="init" returntype="any" access="public" output="false">
		<cfset this.version = "1.1.7">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="JUnifyVersion" returntype="string" access="public" output="false">
		<cfreturn "1.0" />
	</cffunction>
	
	<cffunction name="JUnify" access="public" returntype="string" output="false">
		<cfargument name="params" type="struct">
		<cfset var loc = {} />
		
		<cfcontent reset="yes" type="text/xml">
		<cfsetting showdebugoutput="false">
		
		<cfif ! StructKeyExists(arguments.params,"type")>
			<cfset arguments.params.type = "core">
		</cfif>
		<cfif arguments.params.type NEQ "app">
			<cfset loc.path = application.wheels.wheelsComponentPath>
		<cfelse>
			<cfset loc.path = "tests">
		</cfif>
		<cfset loc.testresults = $createObjectFromRoot(path=loc.path, fileName="Test", method="$WheelsRunner", options=arguments.params)>
		<cfsavecontent variable="loc.jUnitXML"><cfoutput><?xml version="1.0"?>
        <testsuite errors="#loc.testresults.numErrors#" failures="#loc.testresults.numFailures#" name="#capitalize(arguments.params.type)# Tests" tests="#loc.testresults.numTests#" time="#DateDiff("n",loc.testresults.end,loc.testresults.begin)#" timestamp="#now()#">
            <cfloop from="1" to="#arrayLen(loc.testresults.results)#" index="loc.i">
            <testcase name="#loc.testresults.results[loc.i].testName#" time="#loc.testresults.results[loc.i].time#"><cfif loc.testresults.results[loc.i].status neq "Success"><failure message="#replace(loc.testresults.results[loc.i].message,'"','""','all')#">#loc.testresults.results[loc.i].message#</failure></cfif></testcase>
            </cfloop>
            <system-out><![CDATA[]]></system-out>
            <system-err><![CDATA[]]></system-err>
        </testsuite>
		</cfoutput></cfsavecontent>
		<cfset renderText(loc.jUnitXML)>
	</cffunction>
	
</cfcomponent>