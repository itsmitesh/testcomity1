<#assign my_username = restadmin("/users/id/${user.id}/login").value/>
	<#assign my_rank = restadmin("/users/id/${user.id}/ranking").ranking.name/>
	<#assign my_role = restadmin("/users/id/${user.id}/roles").roles.role/>
	<#assign my_roles = ""/>
	<#list my_role as singlerole>
		<#assign my_roles = my_roles + singlerole.name />
                ${my_roles}
	</#list>