<#assign str = "/html/assets/img1.jpg">
<#assign Index = str?index_of(".jpg") />
<#assign LastIndex = str?last_index_of("/") />
<#assign text = str?substring(LastIndex+1,Index) />
${text}