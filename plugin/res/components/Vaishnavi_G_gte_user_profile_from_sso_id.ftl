<#--
A user profile - (for an Oxygen userId) Gross Kudos Received, Gross Kudos Given, Accepted Solutions, Rank, Roles (only display certain roles), Number of tags, Net Ideas, Badges (ids), Active Areas (board names where user has recently posted), Latest Activity (format to be decided)
-->
<#assign userId = '-1' />
<#assign user_fields_json_str = "" />
<#assign x= rest("2.0","/search?q=" + "SELECT id, first_name, last_name, rank.id FROM users WHERE id = '${userId}'"?url) />
<#list x.data.items as user > 
	<#assign user_fields_json_str = user_fields_json_str + '{' />
	<#assign user_fields_json_str = user_fields_json_str + '"rank_id":"${user.rank.id}"' />
</#list>

<#assign x= rest("2.0","/search?q=" + "SELECT name FROM roles where users.id = '${userId}'"?url) />

<#assign isExpertElite = "false" />
<#list x.data.items as role > 
	<#if role.name == 'ExpertElite'>
		<#assign isExpertElite = "true" />
		<#break>
	</#if>
</#list>
<#assign user_fields_json_str = user_fields_json_str + ',"isExpertElite":"${isExpertElite}"' />

<#-- get metrics data -->
<#assign metrics= rest("/users/id/${userId}/metrics").metrics />
<#list metrics.metric as m > 
	<#if m.@name=="net_kudos_weight_received">
		 <#assign user_fields_json_str = user_fields_json_str + ',"net_kudos_weight_received":"${m}"' />
	<#elseif m.@name=="net_kudos_weight_given">
		<#assign user_fields_json_str = user_fields_json_str + ',"net_kudos_weight_given":"${m}"' />
	<#elseif m.@name=="net_idea_threads">
		<#assign user_fields_json_str = user_fields_json_str + ',"net_idea_threads":"${m}"' />
	<#elseif m.@name=="net_accepted_solutions">
		<#assign user_fields_json_str = user_fields_json_str + ',"net_accepted_solutions":"${m}"' />
	<#elseif m.@name=="tagging_tag_count">
		<#assign user_fields_json_str = user_fields_json_str + ',"tagging_tag_count":"${m}"' />
	</#if>	
</#list>

<#-- get roles data -->
<#-- get ranking data -->
<#assign ranking= rest("/users/id/${userId}/ranking").ranking.id />
<#assign user_fields_json_str = user_fields_json_str + ',"ranking":"${ranking}"' />
<#-- get badges data -->
<#assign badges= rest("/users/id/${userId}/badges").user_badges.user_badge />
<#assign user_fields_json_str = user_fields_json_str + ',"badges":[' />
<#if badges?size gt 0>
	<#list user_badges as bg > 
		${bg.id}
		<#assign user_fields_json_str = user_fields_json_str + '${bg.id},' />
	</#list>
<#-- remove last comma using substring -->
<#assign categories_json_str = "${user_fields_json_str?substring(0,(user_fields_json_str?length-1))}" />	

</#if>

<#assign user_fields_json_str = user_fields_json_str + ']' />


<#assign user_fields_json_str = user_fields_json_str + '}' />
${user_fields_json_str}