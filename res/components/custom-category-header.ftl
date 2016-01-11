<#import "user-utils.ftl" as userUtils />

<#if userUtils.userHasOneOfRanks(["Staff","Staff Moderator","Moderator","Community Manager","Community Ambassador"])>
	<@component id="quilt:CustomHeaderAmbassador" />
<#else>
	<@component id="quilt:CustomHeaderRegUser" />
</#if>