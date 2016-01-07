<#assign username = http.request.parameters.name.get("name","")?html?js_string />

<#assign allUserNames = username?split(",") />

<#assign responseData = "" />
<#list allUserNames as name>
	<#assign avatarUrl= restadmin("/users/login/${name}/profiles/avatar/url").value>
	<#assign responseData = responseData + "<img src='${avatarUrl}'>" /> 
	
	<#if name_has_next>
		<#assign responseData = responseData + "," /> 		
	</#if>
</#list>

{"content" : "${responseData}" }

