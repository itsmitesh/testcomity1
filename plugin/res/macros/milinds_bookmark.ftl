<#macro displayPostsDetails interactionStyle="">
<#if interactionStyle?? && interactionStyle?has_content >
	<#attempt>
		<#assign user_bookmarks = rest("subscriptions/users/self/bookmark/all").subscriptions />
	<#recover>
		<#assign user_bookmarks = [] />
	</#attempt>
	
	<#if user_bookmarks?? && user_bookmarks?has_content && user_bookmarks.subscription?size gt 0>
		<div class="main-column custom-user-bookmarks">
			<div class="custom-user-bookmarks-boards-title"><i class="material-icons">library_books</i><h3>${text.format("custom-user-bookmarks-posts.title.${interactionStyle}")}</h3></div>
			<div class="bookmarks-wrapper z-depth-1">
			<table class="lia-list-wide bordered">
				<thead>
				  <tr>
				  	  <th data-field="id">${text.format("general.Author")}</th>
					  <th data-field="id">${text.format("general.Board")}</th>
					  <th class="integer" data-field="name">${text.format("general.Posts")}</th>
					  <th class="integer" data-field="price">${text.format("general.Views")}</th>
				  </tr>
				</thead>

				<tbody>
			<#list user_bookmarks.subscription as subscription>
				<tr class="lia-list-row">
				<#assign query = "SELECT author.id, author.view_href, board.title, board.view_href, conversation.messages_count, conversation.style FROM messages WHERE id='${subscription.target.id}'" />
				<#assign msg_details = rest("2.0","/search?q=" + query?url('UTF-8')) />
	
				<#if msg_details.status == "success" && msg_details.data?has_content && msg_details.data.items?has_content >
					<#assign msg = msg_details.data.items[0] />
					<#assign msg_comments = msg.conversation.messages_count?number - 1 />
						<#attempt>
							<#assign author_avatar = rest('/users/id/${msg.author.id}/profiles/avatar/url').value />
						<#recover>
								<!-- ${.error} -->
						</#attempt>
					<#if subscription.target_type == "message" && interactionStyle == msg.conversation.style >
						<td class="avatar">						
						<div>
							<#assign path = "/users/id/${msg.author.id}" />											
							<@userAvatar userPath=path size="message" progressbar="false" />
						</div>
						</td>
						<td class="board">
						<div class="message-subject"><a href="${subscription.target.@view_href}">${subscription.target.subject}</a></div>
						<div class="category-title message-subject-board"><a href="${msg.board.view_href}">${msg.board.title}</a></div>
						</td>
						<td class="repliesCountColumn lia-data-cell-secondary integer">
						<div class="integer">${msg_comments} </div>
						</td>
						<td class="viewsCountColumn lia-data-cell-secondary integer">
						<div class="integer">${subscription.target.views.count}</div>
						</td>
						
					<#elseif subscription.target_type == "thread" && interactionStyle == msg.conversation.style >
						<td class="avatar">						
						<div>
							<#assign path = "/users/id/${msg.author.id}" />											
							<@userAvatar userPath=path size="message" progressbar="false" />
						</div>
						</td>
						<td class="board">
						<div><a href="${subscription.target.@view_href}">${subscription.target.messages.topic.subject}</a></div>
						<div><a href="${msg.board.view_href}">${msg.board.title}</a></div>
						</td>
						<td class="repliesCountColumn integer">
						<div>${msg_comments} </div>
						</td>
						<td class="viewsCountColumn integer">
						<div class="integer">${subscription.target.messages.topic.views.count} </div>
						</td>
						
					</#if>

				</#if>
				</tr>
			</#list>
			</table>
			</div>
		</div>
	</#if>
</#if>
</#macro>
  
<#-- 
macro: userAvatar
argument: userId  - The id of the user to be displayed.
Example:
<@userAvatar user=user.id size="profile" />

This will return the avatar of the user along with the left rank icon
-->
<#macro userAvatar userPath size="message" progressbar="true" >	
<#if userPath?? && userPath?string?length gt 0>	  
	<#assign thisUser = restadmin("${userPath}").user />
	<#assign ranking = restadmin("${userPath}/ranking").ranking />	
	<#attempt>
		<#assign avatar = restadmin("${userPath}/profiles/avatar").image />
	<#recover>
	</#attempt>
<div class="UserAvatar lia-user-avatar" >
	<div class="user-avatar">
		<#if avatar.@null[0]??>
			<a href="${thisUser.@view_href}">
			<img src="${asset.get("/html/assets/unknown_icon.gif")}">
			</a>
		<#else>
			<#if avatar?? && avatar.@href?? && size=="profile">
				<#attempt>
				<#assign avatar = restadmin("${userPath}/profiles/avatar/size/profile").image />
				<#recover>
				</#attempt>
			</#if>
				<a href="${thisUser.@view_href}">
					<img src="${avatar.url}" userId="${thisUser.id}" />
				</a>
		</#if>
			<#if progressbar =="true">	
				<#if !ranking.display.left_image.@null[0]?? && ranking.display.left_image.url?length gt 0>	
					<#if size=="profile">
						<div class="progress-icon"><img src="${ranking.display.left_image.url?replace("sm","lg")}" /></div>
					<#else>
						<div class="progress-icon"><img src="${ranking.display.left_image.url}" /></div>
					</#if>
				</#if>
			</#if>
	</div>
</div>
</#if>
</#macro>

<#--
macro: humaneDate
argument: date  - The post_time object of the thread or message xml response
Example:
<@humaneDate date=message.post_time />

This will return the date of a post in the proper format
-->
<#macro humaneDate date>
	<#if date.@view_friendly_date[0]?? && date.@view_friendly_date != "">
		${date.@view_friendly_date}
	<#else>
		${date.@view_date} ${date.@view_time}
	</#if>

</#macro>