<#assign user_stats = restadmin("users/id/${user.id}/metrics").metrics />

<#if user_stats?? && user_stats.metrics??>
	<#list user_stats.metric as stats>
	    <#switch stats.@name> 
			<#case "kudos_events_received">
	           <#assign kudos_received = stats />
			<#break>
			<#case "kudos_events_given">
	           <#assign kudos_given = stats />
			<#break>
			<#case "accepted_solutions">
	           <#assign solutions = stats />
			<#break>
			<#case "posts">
	           <#assign no_of_post = stats />
			<#break>
			<#case "logins">
	           <#assign login_count = stats />
			<#break>
			<#case "minutes_online">
	           <#assign minute_online = stats />
			<#break>
		</#switch>
	</#list>
</#if>

<div class="main">

<h1>${user.login} Statistics</h1><br>	
<table id="tablehead" width="100%">
	
			<tr><td><b>Kudos Received : </b></td><td>${kudos_received}</td>

			<tr><td><b>Kudos Given : </b></td><td>${kudos_given}</td>

			<tr><td><b>Solutions : </b></td><td></span>${solutions}</td>

			<tr><td><b>No. of Post : </b></td><td>${no_of_post}</tr></td>

			<tr><td><b>Login Count  </b></td><td></span>${login_count}</td>

			<tr><td><b>Minutes online : </b></td><td>${minute_online}</td>
						
</table>

</div>
<br>
<style>
 .main{ 
 border: 1px solid #d3d3d3;
 padding: 2px 2px; 
 border-radius: 5px;

 }
 
#tablehead tr{
line-height:30px;
}
#tablehead tr:nth-child(odd)
		{
        background-color:#eee;
		margin-top:5px;
		margin-bottom:5px;
 }
 
#tablehead tr:nth-child(even)
		{ background-color:#fff; 
		margin-top:5px;
		margin-bottom:5px;
		}
</style>