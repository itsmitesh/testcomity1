<#function getLatestPosts param_user_id param_count_posts>
	<#assign returnValue = '"latest_posts":' />
	<#assign userId = param_user_id />
	<#assign count_posts = param_count_posts />

	<#if (count_posts?number > 0 ) >
		<#assign i = 0>
			<#assign latest_posts = rest("/users/id/${userId}/posts/latest?page_size=" + count_posts) />
			<#assign returnValue = returnValue + '[' />
			<#list latest_posts.messages.message as post>
				<#assign board_url = post.board.@view_href />
				<#assign post_url = post.@view_href />
				<#assign post_subject = post.subject />
					<#if (i < 5)>
						<#assign board_item = restadmin("/messages/id/${post.id}/board").board/>
						<#assign returnValue = returnValue + '{"board_title":"${board_item.title}","board_url":"${board_url}","post_title":"${post_subject}","post_url":"${post_url}"},' />
						<#assign i = i + 1>
					</#if>
			</#list>
			<#-- remove last comma using substring -->
			<#assign returnValue = "${returnValue?substring(0,(returnValue?length-1))}" />	
			<#assign returnValue = returnValue + ']' />
	</#if>
	<#return returnValue>
</#function>
${getLatestPosts(15,5)}


