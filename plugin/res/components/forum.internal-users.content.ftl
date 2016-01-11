<#import "user-utils.ftl" as userUtils />
<#if userUtils.userHasOneOfRanks(["Community Ambassador","Staff Moderator","Moderator","Community Manager","Staff"])>
     <#assign is_community_translator = false />

	
	<div id="widget_recent_msgs">
		<@component id="forums.widget.recent-messages"/>
		<@component id="forums.widget.recent-threads"/>
	</div>

	<div>
	<div>
	<@component id="community.widget.quick-links"/>
	<a class="lia-link-navigation"  rel="nofollow" href="${community.urls.tapestryPrefix}/media/imageconsolepage">Image console</a>
	<br />
	<a class="lia-link-navigation" rel="nofollow" href="${community.urls.tapestryPrefix}/Moderation-and-Management/ct-p/Moderation">Moderation category</a>
	<br />

	<#if is_community_translator >
		<a class="lia-link-navigation" rel="nofollow" href="${community.urls.tapestryPrefix}/MacOS-Translations/bd-p/internal_mac_translations">Mac Translations board</a>
		<br />
		<a class="lia-link-navigation" rel="nofollow" href="${community.urls.tapestryPrefix}/iOS-Translations/bd-p/internal_ios_translation">iOS Translations board</a>
	<#else>
		<a class="lia-link-navigation" rel="nofollow" href="/t5/Suggestions-for-this-Community/Community-Guidelines/td-p/20">Community Guidelines</a>
	</#if>
	</div>
	
	<div>
	<@component id="community.widget.admin-links"/>

        <@component id="custom.LSI-link"/>

	</div>
	</div>
</#if>