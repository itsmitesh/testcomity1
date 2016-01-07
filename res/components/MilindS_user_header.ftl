<#assign userDetails = restadmin("/users/id/${user.id}") />
<#assign userRank = restadmin("/users/id/${user.id}/ranking").ranking.name />
<#assign avatar = restadmin("/users/id/${user.id}/profiles/avatar/size/unspecified") />

<#if userDetails.user??>
<div class="header_div">
	<div class="profile_info">
		<div class="avatar_img">
			<#if avatar.image??>
				<img src="${avatar.image.url}" />
			</#if>
		</div>	
		<div class="user_info">
			<span>User Name: <b>${userDetails.user.login}</b> </span>
			<span>Ranks : <b> <#if userRank??>${userRank}</#if> </b></span>
			<span>
				 Registered on ${userDetails.user.registration_time}
			</span>
		</div>
	</div>
</div>
</#if>