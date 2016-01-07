<#assign pageNum = 1 />
<#assign pageSize = 5 />

<#attempt>        
	<#assign nodeId = env.context.component.getParameter('nodeid')?string>
	<#assign nodeType = env.context.component.getParameter('nodetype')?string>
<#recover>     
	<#assign nodeId = "" />
	<#assign nodeType = "" />
</#attempt>

<#-- Search at community level level by default -->
<#assign rootSearch = "" />
<#assign searchFilter = "" />
<#if nodeType == "board">
	<#-- Search at board level -->
	<#assign rootSearch = "boards/id/${nodeId}/" />
	<#assign searchFilter = "location=board%3A${nodeId?url}" />
<#elseif nodeType == "category">
	<#-- Search at category level -->
	<#assign rootSearch = "categories/id/${nodeId}/" />
	<#assign searchFilter = "location=category%3A${nodeId?url}" />
</#if>
	
<#assign rest_query = "${rootSearch}/search/messages?sort_by=-topicPostDate&openresponse=true&include_forums=true&include_qanda=true&showMoved=false&collapse_discussion=true&restapi.response_style=view&page=${pageNum}&page_size=${pageSize}" />
<#assign count = rest("${rootSearch}/search/messages/count?openresponse=true&include_forums=true&include_qanda=true&collapse_discussion=true").value?number />

<#if count gt 0>

	<@component id="forums.widget.message-list-panel" title=text.format("unansweredTopics.unanswered-topics-taplet.title") messages="rest_v1:"+rest_query style="slim" numMessages=pageSize />
  <div class="lia-view-all">
    <a class="lia-link-navigation view-all-link" href="/t5/forums/searchpage/tab/message?sort_by=-topicPostDate&advanced=true&search_type=thread&search_page_size=10&openresponse=true&filter=openResponse&${searchFilter}">${text.format("general.View_All")}</a>
  </div>	

<#else>
<#-- No open messages found for this board -->
<div class="lia-panel-content-wrapper">
	<div class="lia-panel-content">
		<ul class="lia-list-standard">
		<li>
			<div class="MessageSubjectCell">
			<span class="lia-message-unread">${text.format("page.list.no_new_messages")}</span>
			</div>
		</li>
		</ul>
	</div>
</div>
</#if>