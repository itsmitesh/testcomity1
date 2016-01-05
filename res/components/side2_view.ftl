<#assign kudoct=restadmin("/users/login/${user.login}/kudos/given/messages/recent").messages/>
<div class="main">
<h1> Posts ${user.login} Liked</h1><br>
<table id="tableh">
	
	<thead align="left">
						<tr>
								<b><td class="head">SUBJECT</td>
								<td class="head align">KUDOS</td>
								<td class="head">POSTED</td></b>
						</tr>
	</thead>					
				<#list kudoct.message as msg1>
							
						<tr class="post-line">
						
							<td class="columnaln"><a href="${msg1.@view_href}">${msg1.subject}</a></td>
												
							<td class="columnposition">${( msg1.kudos.count)}</td>    
									
							<td>${(msg1.post_time)?date("yyyy-MM-dd")?string("EEE, dd MMMM yyyy")}</td>
									
						</tr>
									
							    							
				</#list>
							
							


</table>
</div>

<style>

.main{ 
  border: 1px solid #d3d3d3;
 padding: 2px 2px; 
 border-radius: 5px;

 }
.post-line:nth-child(odd)
		{
        background-color:#eee;
		margin-top:5px;
		margin-bottom:5px;
 }
 
 
 .post-line:nth-child(even)
		{ 
		background-color:#fff; 
		margin-top:5px;
		margin-bottom:5px;
		}
 
#tableh{
width:100%; 
}

.head{
color: darkgray;
}

#tableh .head.align{
text-align: right;
padding-right: 30px;
}
 
#tableh td.columnposition{
text-align: right;
padding-right: 30px; 
}



#tableh tr{
line-height:30px;
}

td.columnaln {
    width: 55%;
	color:#456789;
}
</style>