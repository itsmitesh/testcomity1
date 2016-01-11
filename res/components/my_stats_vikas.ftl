<div class="lia-panel lia-panel-standard MessageListTaplet lia-component-forums-widget-recent-messages">
	<div class="lia-decoration-border">
		<div class="lia-decoration-border-top">
			<div>
			</div>
		</div>
		<div class="lia-decoration-border-content">
			<div>
				<div class="lia-panel-heading-bar-wrapper">
					<div class="lia-panel-heading-bar">
						<span class="lia-panel-heading-bar-title">My Stats</span>
					</div>
				</div>
				<div class="lia-panel-content-wrapper">
					<div class="lia-panel-content">
						<div class="SimpleMessageList">
							<div class="MessageList lia-component-forums-widget-message-list" id="messageList">
								<a shape="rect" name="message-list"></a>
								<div class="t-data-grid single-message-list">
									<table class="lia-list-wide">
									<tbody>
										<#assign user_details = rest("users/id/${user.id}/metrics").metrics>
										<#list user_details.metric as user_stat>
											<tr> 
											<#if user_stat.@name="net_kudos_weight_received">
											<td><h1>Kudos recieved : </h1></td><td>${user_stat}</td>
											</#if>
											</tr>

											<tr> 
											<#if user_stat.@name="net_kudos_weight_given">
											<td><h1>Kudos given : </h1></td><td>${user_stat}</td>
											</#if>
											</tr>

											<tr> 
											<#if user_stat.@name="net_accepted_solutions">
											<td><h1>Solutions : </h1></td><td>${user_stat}</td>
											</#if>
											</tr>


											<tr> 
											<#if user_stat.@name="overall_posts">
											<td><h1>No. of Posts : </h1></td><td>${user_stat}</td>
											</#if>
											</tr>

											<tr> 
											<#if user_stat.@name="logins">
											<td><h1>Login Count : </h1></td><td>${user_stat}</td>
											</#if>
											</tr>
											
											<tr> 
											<#if user_stat.@name="minutes_online">
											<td><h1>Minutes Online : </h1></td><td>${user_stat}</td>
											</#if>
											</tr>
										</#list>
									</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="lia-decoration-border-bottom">
			<div>
			</div>
		</div>
	</div>
</div>