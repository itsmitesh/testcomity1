
<#assign userid=http.request.parameters.name.get("userid") />
<#assign roleid=http.request.parameters.name.get("roleId") />
<#assign action=http.request.parameters.name.get("action") />

<#assign role_data=rest('roles/id/${roleid}') />
<#if role_data?? && role_data.role?? >
	<#assign role_name=role_data.role.name />
	<#assign role_id=role_data.role.id />
</#if>

<#if action = "rem">
   <#assign rem_resp = rest("roles/id/${roleid}/users/remove?role.user=id/${userid}") />
    <#if rem_resp.@status = "success">
		{"resp" :"true","action" : "remove","row_id":"rw_${roleid}","row":"<option value='${role_id}'>${role_name}</option>"}
   </#if>
<#elseif  action = "add">
	<#assign rem_resp = rest("roles/id/${roleid}/users/add?role.user=id/${userid}") />
	<#if rem_resp.@status = "success">
		{"resp" :"true","action" : "add","row_id":${role_id},"row":"<tr class='lia-list-row' id='rw_${role_id}'><td>${role_name}</td><td><a href='#' class='rem_role lia-button lia-button-secondary remove-role-link lia-link-ticket-post-action' id='${role_id}'>Remove</a></td></tr>"}
	</#if>
</#if>
