<#if user.registered>
            <#assign userid = user.id!'0'/>
            <#assign userDetailResponse = restadmin("2.0", "/search?q="+ "SELECT * FROM users WHERE id = '${userid}'"?url) />
            <#assign userDetail = userDetailResponse.data.items[0] />
            <#assign userDetails = userDetail />
            
            <#assign signature = (restadmin("/users/id/${user.id}/profiles/name/signature").value)!''/>
            
            
            <#assign user_has_role = false />
            
            <#-- Get the user ID, and set whether the user is a Moderator or Administrator -->
            <#list restadmin("/users/id/" + userid + "/roles").roles.role as role>
                <#if role.name?? && (role.name == "Moderator" || role.name == "Administrator")>
                       in admin mod
                </#if>
            </#list>
            <h1 class="lia-rmit-welcome-text"> Welcome <span class="readerhiddentext">user </span>${user.login}</h1>
        <#else>
            <h1 class="lia-rmit-welcome-text">Welcome to our fledgling Technology peer-support community!</h1>
        </#if>