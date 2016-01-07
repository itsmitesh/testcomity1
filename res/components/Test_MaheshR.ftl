<script src="/html/assets/moment.min.js"></script>
<#assign coreNodeId = coreNode.id />
<#assign coreNodeTitle = coreNode.title /> 
<#assign cardType = "Posts" />
<#assign cardHeading = "Most Recent Posts" />
<#assign restCall = "/topics/style/forum/recent?page_size=5&restapi.response_style=view" />

<#if coreNodeId=="TKB_Community_Articles">
	<#assign restCall = "/topics/style/tkb/recent?page_size=5&restapi.response_style=view" />
	<#assign cardType = "Articles" />
	<#assign cardHeading = "Recent Community Articles" />
</#if>



<#assign recentPosts = rest("${restCall}").messages />
<#if (recentPosts.message?size > 0 ) >
<div class="lia-panel lia-panel-standard most-recent-posts Chrome lia-component-most-recent-posts-widget">
	<div class="lia-decoration-border">
		<div class="lia-decoration-border-top">
			<div></div>
		</div>
		<div class="lia-decoration-border-content">
			<div>
				<div class="lia-panel-heading-bar-wrapper">
					<div class="side-widget-heading-bar">
						<span class="lia-panel-heading-bar-title">${cardHeading} </span>
					</div>
				</div>
				<div>
					<div class="lia-panel-content">
					
						<table class="lia-list-wide">
						
						<#list recentPosts.message as recentPostsList>
						<#assign recentSubject = recentPostsList.subject />
						
							<#-- <#assign WordArray = recentSubject?split(" ") >
							<#assign counter = 0 />
							<#assign MsgSubject = "" >
							<#list WordArray as word>
								<#assign WordLength = word?length />
								<#assign counter = counter + WordLength + 1 />
								<#if (counter < 45) >
									<#assign MsgSubject = MsgSubject + word + " " />
								<#else>
									<#assign MsgSubject = MsgSubject + "...">
									<#break>
								</#if>
							</#list> -->
					
							<tr>
								<td <#if !(recentPostsList_has_next)>class="last-td"</#if>>
									<div class="">										
											<#assign charLengthSub = 45 />
											<#if ((recentSubject?length)  > charLengthSub)>
												<#assign lastspaceIndex= recentSubject?substring(0,charLengthSub-3)?last_index_of(" ") />
												<#if lastspaceIndex!=-1>
													<#if recentSubject?substring(0,lastspaceIndex)?last_index_of(" ") != -1 >
														<a  class="recent-post-title dark-gray-font" href="${recentPostsList.@view_href}">${recentSubject?substring(0,lastspaceIndex)}...</a>
													<#else>
														<a  class="recent-post-title dark-gray-font" href="${recentPostsList.@view_href}" style="word-break:break-all;">${recentSubject?substring(0,lastspaceIndex)}...</a>
													</#if>
												<#else>
													<a  class="recent-post-title dark-gray-font" href="${recentPostsList.@view_href}" style="word-break:break-all;">${recentSubject?substring(0,charLengthSub-3)}...</a>
												</#if>
											<#else>
												<a  class="recent-post-title dark-gray-font" href="${recentPostsList.@view_href}">${recentSubject}</a>
											</#if>											
									
									</div>
									<div class="padTop">
										<a  class="light-gray-font" href="${recentPostsList.last_edit_author.@view_href}">${recentPostsList.last_edit_author.login}</a>
									</div>
								</td>
								<td <#if !(recentPostsList_has_next)>class="last-td"</#if> style="width:30%;">
									<div class="light-gray-font recentPost-date-${recentPostsList_index}" title="${recentPostsList.last_edit_time.@view_date} ${recentPostsList.last_edit_time.@view_time}">
										<@liaAddScript>
											var dt = moment('${recentPostsList.last_edit_time}').fromNow();
											console.log(dt);
											jQuery('.recentPost-date-${recentPostsList_index}').append(dt);
										</@liaAddScript>
									</div>
								</td>
							</tr>
						</#list>
						</table>
			
					</div>
				</div>
			</div>
		</div>
		<div class="lia-decoration-border-bottom">
			<div></div>
		</div>
	</div>
</div>
</#if>
