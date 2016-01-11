<#if coreNode.nodeType == "category">
<div
  class="lia-panel lia-panel-standard BoardBrowserListTaplet Chrome lia-componentforums-widget-board-browser-list">
  <div class="lia-decoration-border">
    <div class="lia-decoration-border-top">
      <div></div>
    </div>
    <div class="lia-decoration-border-content">
      <div>
        <div class="lia-panel-content-wrapper">
          <div class="lia-panel-content">
            <div class="BoardBrowserListTaplet"
              id="boardBrowserListTaplet">
			  <#assign boardcount = rest("/categories/id/${coreNode.id}/boards/count").value?number />
			  <#if boardcount gt 0>
			  <div class="CategoryListDisplay lia-browser-category-list">
                <div class="lia-browser-category-heading<#if coreNode.id == "Qik"> category-qik<#elseif coreNode.id == "GroupMe"> category-groupme</#if>">
                  <h4>
                    <span class="lia-link-navigation category-title title-h4">${coreNode.title}</span>
                  </h4>
                </div>
				<div class="BoardList">
                  <div class="t-data-grid">
                    <table class="lia-list-wide">
                      <#list rest("/categories/id/${coreNode.id}/boards").boards.board as board> <#assign
                      topics_nr = rest("/boards/id/" + board.id +
                      "/topics/count").value?number /> <#assign
                      replies_nr = rest("/boards/id/" + board.id +
                      "/replies/count").value?number /> <#assign
                      latest_posts = rest("/boards/id/" + board.id +
                      "/posts/recent").messages />
                        <#assign messages_count = rest("/boards/id/" + board.id + "/messages/count").value />
                        <#assign messages_count_read = rest("/boards/id/" + board.id + "/messages/read/count").value />
<#assign new_posts = messages_count != messages_count_read  />

 <#if latest_posts.message?size gt 0> <#assign latest_post = latest_posts.message?first /> </#if>

<!--  messages count: ${messages_count}. read messages count: ${messages_count_read} -->
                      <tr
                        class="lia-list-row lia-row-<#if board_index % 2 == 
0>odd<#else>even</#if><#if board_index == 0> t-first</#if><#if board_has_next == false> tlast</#if>">
                        <td
                          class="boardIconColumn lia-data-cell-tertiary lia-datacell-icon">
                          <div class="board-icon">
                            <a class="lia-link-navigation board-icon"
                              href="${board.@view_href}" tabindex="-1">
								<#if board.interaction_style == "blog">
									<img title="${text.format("images.icon_blog.tooltip")}" alt="${text.format("images.icon_blog.alt")}" src="<#if new_posts>${(" skin.images.icon_blog_thread_new.url")?eval}<#else>${(" skin.images.icon_blog_thread.url")?eval}</#if>" />
								<#elseif board.interaction_style == "group">
									<img title="${text.format("images.icon_group.tooltip")}" alt="${text.format("images.icon_group.alt")}" src="<#if new_posts>${(" skin.images.icon_group_thread_new.url")?eval}<#else>${(" skin.images.icon_group_thread.url")?eval}</#if>" />
								<#elseif board.interaction_style == "idea">
									<img title="${text.format("images.icon_idea.tooltip")}" alt="${text.format("images.icon_idea.alt")}" src="<#if new_posts>${(" skin.images.icon_ideas_new.url")?eval}<#else>${(" skin.images.icon_ideas.url")?eval}</#if>" />
								<#else>
									<img title="${text.format("images.icon_board.tooltip")}" alt="${text.format("images.icon_board.alt")}" src="<#if new_posts>${(" skin.images.icon_thread_new.url")?eval}<#else>${(" skin.images.icon_thread.url")?eval}</#if>" />
								</#if>
							</a>
                          </div>
                        </td>
                        <td
                          class="boardTitleColumn lia-data-cell-primary lia-datacell-text">
                          <h3 class="board-title">
                            <a
                              class="lia-link-navigation lia-message-read"
                              href="${board.@view_href}">${board.title}</a>
                          </h3>
                          <div class="board-description">${board.description}</div>
                        </td>
                        <td
                          class="messageCountColumn lia-data-cell-secondary liadata-cell-integer">
<div class="text-p2 bolder"> ${topics_nr} </div>                  <div class="text-p3"> ${text.format("general.threads")} </div>
     
                        </td>
                        <td
                          class="messageCountColumn lia-data-cell-secondary liadata-cell-integer">
<div class="text-p2 bolder"> ${replies_nr} </div>                  <div class="text-p3"> ${text.format("general.replies")} </div>

                        </td>
                        <td
                          class="latestPostDateColumn lia-data-cell-secondary liadata-cell-date ">
                          <#if latest_posts.message?size gt 0> 
<div class="text-p2"><#if board.interaction_style == "idea">${text.format("page.list.linear.header.latest_post@place:idea")}<#else>${text.format("page.list.linear.header.latest_post")}</#if>: <a href="${latest_post.@view_href}"> ${utils.html.truncate(25, "${latest_post.subject}", "...")} </a></div>
<div class="text-p3">
                          <img src="${("skin.images.icon_anonymous_favicon")?eval}" /> ${text.format("page.list.by")} <#if latest_post.author.login != "" && latest_post.author.login != "Anonymous"><a href="${latest_post.author.@view_href}">${latest_post.author.login}</a><#else><s>Anonymous</s></#if>  ${text.format("skype.latest_post.at")}
                          <a href="${latest_post.@view_href}" alt="Link to topic" title="${latest_post.last_edit_time.@view_date} ${latest_post.last_edit_time.@view_time}">
							<#if latest_post.last_edit_time.@view_friendly_date?? && latest_post.last_edit_time.@view_friendly_date?has_content>
								<#if latest_post.last_edit_time.@view_friendly_date = "">									
									${latest_post.last_edit_time.@view_date} ${latest_post.last_edit_time.@view_time}
								<#else>								
									${latest_post.last_edit_time.@view_friendly_date}
								</#if>
							<#else>
								${latest_post.last_edit_time.@view_date} ${latest_post.last_edit_time.@view_time}
							</#if>
						  </a> </div>
                          </#if>
                        </td>
                      </tr>
					  </#list>
                    </table>
                  </div>
                </div>
		      </div>
			  </#if>
              <#list
              rest("/categories/id/${coreNode.id}/categories").categories.category
              as category>
              <div class="CategoryListDisplay lia-browser-category-list">
                <div class="lia-browser-category-heading<#if category.id == "Qik"> category-qik<#elseif category.id == "GroupMe"> category-groupme</#if>">
                  <h4>
                    <a class="lia-link-navigation category-title title-h4"
                      href="${category.@view_href}">${category.title}</a>
                  </h4>
                </div>
                <div class="BoardList">
                  <div class="t-data-grid">
                    <table class="lia-list-wide">
                      <#list rest("/categories/id/" + category.id +
                      "/boards").boards.board as board> <#assign
                      topics_nr = rest("/boards/id/" + board.id +
                      "/topics/count").value?number /> <#assign
                      replies_nr = rest("/boards/id/" + board.id +
                      "/replies/count").value?number /> <#assign
                      latest_posts = rest("/boards/id/" + board.id +
                      "/posts/recent").messages />
                        <#assign messages_count = rest("/boards/id/" + board.id + "/messages/count").value />
                        <#assign messages_count_read = rest("/boards/id/" + board.id + "/messages/read/count").value />
<#assign new_posts = messages_count != messages_count_read  />

 <#if latest_posts.message?size gt 0> <#assign latest_post = latest_posts.message?first /> </#if>

<!--  messages count: ${messages_count}. read messages count: ${messages_count_read} -->
                      <tr
                        class="lia-list-row lia-row-<#if board_index % 2 == 
0>odd<#else>even</#if><#if board_index == 0> t-first</#if><#if board_has_next == false> tlast</#if>">
                        <td
                          class="boardIconColumn lia-data-cell-tertiary lia-datacell-icon">
                          <div class="board-icon">
                            <a class="lia-link-navigation board-icon"
                              href="${board.@view_href}" tabindex="-1">
								<#if board.interaction_style == "blog">
									<img title="${text.format("images.icon_blog.tooltip")}" alt="${text.format("images.icon_blog.alt")}" src="<#if new_posts>${(" skin.images.icon_blog_thread_new.url")?eval}<#else>${(" skin.images.icon_blog_thread.url")?eval}</#if>" />
								<#elseif board.interaction_style == "group">
									<img title="${text.format("images.icon_group.tooltip")}" alt="${text.format("images.icon_group.alt")}" src="<#if new_posts>${(" skin.images.icon_group_thread_new.url")?eval}<#else>${(" skin.images.icon_group_thread.url")?eval}</#if>" />
								<#elseif board.interaction_style == "idea">
									<img title="${text.format("images.icon_idea.tooltip")}" alt="${text.format("images.icon_idea.alt")}" src="<#if new_posts>${(" skin.images.icon_ideas_new.url")?eval}<#else>${(" skin.images.icon_ideas.url")?eval}</#if>" />
								<#else>
									<img title="${text.format("images.icon_board.tooltip")}" alt="${text.format("images.icon_board.alt")}" src="<#if new_posts>${(" skin.images.icon_thread_new.url")?eval}<#else>${(" skin.images.icon_thread.url")?eval}</#if>" />
								</#if>
							</a>
                          </div>
                        </td>
                        <td
                          class="boardTitleColumn lia-data-cell-primary lia-datacell-text">
                          <h3 class="board-title">
                            <a
                              class="lia-link-navigation lia-message-read"
                              href="${board.@view_href}">${board.title}</a>
                          </h3>
                          <div class="board-description">${board.description}</div>
                        </td>
                        <td
                          class="messageCountColumn lia-data-cell-secondary liadata-cell-integer">
<div class="text-p2 bolder"> ${topics_nr} </div>                  <div class="text-p3"> ${text.format("general.threads")} </div>
     
                        </td>
                        <td
                          class="messageCountColumn lia-data-cell-secondary liadata-cell-integer">
<div class="text-p2 bolder"> ${replies_nr} </div>                  <div class="text-p3"> ${text.format("general.replies")} </div>

                        </td>
                        <td
                          class="latestPostDateColumn lia-data-cell-secondary liadata-cell-date ">
                          <#if latest_posts.message?size gt 0> 
<div class="text-p2"><#if board.interaction_style == "idea">${text.format("page.list.linear.header.latest_post@place:idea")}<#else>${text.format("page.list.linear.header.latest_post")}</#if>: <a href="${latest_post.@view_href}"> ${utils.html.truncate(25, "${latest_post.subject}", "...")} </a></div>
<div class="text-p3">
                          <img src="${("skin.images.icon_anonymous_favicon")?eval}" /> ${text.format("page.list.by")} <#if latest_post.author.login != "" && latest_post.author.login != "Anonymous"><a href="${latest_post.author.@view_href}">${latest_post.author.login}</a><#else><s>Anonymous</s></#if> ${text.format("skype.latest_post.at")}
                          <a href="${latest_post.@view_href}" alt="Link to topic" title="${latest_post.last_edit_time.@view_date} ${latest_post.last_edit_time.@view_time}">
							<#if latest_post.last_edit_time.@view_friendly_date?? && latest_post.last_edit_time.@view_friendly_date?has_content>
								<#if latest_post.last_edit_time.@view_friendly_date = "">									
									${latest_post.last_edit_time.@view_date} ${latest_post.last_edit_time.@view_time}
								<#else>								
									${latest_post.last_edit_time.@view_friendly_date}
								</#if>
							<#else>
								${latest_post.last_edit_time.@view_date} ${latest_post.last_edit_time.@view_time}
							</#if>
						  </a></div>
                          </#if>
                        </td>
                      </tr>
                      </#list>
                    </table>
                  </div>
                </div>
              </div>
              </#list>
            </div>
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