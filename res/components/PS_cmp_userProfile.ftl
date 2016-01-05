<#if user.login != "Anonymous">
<#assign userAvatar = rest("users/id/${user.id}/profiles/avatar")/>
<#assign reg_date = restadmin("/users/id/${user.id}/registration_time").value/>
<#assign my_username = restadmin("/users/id/${user.id}/login").value/>
<#assign my_rank = restadmin("/users/id/${user.id}/ranking").ranking.name/>


<hr noshade size=4 width="100%">

<table id="userTab">
<tr>
    <td>
        <img class="vi-avatar-image" src="${userAvatar.image.url}" height="36" width="64"/> 
    </td>

    <td>
	<div class="vi-user-details">
	
		<table>
		<tr>
		    <td>
                        <#if my_rank == "Community Manager">
                         <img src="http://comity.stage.lithium.com/i/rank_icons/admin.gif" />
                         </#if>
                  	
                         <#if my_rank == "Moderator">
                          <img src="/i/rank_icons/moderator.gif"/>
                         </#if>

                         <b>${my_username}</b>
		    </td>
		</tr>
		<tr bgcolor="#FFFFFF">
		     <td>
                          ${my_rank}		
		     </td>
		</tr>
                <tr>
                     <td>
		      Registered on: ${(reg_date)?date("yyyy-MM-dd")?string("dd MMMM yyyy")}
                     </td>
                </tr>
		</table>
	</div>
      </td>
</tr>
</table>						

<br/>

<#else>
        Please Login
</#if>

<style>

.vi-user-details{
padding-left: 5px;
}

.vi-avatar-image
  padding-left: 5px;
  padding-bottom: 5px;
}



.PS_CustomPage .SearchForm {
    width: auto;
    float: left;
}
.PS_CustomPage .lia-menu-navigation-wrapper{
    width: auto;
    float: right;
}
.PS_CustomPage .dropdown-default-item{
    width: auto;
    float: left;
}
</style>

		

		