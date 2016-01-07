<#assign response = rest("/categories/id/sunny_mody/posts/recent").messages />

<#list response.message as msg>
	${msg.subject}<br/>
	
	<#assign boardName = rest("${msg.board.@href}").board />
	${boardName.title}<br/>
	
	<@component id="common.widget.user-name" user="conv:${msg.author.login}" /><br/>
	
	<#if msg.post_time.@view_friendly_date != "">
		${msg.post_time.@view_friendly_date}
	<#else>
		${msg.post_time.@view_date} ${msg.post_time.@view_time}
	</#if>
	<br/><br/>
</#list>