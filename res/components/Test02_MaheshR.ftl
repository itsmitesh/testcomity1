<#attempt>
	<#assign message_id = "${page.context.message.uniqueId}">
<#recover>
	<#assign message_id =  "257" />
</#attempt>

<#assign pageSize= 10 />
<#assign subjectCharLength = 30 />

<#assign message = rest("/messages/id/${message_id}").message />
<#assign uniqueMessageIdList = [] />
<#assign uniqueMessageWeightList =[] />
<#assign uniqueMessageLinkList = [] />
<#assign uniqueMessageSubjectList = [] />

<#-- Get related messages using subject -->
<#assign messageSubject = message.subject?replace(" ","%20OR%20") />


<#assign subjectSearch = rest("/boards/id/${coreNode.id}/search/messages?one_or_more=${messageSubject}&f=subject&page_size=${pageSize}").messages />

<#list subjectSearch.message as tempMsg >
	<#if tempMsg.id != message_id >
		<#assign uniqueMessageIdList = uniqueMessageIdList + [tempMsg.id] />
		<#assign uniqueMessageWeightList = uniqueMessageWeightList + [1] />
		
		<#assign uniqueMessageLinkList = uniqueMessageLinkList + ["${tempMsg.@view_href}"] />
		<#assign uniqueMessageSubjectList = uniqueMessageSubjectList + ["${tempMsg.subject}"]/>
	</#if>
</#list>


<#-- Get related messages using labels --> 
<#assign messageLabels = "" >
<#list message.labels.label as label >
	<#if label_has_next >
		<#assign messageLabels = messageLabels + label.text + "%20OR%20" />
	<#else>
		<#assign messageLabels = messageLabels + label.text />
	</#if>
</#list>


<#assign labelsSearch = rest("/boards/id/${coreNode.id}/search/messages?one_or_more=${messageLabels}&f=labels.text&page_size=${pageSize}").messages />

<#list labelsSearch.message as tempMsg >
	<#if tempMsg.id != message_id >
		<#assign msgStatus =  uniqueMessageIdList?seq_index_of(tempMsg.id) />
		
		<#if (msgStatus == -1) >
			<#assign uniqueMessageIdList = uniqueMessageIdList + [tempMsg.id] />
			<#assign uniqueMessageWeightList = uniqueMessageWeightList + [3] />
			<#assign uniqueMessageLinkList = uniqueMessageLinkList + ["${tempMsg.@view_href}"] />
			<#assign uniqueMessageSubjectList = uniqueMessageSubjectList + ["${tempMsg.subject}"]/>
		<#else>
			<#assign newWeight = uniqueMessageWeightList[msgStatus] + 3 />
			<#assign tempWeightList = [] />
			
			<#list uniqueMessageIdList as Msg>
				<#if Msg_index == msgStatus >
					<#assign tempWeightList = tempWeightList + [newWeight] />
				<#else>
					<#assign tempWeightList = tempWeightList +  [uniqueMessageWeightList[msgStatus]] />
				</#if>				
			</#list>
			<#assign uniqueMessageWeightList = tempWeightList />
			
		</#if>
	</#if>
</#list>



<#-- Get related messages using tags --> 

<#assign messageTags = "" >

<#assign allTags = rest("/messages/id/${message_id}/tagging/tags/all").tags />

<#list allTags.tag as tag >
	<#if tag_has_next >
		<#assign messageTags = messageTags + tag.text + "%20OR%20" />
	<#else>
		<#assign messageTags = messageTags + tag.text />
	</#if>
</#list>



<#assign tagSearch = rest("/boards/id/${coreNode.id}/search/messages?one_or_more=${messageTags}&f=tags&page_size=${pageSize}").messages />

<#list tagSearch.message as tempMsg >
	<#if tempMsg.id != message_id >
		<#assign msgStatus =  uniqueMessageIdList?seq_index_of(tempMsg.id) />
		
		<#if (msgStatus == -1) >
			<#assign uniqueMessageIdList = uniqueMessageIdList + [tempMsg.id] />
			<#assign uniqueMessageWeightList = uniqueMessageWeightList + [2] />
			<#assign uniqueMessageLinkList = uniqueMessageLinkList + ["${tempMsg.@view_href}"] />
			<#assign uniqueMessageSubjectList = uniqueMessageSubjectList + ["${tempMsg.subject}"]/>
		<#else>
			<#assign newWeight = uniqueMessageWeightList[msgStatus] + 2 />
			<#assign tempWeightList = [] />
			
			<#list uniqueMessageIdList as Msg>
				<#if Msg_index == msgStatus >
					<#assign tempWeightList = tempWeightList + [newWeight] />
				<#else>
					<#assign tempWeightList = tempWeightList +  [uniqueMessageWeightList[msgStatus]] />
				</#if>				
			</#list>
			<#assign uniqueMessageWeightList = tempWeightList />
			
		</#if>
	</#if>
</#list>



<div class="Custom-Recommendation Component lia-panel lia-panel-standard msg_id-${message_id}">
	
	<div class="lia-panel-heading-bar-wrapper">
		<div class="lia-panel-heading-bar">
			<span class="lia-panel-heading-bar-title">
				Recommendations
			</span>
		</div>
	</div>

	<#assign messageListHashmap = []>

	<#list uniqueMessageIdList as Msg >	
			<#assign messageListHashmap = messageListHashmap + [ { "id":Msg , "weight":uniqueMessageWeightList[Msg_index], "link": uniqueMessageLinkList[Msg_index], "subject":uniqueMessageSubjectList[Msg_index] } ] />
	</#list>

	
	
	<#list messageListHashmap?sort_by("weight")?reverse as Msg >
			<div class="recommedationLink messageId-${Msg['id']} messageWeight-${Msg['weight']} ">
				<a href="${Msg['link']}">
					<#if (Msg["subject"]?length > subjectCharLength )>
						${Msg["subject"]?substring(0,subjectCharLength-3)}...
					<#else>
						${Msg["subject"]}
					</#if>
				</a>
			</div>
	</#list>

</div>