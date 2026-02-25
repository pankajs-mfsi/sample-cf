
<cfcomponent output="false">

    <cfset this.name = "ColdFusionAjaxAppDB_Tag_Validated">
    <cfset this.applicationTimeout = createTimeSpan(1,0,0,0)>
    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout = createTimeSpan(0,1,0,0)>
    <cfset this.setClientCookies = true>
    <cfset this.scriptProtect = "all">
    <cfset this.datasource = "testdemo">

    <cffunction name="onApplicationStart" returntype="boolean" output="false">
        <cfset application.appName = "ColdFusion AJAX DB Demo (Tag Based + Validation)">
        <cfreturn true>
    </cffunction>

    <cffunction name="onSessionStart" returntype="void" output="false">
        <cfset session.isLoggedIn = false>
    </cffunction>

</cfcomponent>
