<#--
A user profile - (for an Oxygen userId) Gross Kudos Received, Gross Kudos Given, Accepted Solutions, Rank, Roles (only display certain roles), Number of tags, Net Ideas, Badges (ids), Active Areas (board names where user has recently posted), Latest Activity (latest 5 posts)
-->
<#function getActiveAreas param_user_id>
	<#assign returnValue = '"active_areas":[' />
	<#assign user_id = param_user_id />
	<#assign count_posts = restadmin("/users/id/${user_id}/posts/count").value />

	<#if (count_posts?number > 0 ) >
		<#if count_posts?number gt 500> <#-- Set a top limit as REST call is getting rather heavy -->
			<#assign count_posts =500>
		</#if>
		<#assign i = 0>
			<#assign latest_posts = restadmin("/users/id/${user_id}/posts/latest?page_size=" + count_posts) />
			<#assign boards_list = [] />
			<#list latest_posts.messages.message as post>
				<#assign board_url = post.board.@view_href />
				<#assign board_exists = boards_list?seq_contains(board_url)?string('true', 'false')/>
				<#if (board_exists == "false")>
					<#if (i < 5)>
						<#assign boards_list = boards_list + [board_url] />
						<#assign board_item = restadmin("/messages/id/${post.id}/board").board/>
						<#assign returnValue = returnValue + '{"board_title":"${board_item.title}","board_url":"${board_url}"},' />
						<#assign i = i + 1>
					</#if>
				</#if>
			</#list>
			<#-- remove last comma using substring -->
			<#assign returnValue = "${returnValue?substring(0,(returnValue?length-1))}" />				
	</#if>
	<#assign returnValue = returnValue + ']' />
	<#return returnValue>
</#function>
<#function getLatestPosts param_user_id param_count_posts>
	<#assign returnValue = '"latest_activity":[' />
	<#assign user_id = param_user_id />
	<#assign count_posts = param_count_posts />
	<#if (count_posts?number > 0 ) >
		<#assign i = 0>
			<#assign latest_posts = restadmin("/users/id/${user_id}/posts/latest?page_size=" + count_posts).messages />
			${latest_posts?size}
			<#if latest_posts.message?size gt 0>
				<#list latest_posts.message as post>
					<#assign board_url = post.board.@view_href />
					<#assign post_url = post.@view_href />
					<#assign post_subject = post.subject />
						<#if (i < 5)>
							<#assign board_item = restadmin("/messages/id/${post.id}/board").board/>
							<#assign returnValue = returnValue + '{"post_title":"${post_subject}","post_url":"${post_url}","board_title":"${board_item.title}","board_url":"${board_url}"},' />
							<#assign i = i + 1>
						</#if>
				</#list>
				<#-- remove last comma using substring -->
				<#assign returnValue = "${returnValue?substring(0,(returnValue?length-1))}" />	
			</#if>
	</#if>
	<#assign returnValue = returnValue + ']' />
	<#assign returnValue = "@@@${latest_posts.message?size}" />
	<#return returnValue>
</#function>
<#assign user_sso_id = http.request.parameters.name.get("sso_id","") />
<#if user_sso_id=="">
	<#assign user_fields_json_str = '{success:false,code:704,message:"Missing parameter user SSO ID"}' />
	${user_fields_json_str}
<#else>
	<#assign user_id = '15' />
	<#assign user_fields_json_str = "{success:true," />
	<#assign x= restadmin("2.0","/search?q=" + "SELECT name FROM roles where users.id = '${user_id}'"?url) />
	<#assign isExpertElite = "false" />
	<#list x.data.items as role > 
		<#if role.name == 'ExpertElite'>
			<#assign isExpertElite = "true" />
			<#break>
		</#if>
	</#list>
	<#assign user_fields_json_str = user_fields_json_str + '"is_expert_elite":"${isExpertElite}"' />
	<#-- get metrics data -->
	<#assign metrics= restadmin("/users/id/${user_id}/metrics").metrics />
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
	<#assign roles= restadmin("/users/id/${user_id}/roles").roles.role />
	<#assign user_fields_json_str = user_fields_json_str + ',"role_ids":[' />
		<#list roles as role> 	
			<#assign user_fields_json_str = user_fields_json_str + '${role.id},' />
		</#list>
		<#-- remove last comma using substring -->
		<#assign user_fields_json_str = "${user_fields_json_str?substring(0,(user_fields_json_str?length-1))}" />	
	<#assign user_fields_json_str = user_fields_json_str + ']' />
	<#-- get ranking data -->
	<#assign ranking= restadmin("/users/id/${user_id}/ranking").ranking.id />
	<#assign user_fields_json_str = user_fields_json_str + ',"rank_id":"${ranking}"' />
	<#-- get badges data -->
	<#assign badges= restadmin("/users/id/${user_id}/badges").user_badges.user_badge />
	<#assign user_fields_json_str = user_fields_json_str + ',"badge_ids":[' />
	<#if badges?size gt 0>
		<#list user_badges as bg > 
			${bg.id}
			<#assign user_fields_json_str = user_fields_json_str + '${bg.id},' />
		</#list>
		<#-- remove last comma using substring -->
		<#assign categories_json_str = "${user_fields_json_str?substring(0,(user_fields_json_str?length-1))}" />	
	</#if>
	<#assign user_fields_json_str = user_fields_json_str + ']' />
	<#-- get active areas -->
	<#assign user_fields_json_str = user_fields_json_str + ',${getActiveAreas(user_id)}' /> 
	<#-- get latest posts -->
	<#assign user_fields_json_str = user_fields_json_str + ',${getLatestPosts(user_id,5)}' /> 
	<#assign user_fields_json_str = user_fields_json_str + '}' />
	${user_fields_json_str}
</#if>