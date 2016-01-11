<#assign my_username = restadmin("/users/id/${user.id}/login").value/>
<#assign kudos_given = rest("/users/login/${my_username}/kudos/given/messages/recent?message_viewer.topic_sort_order=last_post_date&page_size=5").messages.message />
<#assign recent_posts = rest("/posts/recent?page_size=5").messages />
WelCome ${my_username}. Below list shows all recent posts in community.

<!-- http://community.lithium.com/community-name/restapi/vc/posts/recent?page_size=10 -->

<table class="lia-list-wide">
	<thead id="columns">
		<tr>
			<th scope="col" class="messageSubjectColumn lia-data-cell-primary lia-data-cell-text">Subject</th>
			<th scope="col" class="messageBoardColumn lia-data-cell-secondary lia-data-cell-text">Kudos Count</th>
			<th scope="col" class="messageBoardColumn lia-data-cell-secondary lia-data-cell-text">Post Date</th>
		</tr>
	</thead>
<tbody>
<#list recent_posts as msg>
	<tr class="lia-list-row lia-row-even lia-list-row-thread-unread t-first">
		<td colspan="1" rowspan="1" class="messageSubjectColumn lia-data-cell-primary lia-data-cell-text">
			<div class="MessageSubjectCell">
				<div class="MessageSubject">
					<div class="MessageSubjectIcons ">
						<span class="message-subject">
							<a class="page-link lia-link-navigation lia-custom-event" href= ${msg.@view_href} target="_blank"> 
								${msg.author.login}
							</a>
						</span>
					</div>
				</div>
			</div>
		</td>
		<td colspan="1" rowspan="1" class="assignedBoardColumn lia-data-cell-secondary lia-data-cell-text">
			<div class="MessageSubjectCell">
				<div class="MessageSubject">
					<div class="message-subject-board">
						${msg.kudos.count}
					</div>
				</div>
			</div>
		</td>
		<td colspan="1" rowspan="1" class="messagePostDateColumn lia-data-cell-secondary lia-data-cell-date">
			<span class="DateTime">
				<span class="local-date">${msg.post_time?date("yyyy-MM-dd")?string("EEE, dd MMMM yyyy")}</span>
			</span>
		</td>
	</tr>
</#list>
</tbody>
</table>