<div class="main">
	<#assign post_st = restadmin("users/id/${user.id}/posts/recent?page_size=5").messages/>	
		<h1 class="title"> Latests Posts By <a class="name"> ${user.login}</a> </h1>				
			<#if (post_st.message?size > 0 ) >
				<#list post_st.message as msgg>
						<div class="Postn">
						<p class="sub">${msgg.subject}</p><a class="kudos">${(msgg.kudos.count)}</a>
						<p>${(msgg.post_time)?date("yyyy-MM-dd")?string("EEE, dd MMMM yyyy")}</p>
						</div>
						<br>
				</#list> 
			<#else>
						<h1>Record Not Found</h1>
             </#if>	
</div>

<style>
 
 .postn{
 border: 5px solid #d3d3d3;
 border-radius: 5px;
 }
 
 .Postn .sub{
 float:left:
 }
 
 .Postn .kudos{
 float:left;
 float:clear;
 }
 
 
 .main .title{
 margin-bottom:10px;
 }
 
 .main{ 
 border: 1px solid #d3d3d3;
 padding: 2px 2px; 
 border-radius: 5px;
 }
 
.name{
color:#71B02F;
}

.Postn .kudos{
margin-left:50px;
color:#71B02F;
}
 </style>

  
 