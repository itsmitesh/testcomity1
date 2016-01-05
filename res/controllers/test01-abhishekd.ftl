<#assign userIds = http.request.parameters.name.get("communityIds","1,2")?html>
 
 <#list userIds?split(",") as userId >
 	${userId}
 </#list>

 