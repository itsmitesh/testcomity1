<#assign user_stats = rest("users/id/${user.id}/metrics") />
<#if user_stats?? && user_stats.metrics??>
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
</#if>

<div class="lia-panel lia-panel-standard custome_user_stats">
	<div class="lia-decoration-border">
		<div class="lia-decoration-border-top">
			<div>
			</div>
		</div>
		<div class="lia-decoration-border-content">
			<div>
				<div class="lia-panel-heading-bar-wrapper">
					<div class="lia-panel-heading-bar">
						<span class="lia-panel-heading-bar-title">${user.login} Stats</span>
					</div>
				</div>
				<div class="lia-panel-content-wrapper">
					<div class="lia-panel-content">
						<ul>
							<li><b>Kudos Received : </b>${kudos_received}</li>
							<li><b>Kudos Given : </b>${kudos_given}</li>
							<li><b>Solutions : </b>${solutions}</li>
							<li><b>No. of Post : </b>${no_of_post}</li>
							<li><b>Login Count : </b>${login_count}</li>
							<li><b>Minutes online : </b>${minute_online}</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="lia-decoration-border-bottom">
			<div>
			</div>
		</div>
	</div>
</div>
<style>
</style>