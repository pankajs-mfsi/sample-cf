
<cfcomponent output="false">
<cffunction name="getUsers" access="remote" returntype="query" returnformat="json" output="false">
<cfquery name="qUsers" datasource="#application.datasource#">
SELECT id, name, email FROM users
</cfquery>
<cfreturn qUsers>
</cffunction>
<cffunction name="addUser" access="remote" returntype="void" returnformat="json" output="false">
<cfargument name="name" type="string" required="false" default="">
<cfargument name="email" type="string" required="false" default="">
<cfquery datasource="#application.datasource#">
INSERT INTO users (name, email)
VALUES (
<cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar">,
<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
)
</cfquery>
</cffunction>
</cfcomponent>
