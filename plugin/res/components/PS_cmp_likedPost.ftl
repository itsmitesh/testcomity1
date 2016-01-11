<#if user.login != "Anonymous">
<br/>
<div class="likedPosts">
<h1 style="color: #808080;
    font-size: 18px;
    font-family: Arial;
    font-weight: bold;">Post ${user.login} liked</h1>
<br/>
     
     <#assign user_like_post_data=rest("users/id/${user.id}/kudos/given/messages/recent") />
     <table id="tab-like" style="width:100%">
	<tr>
	    <th>SUBJECT</th>
	    <th>KUDOS</th>
	    <th>POSTED</th>
	</tr>
        <#list user_like_post_data.messages as like_post>
	      <#list like_post.message as key>
                 <tr>
	             <td><a href="${key.@view_href}">${key.subject}</a></td>
	             <td>${key.kudos.count}</td>
	             <td>${(key.post_time)?date("yyyy-MM-dd")?string("EEE, dd MMMM yyyy")}</td>
	         </tr>
	      </#list> 
	</#list>
      </table>
      
</div>
<#else>
        Please Login
</#if>


<style>
.likedPosts{
    border-radius: 5px;
    border: 1px solid #d3d3d3;
    padding: 5px; 
}
#tab-like tr{
line-height:20px;
}
table#tab-like tr:nth-child(even) {
    background-color: #eee;
}
table#tab-like tr:nth-child(odd) {
    background-color: #fff;
}
</style>