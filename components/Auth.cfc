
<cfcomponent output="false">
<cffunction name="login" access="remote" returntype="struct" returnformat="json" output="false">
<cfargument name="username" type="string" required="false" default="">
<cfargument name="password" type="string" required="false" default="">
<cfset var result = {success=false, message="Invalid credentials"}>
<cfif arguments.username EQ "admin" AND arguments.password EQ "1234">
<cfset session.isLoggedIn = true>
<cfset result.success = true>
<cfset result.message = "Login successful">
</cfif>
<cfreturn result>
</cffunction>
<cffunction name="logout" access="remote" returntype="void" returnformat="json" output="false">
<cfset structClear(session)>
</cffunction>
</cfcomponent>
