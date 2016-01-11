<#assign categories = restadmin("/categories").categories />

    <#list categories.category as category>
        <div>Display the ${category.title} here .... ${category.@view_href}</div>
    </#list>