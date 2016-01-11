<#assign featured_article_category_data = restadmin("/blogs/id/VH_Blog/category/id") />

<#assign featured_article = restadmin("/boards/id/VH_Blog/threads/featured?page_size=2").threads />
<div class="success_stories">
	<#list featured_article.thread as featured_blog >
	<div>
               
		<a href="${featured_blog.@view_href}" class="user_success_stories">
		<div class="teaser_data">
			<#assign str = featured_blog.messages.topic.teaser>
			<#assign start = str?lower_case?index_of("<img")/>
			<#if (start != -1)>
				<#assign len = str?length-1 /> 
				<#assign subStringforImageTag = str?substring(start,len) /> 
				<#assign endOfImageTag = subStringforImageTag?index_of(">")/> 
				<#assign imgSrc = subStringforImageTag?substring(0,endOfImageTag+1) /> 
				${imgSrc}
                                <div class="blog_cat">${featured_article_category_data.value}</div> 
				
			</#if>
		</div>
		<div class="success_story_details">
			<div class="title_subject_description">
				<div class="title_text">
					<#assign featured_blog_title = featured_blog.messages.topic.subject />
					<#if (featured_blog_title?length > 60)>
							<#assign featured_blog_title = featured_blog_title?substring(0,56) + "..." />
					</#if>
					<p class="title_text_data">${featured_blog_title}</p>
				</div>
				<div class="title_description">
					<#assign msgId = featured_blog.id />
					<#assign featured_blog_body = restadmin("messages/id/${msgId}/body").value />
					<#assign featured_blog_body = featured_blog_body?replace("</?[^>]*(>|$)|&(nbsp;?|#?[0-9A-Za-z]*$)", " ", "r")?replace("\\s+", " ", "r") />
					<#if (featured_blog_body?length > 125)>
							<#assign featured_blog_body = featured_blog_body?substring(0,117) + "..." />
					</#if>
					<p class="title_text_body">${featured_blog_body}</p>
				</div>
			</div>
			<div class="blog_details">
				<#assign msgId = featured_blog.id />
				<#assign commentCount = restadmin("messages/id/${msgId}/comments/count").value />
				<#assign msg_post_date = featured_blog.messages.topic.post_time />
				<#assign userID = restadmin("/users/login/${featured_blog.messages.topic.author.login}/id").value />
				 <#assign expert_profiles = restadmin("/users/id/${userID}/profiles").profiles />
                 <#assign author_fname = "" />
                 <#assign author_lname = "" />
                 <#list expert_profiles.profile as x>
                      <#if x.@name == "name_first">
                        <#assign author_fname = x />
                      </#if>
                      <#if x.@name == "name_last">
                        <#assign author_lname = x />
                      </#if>
                  </#list>
				<div class="left_div_detail">
					<div class="author_details"><span class="author">BY ${author_fname} ${author_lname}</span></div>
					<div class="time_details"><img class="blog_detail-image-styling" src="${asset.get("/html/assets/icon_article_day.png")}"/><span class="creation_time">${msg_post_date?date("yyyy-MM-dd")?string("EEEE")}</span></div>
				</div>
				<div class="right_div_detail">
					<div class="comment_details"><img class="blog_detail-image-styling" src="${asset.get("/html/assets/icon_article_comments.png")}"/><span class="comment_count">${commentCount} COMMENTS</span></div>
					<div class="kudos_details"><img class="blog_detail-image-styling" src="${asset.get("/html/assets/icon_article_kudos.png")}"/><span class="kudo_count">${featured_blog.messages.topic.kudos.count} KUDOS</span></div>
				</div>
			</div>
		</div>
		</a>
	</div>
	</#list>
</div>


<style>
.success_stories > div {
	width: 33%;
	display: inline-block;
	padding: 20px;
	vertical-align: top;
}
p.title_text_data {
  font-size: 18px;
  margin: 0 !important;
  color: #006899;
  line-height: 22px;
}
.left_div_detail{
  float:left;
}

.right_div_detail{
  float:right;
}


#lia-body .lia-content .lia-quilt-column-main-content .lia-component-psiViewpoint .success_stories .blog_details .blog_detail-image-styling{
	  padding: 0 5px 1px 0;
}

#lia-body .lia-content .lia-quilt-column-main-content .lia-component-psiViewpoint .success_stories .left_div_detail .author_details,
#lia-body .lia-content .lia-quilt-column-main-content .lia-component-psiViewpoint .success_stories .right_div_detail .comment_details {
  padding: 12px 0 0 0;
  height: auto;
  line-height: 16px;
  font-size:13px;
  
}
#lia-body .lia-content .lia-quilt-column-main-content .lia-component-psiViewpoint .success_stories .left_div_detail .time_details,
#lia-body .lia-content .lia-quilt-column-main-content .lia-component-psiViewpoint .success_stories .right_div_detail .kudos_details {
  padding: 8px 0;
  height: auto;
  line-height: 16px;
  font-size:13px;
 
}
p.title_text_body {
  font-size: 14px;
  line-height: 20px;
  color: #3d3d3d;
  margin-bottom: 18px !important;
}
.success_stories .teaser_data {
	height: 184px;
	width: 184px;
	vertical-align: middle;
	display: table-cell;
        text-align: center;
        position:relative;
}
.title_subject_description{
	border-bottom: 1px solid #cdcdcd;
	padding: 0 22px 0 24px;
    height:auto;
}

.blog_details{
  padding: 0 22px 0 24px;
  background-color: #efefef;
  font-size: 10px;
  width: 100%;
  height: auto;
}
.success_stories .teaser_data img  {
	max-height: 251px;
	max-width: 335px;
}

.teaser_data > img {
  width: 100%;
}

.success_stories  > a {
    display: block;
    float: right;
}
.success_stories .user_success_stories{
 display:block;
 margin:0;
 padding:0;
}
.blog_cat{
   background: #fcf8e3 none repeat scroll 0 0;
    border-radius: 6px;
    color: #a46d55;
    font-weight: 700;
    left: 10px;
    padding: 5px;
    position: absolute;
    top: 10px;
    width: auto;
}
</style>