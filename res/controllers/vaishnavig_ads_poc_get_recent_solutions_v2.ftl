<#function get_date_for_days_ago days>
	<#assign currentDate = .now>
	<#assign numberOfDays = days?number?long>
	<#assign timeInMillisecond = (1000 * 60 * 60 * 24 * numberOfDays) >
	<#assign aDate = currentDate?long - timeInMillisecond?long>
	<#assign Diff = aDate?long>
	<#assign thirtyDaysBeforeDate = Diff?number_to_date>
	<#assign utc_date = thirtyDaysBeforeDate?iso_utc>
	<#return utc_date >
</#function>
<#function get_date_for_days_future days>
	<#assign currentDate = .now>
	<#assign numberOfDays = days?number?long>
	<#assign timeInMillisecond = (1000 * 60 * 60 * 24 * numberOfDays) >
	<#assign aDate = currentDate?long + timeInMillisecond?long>
	<#assign Diff = aDate?long>
	<#assign thirtyDaysBeforeDate = Diff?number_to_date>
	<#assign utc_date = thirtyDaysBeforeDate?iso_utc>
	<#return utc_date >
</#function>
<#assign max_solutions = http.request.parameters.name.get("max_solutions","10") />
<#if max_solutions?number gt 10>
	<#assign max_solutions = "10" />
</#if>
<#assign duration1_no_of_days = http.request.parameters.name.get("duration1_no_of_days","30") />
<#assign duration2_no_of_days = http.request.parameters.name.get("duration2_no_of_days","365") />
<#-- expected values node_type are 'categories', 'boards', 'community' -->
<#assign node_type = http.request.parameters.name.get("node_type",'community') />
<#assign node_id = http.request.parameters.name.get("node_id","") />
<#if node_type=="">
	<#assign node_type = "community" />
</#if>
<#-- validate node type -->
<#if node_type!="community" && node_type!="categories" && node_type!="boards">
	<#assign json_str = '{success:false,code:701,message:"Invalid parameter node_type. Allowed keywords are ‘boards’, ‘categories’, ’community’"}' />
	${json_str}
<#else>
	<#-- get solutions from 30 days ago -->
	<#assign start_date_param = get_date_for_days_ago(duration1_no_of_days) />	
	<#assign time_filter_used = duration1_no_of_days />	
	<#assign tomorrow = get_date_for_days_future(1) />
	<#assign end_date_param = tomorrow />
	<#if node_id!="" && node_type!="community">
			<#assign granularity = node_type />
			<#assign solution_recent  = restadmin("${node_type}/id/${node_id}/solutions/recent?restapi.response_style=view&page_size=${max_solutions}&date_start=${start_date_param}&date_end=${end_date_param}").threads/>
			<#if solution_recent.thread?size == 0 >
				<#-- get solutions from 365 days ago -->
				<#assign start_date_param = get_date_for_days_ago(duration2_no_of_days) />
				<#assign time_filter_used = duration2_no_of_days />
				<#assign solution_recent  = restadmin("${node_type}/id/${node_id}/solutions/recent?restapi.response_style=view&page_size=${max_solutions}&date_start=${start_date_param}&date_end=${end_date_param}").threads/>
				<#if solution_recent.thread?size == 0 >
					<#-- get solutions from no time filter -->
					<#assign time_filter_used = "none" />
					<#assign solution_recent  = restadmin("${node_type}/id/${node_id}/solutions/recent?restapi.response_style=view&page_size=${max_solutions}").threads/>
				</#if>
			</#if>
	<#else>		
			<#assign granularity = "community" />
			<#assign solution_recent =restadmin("/solutions/recent?restapi.response_style=view&page_size=${max_solutions}&date_start=${start_date_param}&date_end=${end_date_param}").threads/>
			<#if solution_recent.thread?size == 0 >
				<#-- get solutions from 365 days ago -->
				<#assign start_date_param = get_date_for_days_ago(duration2_no_of_days) />
				<#assign time_filter_used = duration2_no_of_days />
				<#assign solution_recent  = restadmin("/solutions/recent?restapi.response_style=view&page_size=${max_solutions}&date_start=${start_date_param}&date_end=${end_date_param}").threads/>
				<#if solution_recent.thread?size == 0 >
					<#-- get solutions no time filter -->
					<#assign time_filter_used = "none" />
					<#assign solution_recent  = restadmin("/solutions/recent?restapi.response_style=view&page_size=${max_solutions}").threads/>
				</#if>
			</#if>
	</#if>
	<#assign solution_details =[] />
	<#assign thread_ids ="" />
	<#list solution_recent.thread as each_topic>
		<#-- collect thread IDS -->
		<#if each_topic_index == 0>
			<#assign thread_ids = "'"+each_topic.messages.topic.id+"'" />
		<#else>
			<#assign thread_ids = thread_ids +",'"+each_topic.messages.topic.id+"'" />
		</#if>
	</#list>	
	<#-- ${thread_ids} -->
	<#assign views_hash =[] />
	<#assign x= restadmin("2.0","/search?q=" + "SELECT subject, conversation.id, metrics.views FROM messages WHERE topic.id in(${thread_ids})"?url) />
	<#--
	<#list x.data.items as message > 
	<p>${message.subject} >> ${message.conversation.id} :: ${message.metrics.views}</p>
	</#list>
	-->
	<#list solution_recent.thread as each_topic>
		<#assign Thread_views = 0?number />
		<#list x.data.items as message > 
			<#if message.conversation.id == each_topic.messages.topic.id>
				<#-- ${each_topic.messages.topic.id} -->
				<#assign Thread_views = Thread_views + message.metrics.views?number />
			</#if>
		</#list>
		<#assign Thread_title = each_topic.messages.topic.subject />
		<#assign Thread_author = each_topic.messages.topic.author.login />
		<#assign Thread_creation_date = each_topic.messages.topic.post_time.@view_date />
		<#assign Thread_URL = each_topic.@view_href />
		<#assign Solution_author = each_topic.solutions.solution[0].author.login />
		<#assign Author_rank =restadmin("users/login/${each_topic.solutions.solution[0].author.login}/ranking").ranking.name/>
		<#assign Solution_author_rank = Author_rank />
		<#assign Solution_URL = each_topic.solutions.solution[0].@view_href />
		<#assign solution_details = solution_details + [{"thread_title":Thread_title,"thread_author":Thread_author,"thread_creation_date":Thread_creation_date,"thread_views":Thread_views,"thread_url":Thread_URL,"solution_author":Solution_author,"solution_author_rank":Solution_author_rank,"solution_url":Solution_URL}] />
	</#list>
	<#assign solution_details= solution_details?sort_by("thread_views")?reverse> 
	<#assign json_str = "{success:true," />
	<#assign json_str = json_str + '{"solution_details":[' /> 
	<#list solution_details as solutions_details_loop>
		<#if solutions_details_loop_index gt 0>
			<#assign json_str = json_str + ',' />
		</#if>
		<#assign json_str = json_str +	'{"thread_title":"${solutions_details_loop.thread_title}","thread_author":"${solutions_details_loop.thread_author}","thread_creation_date":"${solutions_details_loop.thread_creation_date}","thread_views":"${solutions_details_loop.thread_views}","thread_url":"${solutions_details_loop.thread_url}","solution_author":"${solutions_details_loop.solution_author}","solution_author_rank":"${solutions_details_loop.solution_author_rank}","solution_url":"${solutions_details_loop.solution_url}"}'  />
	</#list>
	<#assign json_str = json_str + ']}' /> 
	<#-- add "filter used" and "count" -->
	<#assign json_str = json_str + ',"time_filter_used":"${time_filter_used}","count":"${solution_recent.thread?size}"' />
	<#assign json_str = json_str + ',"granularity":"${granularity}"' />
	<#assign json_str = json_str + "}" />
	${json_str}
</#if>
