<#assign categories = rest("/categories?page_size=5").categories.category /> 
<#assign categories_json_str = "[" />
<#list categories as category>
	<#assign allowed = rest("/categories/id/${category.id}/view/allowed").value?string />
	<#if allowed == "true">
		<#assign catHidden = restadmin("/categories/id/${category.id}/settings/name/config.hidden").value?string />
		<#if catHidden == "false">			
			<#assign boards = rest("/categories/id/${category.id}/boards").boards.board/> 
				<#if boards?size gt 0 >
					<#assign categories_json_str = categories_json_str + '{"categoryName":"${category.title}", boardNames :[' />
						<#list boards as board>
							<#assign categories_json_str = categories_json_str + '"${board.title}",' />
						</#list>	
						<#-- remove last comma using substring -->
						<#assign categories_json_str = "${categories_json_str?substring(0,(categories_json_str?length-1))}" />						
						<#assign categories_json_str = categories_json_str + ']},' />
				</#if>
		</#if>
	</#if>	
</#list>
<#-- remove last comma using substring -->
<#assign categories_json_str = "${categories_json_str?substring(0,(categories_json_str?length-1))}" />
<#assign categories_json_str = categories_json_str +  "]" />
${categories_json_str}