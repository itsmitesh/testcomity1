<#macro getUserDetails>
 <div>
	<#assign my_username = restadmin("/users/id/${user.id}/login").value/>
	<#assign my_rank = restadmin("/users/id/${user.id}/ranking").ranking.name/>
	<#assign my_role = restadmin("/users/id/${user.id}/roles").roles.role/>
	<#assign my_roles = ""/>
	<#list my_role as singlerole>
		<#assign my_roles = my_roles + singlerole.name />
	</#list>
	<table>
	<tbody>
		<tr class="lia-list-row lia-row-odd lia-list-row-thread-unread t-first">
			<td class="messageSubjectColumn lia-data-cell-primary lia-data-cell-text">
				<div class="MessageSubjectCell">
					<div class="MessageSubject">
						<div class="MessageSubjectIcons ">
							<h1 class="message-subject">
								${my_username}
							</h1>
						</div>
					</div>
				</div>
			</td>
		</tr>
		<tr class="lia-list-row lia-row-odd lia-list-row-thread-unread t-first">
			<td colspan="1" rowspan="1" class="messageSubjectColumn lia-data-cell-primary lia-data-cell-text">
				<div class="MessageSubjectCell">
					<div class="MessageSubject">
						<div class="MessageSubjectIcons ">
							${my_rank}
						</div>
					</div>
				</div>
			</td>
		</tr>
		<tr class="lia-list-row lia-row-odd lia-list-row-thread-unread t-first">
			<td colspan="1" rowspan="1" class="messageSubjectColumn lia-data-cell-primary lia-data-cell-text">
				<div class="MessageSubjectCell">
					<div class="MessageSubject">
						<div class="MessageSubjectIcons ">
								${my_roles}
						</div>
					</div>
				</div>
			</td>
		</tr>
	</tbody>
	</table>
 </div>
</#macro>
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
						<span class="lia-panel-heading-bar-title">My Profile</span>
					</div>
				</div>
				<div class="lia-panel-content-wrapper">
					<div class="lia-panel-content">
						<div class="SimpleMessageList">
							<div class="MessageList lia-component-forums-widget-message-list" id="messageList">
								<a shape="rect" name="message-list"></a>
								<div class="t-data-grid single-message-list">
								<table>
									<tbody>
									<tr>
										<td>
											<div>
												<#assign userAvatar = rest("users/id/${user.id}/profiles/avatar")/>
												<img class="vi-avatar-image" src="${userAvatar.image.url}" alt="Profile Pic" height="100" width="100"/>
											</div>
										</td>
										<td>
											<div class="vi-user-details">
												<#if usercache.get("personalDetails", "--EMPTY--") == "--EMPTY--">
												  <#assign userDetails><@getUserDetails/></#assign>
												  <#assign userDetails = usercache.put("personalDetails", userDetails) />
												</#if>
												${usercache.get("personalDetails")}
												<#assign my_status = restadmin("/users/id/${user.id}/online/minutes/count").value/>
												<#if my_status?number gt 0>
												   <img src="/skins/images/B1CEC0BCBE6003D27937B69476B5C01F/base/images/online.png"> Online
												<#else>
													<img src="/skins/images/B1CEC0BCBE6003D27937B69476B5C01F/base/images/offline.png"> Offline
												</#if>
											</div>
										</td>
									</tr>
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
<style>
.vi-user-details{
padding-left: 15px;
}
.vi-avatar-image
  padding-left: 5px;
  padding-bottom: 5px;
}
</style>