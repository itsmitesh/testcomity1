<#assign top_authors = restadmin("/kudos/authors/leaderboard?max_age=all&page_size=5") />

<div class="top_authors">
  <ul>
     <#list top_authors.users.user as author>
       <#assign userAvatar = rest("users/id/${author.id}/profiles/avatar")/>
        <li>
	        <div class="left">
	        	<img class="vi-avatar-image" src="${userAvatar.image.url}" alt="Profile Pic" height="100" width="100"/> 
			</div>
			<div class="right"> 
				<#assign author_profiles = restadmin("/users/id/${author.id}/profiles").profiles />
		            <#assign author_fname = "" />
		            <#assign author_lname = "" />
					<#list author_profiles.profile as x>
		              <#if x.@name == "name_first">
		                <#assign author_fname = x />
		              </#if>
		              <#if x.@name == "name_last">
		                <#assign author_lname = x />
		              </#if>
		            </#list>
		            <span>${author_fname} ${author_lname}</span>
		            <#assign user_details = rest("users/id/${author.id}/metrics").metrics>
					<#list user_details.metric as user_stat>
						<tr> 
							<#if user_stat.@name="net_kudos_weight_received">
							   <td><h1>Kudos recieved : </h1></td><td>${user_stat}</td>
							</#if>
						</tr>
						<tr> 
							<#if user_stat.@name="overall_posts">
								<td><h1>No. of Posts : </h1></td><td>${user_stat}</td>
							</#if>
						</tr>
					</#list>
			</div>
     	</li>
    </#list>
  </ul>
</div>