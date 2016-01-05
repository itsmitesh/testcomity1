<#if user.login != "Anonymous">
<div class="recentPosts">
<h1 style= "color: #808080;
    font-size: 18px;
    font-family: Arial;
    font-weight: bold;"> Recent Posts by ${user.login}</h1>
<br/>

<#assign rp = rest("users/id/${user.id}/posts/recent?page_size=5").messages/>

<table id="tab-recent" style="width:100%">
  <tr>
	<th>TITLE</th>		
        <th>REPLIES</th>
        <th>POSTED</th>
  </tr>
  <#list rp.message as msg>
    <tr>
       <td><a href="${msg.@view_href}">${msg.subject }</a></td>
       <td> ${msg.kudos.count}</td>
       <td>${(msg.post_time)?date("yyyy-MM-dd")?string("EEE, dd MMMM yyyy")}</td>
    </tr>
 </#list> 		
</table> 
</div>
<#else>
        Please Login
</#if>

<style>
table#tab-recent tr:nth-child(even) {
    background-color: #eee;
}
table#tab-recent tr:nth-child(odd) {
    background-color: #fff;
}
table th {
    color: #7C7C7C;
}
.recentPosts{
    border-radius: 5px;
    border: 1px solid #d3d3d3;
    padding:5px;
}
#tab-recent tr{
line-height:30px;

}
td{
text-align:left;
}
</style>
