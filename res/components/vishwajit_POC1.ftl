<#attempt>
<#assign staticBoardIds = ["vishwajiy_Blog","vishwajit_blog2"] />
<div class="lia-panel lia-panel-standard BlogListTaplet lia-component-blogs-widget-blog-list">
	<div class="lia-decoration-border">
		<div class="lia-decoration-border-top">
			<div>
			</div>
		</div>
		<div class="lia-decoration-border-content">
			<div class="lia-panel-heading-bar-wrapper">
				<div class="lia-panel-heading-bar">
					<span class="lia-panel-heading-bar-title">Infoblox Blogs
					</span>
				</div>
			</div>
			<div class="Blog_List">
				<#assign blogBoards = rest("/categories/id/vishwajit_shinde").category.blogs.blog />
				<#list blogBoards as dynamicBlog>
				  <#if staticBoardIds?seq_index_of(dynamicBlog.id) == -1>
					<#assign staticBoardIds = staticBoardIds + [dynamicBlog.id] />
				  </#if>
				</#list>

				<#list staticBoardIds as blog>
				  <#assign blogBoard = rest("/boards/id/${blog}").board />
				  <div class="bloglist-Wrapper">
					<div class="bloglist-titleDiscription-Wrap">
					  <div class="bloglist-title lia-panel-heading-bar-wrapper">
						<div class="lia-panel-heading-bar">
						  <a href="${blogBoard.@view_href}" class="lia-panel-heading-bar-title">${blogBoard.title}</a>
						</div>
					  </div>
					  <div class="bloglist-discription">
						<#assign BoardLength = 60 />
						<#if ((blogBoard.description?length)  > BoardLength)>
							<#assign lastspaceIndex= blogBoard.description?substring(0,BoardLength-3)?last_index_of(" ") />
						<#if lastspaceIndex!=-1>
							<div class="truncatediscription">${blogBoard.description?substring(0,lastspaceIndex)}...</div>
						<#else>
							<div class="truncatediscription" style="word-break:break-all;">${blogBoard.description?substring(0,BoardLength-3)}...</div>
						</#if>
						<#else>
							<div class="truncatediscription">${blogBoard.description}</div>
						</#if>
					  </div>
					</div>
				  </div>
				</#list>
			</div>
		</div>
		<div class="lia-decoration-border-bottom">
			<div>
			</div>
		</div>
	</div>
</div>

<#recover>
  Error in component.
</#attempt>