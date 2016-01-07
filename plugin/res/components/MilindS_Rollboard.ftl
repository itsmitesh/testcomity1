<#assign user_role_data=rest("users/id/5/roles") />
<#assign avaliable_roles = rest("roles") />
<div class="lia-panel lia-panel-standard roll_tbl">
	<div class="lia-decoration-border">
		<div class="lia-decoration-border-top">
			<div></div>
		</div>
		<div class="lia-decoration-border-content">
			<div>
			   <div class="lia-panel-heading-bar-wrapper">
					<div class="lia-panel-heading-bar">
						<span class="lia-panel-heading-bar-title">
							Roles for Milind
						</span>
					</div>
			   </div>
					<div class="lia-panel-content-wrapper">
						<div class="lia-panel-content">
						<#if user_role_data?? && user_role_data.roles?? >
							<table class="lia-list-wide role_listing_tbl">
								<#list user_role_data.roles as r >
									<#list r.role as key>
									<tr class="lia-list-row" id='rw_${key.id}'>
										<td>${key.name}</td>
										<td>
<a href="#" class="rem_role lia-button lia-button-secondary remove-role-link lia-link-ticket-post-action" id="${key.id}">Remove</a></td>
									</tr>
									</#list>
								</#list>
							<table>
						</#if>
						</div>
					</div>
			</div>
		</div>
		<div class="lia-decoration-border-bottom">
			<#if avaliable_roles?? && avaliable_roles.roles?? >
			<fieldset>
				<legend> Add Role<legend>
				<select id="rl">
					<#list avaliable_roles.roles as key >
					   <#list key.role as r>
						   <#list user_role_data.roles as e >
								<#list e.role as k>
									<#if k.id=r.id >
										<#assign is_found =true /> 
										<#break>
									<#else>
										<#assign is_found =false />
									</#if>
								</#list>
							</#list>
							<#if is_found=false>
								<option value="${r.id}">${r.name}</option>
							</#if>
					   </#list>
					</#list>
				</select>
			</fieldset>
			</#if>
			<a id="add_role" class="lia-button lia-button-secondary add-role-link lia-link-ticket-post-action" herf="">Add New Role</a>
		</div>
	</div>
</div>
<#assign ajx_endpt_url = "/plugins/custom/comity/comity/milinds_add_delete_userrole" />
<@liaAddScript>
(function($){
	$(document).ready(function() {
		var dataString={};
		$(".rem_role").on("click",function(){
			roleid=$(this).attr('id');
			userId="5";
			crud_role(userId,roleid,"rem");
		});	
		$("#add_role").on('click',function(){
			roleid=$("#rl").val();
			userId="5";
			role_name=$('#rl option:selected').text();
			crud_role(userId,roleid,"add");
		}); 
		function crud_role(uid,rid,action){
            dataString={"userid":uid,"roleId":rid,"action":action};
           
			$.ajax({
				type: 'POST', 
				url:"${ajx_endpt_url}",
				data: dataString,
                dataType:'json',
				success:function(msg){ 
                    if(msg.resp=='true'){
						if(msg.action=="remove"){
							$('#'+msg.row_id).remove();
							$("#rl").append(msg.row);
						}
						if(msg.action=="add"){
							$('.role_listing_tbl').append(msg.row)
							$("#rl option[value='"+msg.row_id+"']").remove();
						}	
					}
				},
				error:function (XMLHttpRequest, textStatus, errorThrown) {
					console.log("Error==>"+textStatus);
				}
			});
		}
		
	});
})(LITHIUM.jQuery);
</@liaAddScript>