<div class="hero_wrapper">
	<#if page.name=="CommunityPage" >
		<div class="hero_community_head">
			<div class="inner_content">
				<@component id="custom_content_9"/>	
			</div>
		</div>
	<#else>
		<div class="hero_other_page_head">
			<div class="hero_other_page_bc" style="">
				<@component id="common.widget.page-title"/>
				<@component id="common.widget.breadcrumb"/>
			</div>
		</div>
	</#if>
	
	<#if coreNode.nodeType == "community">
		<#assign is_set_annoucement = rest("settings/name/layout.announcements") />
		
	<#elseif coreNode.nodeType == "board">
		<#assign is_set_annoucement = rest("boards/id/${coreNode.id}/settings/name/layout.announcements") />
		
	<#elseif coreNode.nodeType == "category">
		<#assign is_set_annoucement = rest("categories/id/${coreNode.id}/settings/name/layout.announcements") />
		
	</#if>
	<#if is_set_annoucement?? && is_set_annoucement.value?? && is_set_annoucement.value?trim?length!=0 >
		<div class="hero_annouvement">
			<@component id="common.widget.announcement"/>
		</div>
	</#if>
</div>
<style>
	.hero_wrapper{ 
		width:100%
		height:auto;
	}
	.hero_community_head{
		height:330px;
		width:1100px;
		background:#919190;
		border: 1px solid #8A8A8A;
		display:block;
	}
	.inner_content{
		background: #EEE;
		height: auto;
		margin-left: 50px;
		margin-top: 50px;
		padding: 16px;
		position: absolute;
		width: 44%;
		opacity:0.63;
		border:1px solid #767676;
	}
	.hero_other_page_head{
		 background: #999 none repeat scroll 0 0;
		border: 1px solid #8A8A8A;
		height: 110px;
		width: 1100px;
	}
	.hero_other_page_bc{
		background: #999 none repeat scroll 0 0;
		color: #fff;
		margin-left: 53px;
		 margin-top: 24px;
		position: absolute;
	}
	#lia-body .lia-content .hero_other_page_bc .PageTitle span,#lia-body .lia-content .hero_other_page_bc .PageTitle a  {
		color: #fff !important;
	} 
	#lia-body .lia-content .hero_other_page_bc li.lia-breadcrumb-seperator.lia-breadcrumb-forum::before {
		content: '\003E';
		font-weight:600;
	}
	.hero_other_page_bc .lia-breadcrumb-node.crumb a {
		color: #fff !important;
		font-size: 14px;
		text-decoration: none !important;
	}
	#lia-body .lia-content .hero_other_page_bc li.lia-breadcrumb-seperator .separator {
	 display:none;
	}
	#lia-body .lia-content .hero_annouvement{
		min-height:70px;
		width:1100px;
		background:#D7D7D7;
		
		border: 1px solid #8A8A8A;
	}
</style>