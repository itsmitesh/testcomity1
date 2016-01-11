<#assign custome_recent_threads = rest("threads/recent?page_size=5") />
<div class="lia-panel lia-panel-standard custome_recent_post">
	<div class="lia-decoration-border">
		<div class="lia-decoration-border-top">
			<div></div>
		</div>
		<div class="lia-decoration-border-content">
			<div>
				<div class="lia-panel-heading-bar-wrapper">
					<div class="lia-panel-heading-bar">
						<span class="lia-panel-heading-bar-title">Recent post by ${user.login}</span>
					</div>
				</div>
				<div class="lia-panel-content-wrapper">
					<div class="lia-panel-content">
						<!-- add your content here -->
						<table style="width:100%" border="1">
							<tr>
								<th>Title</th>
								<th>Replies</th>
								<th>Post Date</th>
							</tr>
							<#if custome_recent_threads?? && custome_recent_threads.threads??> 
								<#list custome_recent_threads.threads as msg>
									<#if msg?? && msg.thread??> 
										<#list msg.thread as var>
											<tr>
												<td><a href="${var.@view_href}">${var.messages.topic.subject }</a></td>
												<td>
													 
													${( var.messages.count?number)-1}
													
					</td>
												<td>${(var.messages.topic.post_time)?date("yyyy-MM-dd")?string("EEE, dd MMMM yyyy")}</td>
											</tr>
										</#list> 
									</#if>
								</#list> 
							</#if>	
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