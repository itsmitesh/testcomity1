<#assign messageToken = http.request.parameters.name.get("token","") />
<#assign messageEvent = http.request.parameters.name.get("event.type","") />
<#assign messageNode = http.request.parameters.name.get("message","")/>
<#assign result = restadmin("/messages/id/209/edit?message.body=IDEAcreated&credentials.identity_user=/users/login/vaishnaviG") />