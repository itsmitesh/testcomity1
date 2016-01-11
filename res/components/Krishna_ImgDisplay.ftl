 <div class="Mprofile">
    <#assign uname = restadmin("/users/id/${user.id}/login").value/>
	<#assign Mrank = restadmin("/users/id/${user.id}/ranking").ranking.name/>
	<#assign rdate=restadmin("/users/id/${user.id}").user.registration_time/>
	<#assign img=restadmin("/users/id/${user.id}/ranking").ranking.display.left_image.url/>
	
<div>

	<table>
			<tbody>
						<tr>
										<td>
											
													<#assign userProfile = rest("users/id/${user.id}/profiles/avatar")/>
													<img class="lia-user-avatar-message"  src="${userProfile.image.url}"  alt="Profile Pic" height="50" width="50"/>
											
										</td>
									
										<td >

											<div class="right-aln">
												<img src="${img}">
							
												<span class="login-bold"><b>${uname}</b></span><br>
												${Mrank}<br>
												<p>Registered on : ${(rdate)?date("yyyy-MM-dd")?string("dd MMMM yyyy")}</p>
											</div>
										</td>

						</tr>

			</tbody>

	</table>
                            
		</div>
<br>

<style>

.right-aln{
padding-left:10px;
}

#lia-body .lia-content p{
margin: 0px;
}


.column-tab{
margin-left:10px;
}

.login-bold{
 color:#456789;
}

.Mprofile{
margin-left=10px;
}
.kp{
margin-bottom:5px;
}
</style>

