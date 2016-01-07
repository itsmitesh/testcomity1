<#--
function userHasOneOfRanks rankList
  Checks whether the user has one of the ranks specified in rankList 
  Returns true if the user's rank is in the provided list of ranks
  Returns false otherwise, or if the user is anonymous

-->
<#function userHasOneOfRanks rankList>
<#if user?? && user.registered && user.ranking?? && user.ranking.name??>
	<#list rankList as rank>
		<#if rank?string == user.ranking.name?string><#return true></#if>
	</#list>
</#if>
<#return false>
</#function>

<#--
function userHasNotOneOfRanks rankList
  Checks whether the user has not one of the ranks specified in rankList 
  Returns true if the user's rank is not in the provided list of ranks , or if the user is anonymous
  Returns false otherwise

-->
<#function userHasNotOneOfRanks rankList>
<#if user?? && user.registered && user.ranking?? && user.ranking.name??>
	<#list rankList as rank>
		<#if rank?string == user.ranking.name?string><#return false></#if>
	</#list>
	<#return true>
</#if>
<#return true>
</#function>