		<#assign baseURL = "https://api.ooyala.com/v2/assets?expires=1435748104&signature=olEnevWcDEopxSIZjYclZnaplk8%2BpCW9wYfl74C0Nro&api_key=prN246o5_Os0DbHd6SO7AXbUJNDY.LvRiP" />
		
		<#assign url = baseURL />
		<#assign response = http.client.request(url).get() />
		<#assign chunk = response.content />
		<#assign result = chunk?eval >

		<table class="lia-list-wide">
			<tbody>
				<#list result.items as msg>
									<tr class="lia-list-row lia-row-even lia-list-row-thread-unread t-first">
										<td colspan="1" rowspan="1" class="messageSubjectColumn lia-data-cell-primary lia-data-cell-text">
											<div class="MessageSubjectCell">
												<div class="MessageSubject">
													<div class="MessageSubjectIcons ">
														<span class="message-subject">
															<a class="page-link lia-link-navigation lia-custom-event" href= ${msg.@view_href} target="_blank"> 
																${msg.name}
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
														${msg.description}
													</div>
												</div>
											</div>
										</td>
										<td colspan="1" rowspan="1" class="messagePostDateColumn lia-data-cell-secondary lia-data-cell-date">
											<span class="DateTime">
												<span class="local-date">${msg.created_at?date("yyyy-MM-dd")?string("EEE, dd MMMM yyyy")}</span>
											</span>
										</td>
									</tr>
				</#list>
			</tbody>
		</table>

		<#assign req = http.client.request(fullURL).header("Authorization",token)/>
		<#assign response = req.post() />
		<response>
		<#if response.hasError>
		  <error>${response.error.message}</error>
		  <error>${response}</error>
		  <error>${response.error}</error>
		<#else>
		  <content>${response.content}</content>
		</#if>
		</response>
