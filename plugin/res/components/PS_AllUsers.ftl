<#assign list_users = rest("/users").users/>
<table style="width:50%" border="1">
<#list list_users.user as ul>
<tr>
		<td>
			<a href="${ul.@view_href}">${ul.id}</a>
		</td>
		<td>
			${ul.login}
		</td>
</tr>

</#list>
</table>
