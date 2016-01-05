<#assign nodeId = [ "${coreNode.id}" ] />
<#assign nodetype = [ "${coreNode.nodeType}" ] />
<#list coreNode.ancestors as ancestor >
    <#assign nodeId = nodeId + [ "${ancestor.id}" ] />
    <#assign nodetype = nodetype + [ "${ancestor.nodeType}" ] />
</#list>

<#list nodeId as x>
${x}
</#list>

<#list nodetype as y>
${y}
</#list>