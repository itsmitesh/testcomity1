<#function getActiveAreas param_user_id>
	<#assign returnValue = '"active_areas":' />
	<#assign userId = param_user_id />
	<#assign count_posts = restadmin("/users/id/${userId}/posts/count").value />

	<#if (count_posts?number > 0 ) >
		<#if count_posts?number gt 500> <#-- Set a top limit as REST call is getting rather heavy -->
			<#assign count_posts =500>
		</#if>

		<#assign i = 0>
			<#assign latest_posts = rest("/users/id/${userId}/posts/latest?page_size=" + count_posts) />
			<#assign boards_list = [] />
			<#assign returnValue = returnValue + '[' />
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
			<#assign returnValue = returnValue + ']' />
	</#if>
	<#return returnValue>
</#function>
${getActiveAreas(15)}

