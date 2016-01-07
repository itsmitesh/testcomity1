<#assign resultSize = settings.name.get("qanda.qa_ask_results_size") />
<#assign messages = rest('/search/messages?q=test&restapi.response_style=view').messages />
<#assign messages_list = [] >
<#if messages.message?size gt 0>
	<#list messages.message as message>
		<#if !message.parent.@href?has_content>
			<#if messages_list?size lt resultSize?number >
				<#assign messages_list = messages_list + message >
			</#if>			
		</#if>		
	</#list>
</#if>



<#if messages_list?size gt 0 >
	<div class="lia-component-qanda-widget-ask-an-expert-form-results" id="">
		<p class="results-info-text">Does this information help?</p>

		<#list messages_list as message>
			<div class="thread-list-display">
				<div class="message-subject-link">
					<#assign boardType = rest("${message.board.@href}").board.interaction_style />
					<#if boardType == "board">
						<#assign boardClass = "forum" />
						<#assign imgClass = "lia-img-icon-${boardClass}-board lia-fa-icon lia-fa-${boardClass} lia-fa-board lia-node-icon" />
						<img class="${imgClass}" src="${skin.images.icon_board.url}" >
					<#elseif boardType == "tkb">
						<#assign boardClass = boardType />
						<#assign imgClass = "lia-img-icon-${boardClass}-board lia-fa-icon lia-fa-${boardClass} lia-fa-board lia-node-icon" />
						<img class="${imgClass}" src="${skin.images.icon_tkb_board.url}" >						
					<#elseif boardType == "idea">
						<#assign boardClass = boardType />
						<#assign imgClass = "lia-img-icon-${boardClass}-board lia-fa-ico lia-fa-${boardClass} lia-fa-board lia-node-icon" />
						<img class="${imgClass}" src="${skin.images.icon_idea.url}" >						
					<#elseif boardType == "blog">
						<#assign boardClass = boardType />
						<#assign imgClass = "lia-img-icon-${boardClass}-board lia-fa-ico lia-fa-${boardClass} lia-fa-board lia-node-icon" />
						<img class="${imgClass}" src="${skin.images.icon_blog.url}" >
					</#if>
					
					<#-- <img class="lia-img-message-type-solved lia-fa-message lia-fa-type lia-fa-solved" title="Accepted Solution" alt="Accepted Solution" aria-label="Accepted Solution" id="" src="${skin.images.message_type_solved.url}"> -->
					
					<a class="lia-link-navigation lia-expert-message" id="" href="${message.root.@view_href}">${message.subject}</a>
				</div>
			</div>
		</#list>	
			
	</div>
</#if>