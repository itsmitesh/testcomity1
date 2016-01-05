<div class="main">
	
<#assign post_st = restadmin("users/id/${user.id}/posts/recent?page_size=5").messages/>	
${user.id}
<table id="tableh">
			 				
<h1> Recent Posts By ${user.login}</h1><br>					
							
<thead align="left">
    <tr>
   					<th class="chead">SUBJECT</th>		
                    <th class="chead align1">REPLIES</th>	
                    <th class="chead">POSTED</th>
    </tr>
</thead>

                                     				
								<#list post_st.message as msgg>
								
														
									<tr class="post_line">
									
											<td class="subject"><a href="${msgg.@view_href}">${msgg.subject}</a></td>
									
											<td class="kuods"> ${(msgg.kudos.count)}</td>    
											
											<td>${(msgg.post_time)?date("yyyy-MM-dd")?string("EEE, dd MMMM yyyy")}</td>
										
									</tr>
										
									
								</#list> 
</table>




        </div>
   <br>


<style>
 
 .main{ 
 border: 1px solid #d3d3d3;
 padding: 2px 2px; 
 border-radius: 5px;
 }
.post_line:nth-child(odd)
		{
        background-color:#eee;
		margin-top:5px;
		margin-bottom:5px;
 }
 
.post_line:nth-child(even)
		{ background-color:#fff; 
		margin-top:5px;
		margin-bottom:5px;
		}
 
.chead{
color: darkgray;
}

#tableh .chead.align1{
text-align: right;
padding-right: 30px;
}
 

#tableh tr{
line-height:30px;
}
td.subject {
    width: 55%;
	color:#456789;
}
#tableh{
width:100%; 
}

#tableh td.kuods{
text-align: right;
padding-right: 30px;
}
</style>

  
