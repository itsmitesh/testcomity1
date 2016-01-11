<#assign enableKudos = settings.name.get("config.enable_kudos") />
<#assign leaderboardAge = settings.name.get("profile.kudos_user_leaderboard_time") />
<#assign leaderboardSize = settings.name.get("layout.kudos-leaderboard-module-users-list-size") />

<#if enableKudos == "true">
	<#assign kudoedAuthors = rest("kudos/authors/leaderboard?max_age=${leaderboardAge}&page_size=${leaderboardSize}").users />
	<div class="cm-kudoed-authors-panel">
		<#list kudoedAuthors.user as userDetails>
			<div class="lia-user-avatar cm-individual-author">
				<@component id="common.widget.user-avatar" user="conv:${userDetails.id}" avatarDisplaySize="profile" />
				<div class="cm-kudoed-author">${userDetails.login}</div>
				<div class="cm-kudos-count">${userDetails.mixin.kudos.weight}</div>
			</div>
		</#list>
	</div>
</#if>

<style>
.cm-kudoed-authors-panel {
display: flex;
flex-wrap: wrap;
}

.cm-individual-author {
	flex-basis: 66px;
	margin: 12px auto auto;
	text-align: center;
	font-size: 94%;
        position: relative;
}

.cm-individual-author .UserAvatar img {
	width: 50px !important;
	height: 50px !important;
	max-width: 50px !important;
	max-height: 50px !important;
	border-radius: 50%;
	border-width: 0px;
	box-shadow: none;
	line-height: 18px;
}

.cm-kudos-count {
	position: absolute;
	top: 0;
	right: 0;
}
</style>