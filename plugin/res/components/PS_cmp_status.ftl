<#if user.login != "Anonymous">
<div class="userStat">
<h1 style="color: #808080;
    font-size: 18px;
    font-family: Arial;
    font-weight: bold;">${user.login} Statistics</h1>
<br/>
<#assign user_stats = rest("users/id/${user.id}/metrics")>

<#list user_stats.metrics.* as stats>
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
	
	
<table id="tab-stat" style="width:100%">
	<tr> 
	  <td> Kudos Received </td>
          <td> ${kudos_received} </td>
	</tr>
	<tr> 
	    <td> Kudos Given </td>
            <td> ${kudos_given} </td>   
	</tr>
	<tr> 
	    <td> Solutions        </td>
        <td> ${solutions}  </td>
	</tr>
	<tr> 
		<td> Total Message Posted </td>
        <td> ${no_of_post} </td>
	</tr>
	<tr> 
		<td> Number of Logins </td>
        <td> ${login_count} </td>
	</tr>										
	<tr> 
		<td> Minutes Online </td>
        <td> ${minute_online} </td>
	</tr>

</table>
</div>
<#else>
       Please <a href="http://comity.stage.lithium.com/" >Login </a>
</#if>
<style>
.userStat{
    border-radius: 5px;
    border: 1px solid #d3d3d3;
    padding: 5px; 
}
#tab-stat tr{
line-height:20px;
}
table#tab-stat tr:nth-child(odd) {
    background-color: #eee;
}
table#tab-stat tr:nth-child(even) {
    background-color: #fff;
}
</style>