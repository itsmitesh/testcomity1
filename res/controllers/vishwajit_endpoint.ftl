<#assign uids = http.request.parameters.name.get("allUIDs","")?html?js_string />

<#assign uids1 = uids?split(",")/>
<#attempt>
<#assign allLabelList = ""/>
<#list uids1 as uid>
	<#assign AllLabels = restadmin("/messages/id/${uid}/labels").labels />
	<#if (AllLabels.label?size > 0)>
		<#list AllLabels.label as firstlabel>
			<#if firstlabel.text?has_content>
				<#assign allLabelList = allLabelList + firstlabel[0].text + "," />		
			</#if>
		</#list>
	<#else>
		<#assign allLabelList = allLabelList + "," />		
	</#if>	
</#list>
<#assign allLabelList = allLabelList?substring(0,allLabelList?length-1)>
${allLabelList}
<#recover>
	Error making rest call with blog UID
</#attempt>