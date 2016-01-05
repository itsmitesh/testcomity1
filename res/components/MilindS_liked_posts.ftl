<div class="lia-panel lia-panel-standard user_like_post">
	<div class="lia-decoration-border">
		<div class="lia-decoration-border-top">
			<div></div>
		</div>
		<div class="lia-decoration-border-content">
			<div>
				<div class="lia-panel-heading-bar-wrapper">
					<div class="lia-panel-heading-bar">
						<span class="lia-panel-heading-bar-title">Post ${user.login} like</span>
					</div>
				</div>
				<div class="lia-panel-content-wrapper">
					<div class="lia-panel-content">
						<#assign user_like_post_data=rest("users/id/5/kudos/given/messages/recent") />
						<#if user_like_post_data?? && user_like_post_data.messages??>
							<table border="1" cellpading="2" cellspacing="2">
								<tr>
									<th>Title</th>
									<th>Kudos Count</th>
									<th>Post Date</th>
								</tr>
							<#list user_like_post_data.messages as like_post>
								<#if like_post?? && like_post.message??>
									<#list like_post.message as key>
									<tr>
										<td><a href="${key.@view_href}">${key.subject}</a></td>
										<td>${key.kudos.count}</td>
										<td>${(key.post_time)?date("yyyy-MM-dd")?string("EEE, dd MMMM yyyy")}</td>
									</tr>
									</#list> 
								</#if>
							</#list>
							</table>
						</#if>
					</div>
				</div>
			</div>
		</div>
		<div class="lia-decoration-border-bottom">
			<div></div>
	</div>
</div>
<style>
</style>