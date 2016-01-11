<nav id="vfde-nav">
	<ul class="vfde-nav-primary">
	
		<#assign topLevelCategories = rest("categories").categories />
		
		<#assign categoryWidth = 100/(topLevelCategories.category?size) >
		
		<#if topLevelCategories?has_content>
			<#list topLevelCategories.category as category>
			
				<#assign catNodeList = rest("categories/id/${category.id}").category />
				
				<#assign boardNodeList = rest("categories/id/${category.id}").category />
				
				<#assign totalNodeCount = catNodeList.categories.category?size + boardNodeList.boards.board?size >
			
				<#-- <#assign boardList = rest("categories/id/${category.id}/boards/nested").boards > -->
			
				<li class="<#if totalNodeCount gt 0>has-sub-menu</#if>"><a href="${category.@view_href}"><i class="vfde-nav-${category.title?trim?replace(" ","-")}"></i>${category.title}</a>
					<div class="vfde-nav-secondary">
						<div id="vfde-community-nav-category-entries" class="vfde-nav-secondary-left">
							
							<#if totalNodeCount lte 6>
								<ul>
									<#if catNodeList.categories.category?size gt 0>
										<#list catNodeList.categories.category as cat>
											<li><a href="${cat.@view_href}">${cat.title}</a></li>
										</#list>
									</#if>
									<#if boardNodeList.boards.board?size gt 0>
										<#list boardNodeList.boards.board as brd>
											<li><a href="${brd.@view_href}">${brd.title}</a></li>
										</#list>
									</#if>
								</ul>
							<#else>
								
								<#assign nodeCounter = 0 />
								<#assign openElement = "true" />
								
								<#if catNodeList.categories.category?size gt 0>
									<#list catNodeList.categories.category as cat>
										<#if (nodeCounter%6 == 0) && (openElement == "true")><ul><#assign openElement = "false" /></#if>
											<li><a href="${cat.@view_href}">${cat.title}</a></li>
											<#assign nodeCounter = nodeCounter + 1 >
										<#if (nodeCounter%6 == 0) && (openElement == "false")></ul><#assign openElement = "true" /></#if>
									</#list>
								</#if>
								<#if boardNodeList.boards.board?size gt 0>
									<#list boardNodeList.boards.board as brd>
										<#if (nodeCounter%6 == 0) && (openElement == "true")><ul><#assign openElement = "false" /></#if>
											<li><a href="${brd.@view_href}">${brd.title}</a></li>
											<#assign nodeCounter = nodeCounter + 1 >
										<#if (nodeCounter%6 == 0) || !brd_has_next && (openElement == "false")></ul><#assign openElement = "true" /></#if>
									</#list>
								</#if>
								
							</#if>
							
						</div>
						<div id="vfde-community-nav-category-article-tile" class="vfde-nav-secondary-right">
							<div class="vfde-community-nav-category-article-content">
								<img class="vfde-community-nav-category-article-img" src="https://placeholdit.imgix.net/~text?txtsize=20&txt=150%C3%97100&w=150&h=100">
								<div class="vfde-community-nav-category-article-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>
							</div>
							<div class="vfde-community-nav-category-article-content">
								<img class="vfde-community-nav-category-article-img" src="https://placeholdit.imgix.net/~text?txtsize=20&txt=150%C3%97100&w=150&h=100">
								<div class="vfde-community-nav-category-article-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>
							</div>
						</div>
					</div>
				</li>
			</#list>
		</#if>

    </ul>
</nav>

<@liaAddScript>
	;(function($) { 
		$(document).ready(function(){ 
			$(".vfde-nav-primary li.has-sub-menu").mouseover(function(){
				$(this).addClass("vfde-nav-active");
				$(this).find(".vfde-nav-secondary").show();
			});
			
			$(".vfde-nav-primary li.has-sub-menu").mouseleave(function(){
				$(this).removeClass("vfde-nav-active");
				$(this).find(".vfde-nav-secondary").hide();
			});
			
			$(".vfde-nav-secondary").mouseleave(function(){
				$(this).hide();
			});
		});
	})(LITHIUM.jQuery); 
</@liaAddScript>

<style>
#lia-body .lia-content #vfde-nav > ul > li {
	width: ${categoryWidth}%;
}

#lia-body .lia-content #vfde-nav .vfde-community-nav-category-article-img {
	display: inline-block;
}
#lia-body .lia-content #vfde-nav .vfde-community-nav-category-article-text {
	display: inline-block;
	vertical-align: top;
	padding: 0 10px 10px;
	width: 55%;
}

#lia-body .lia-content #vfde-nav {
    width:100%; 
    display:block;
    background-color:#2096ba;
    margin: 20px 0;
}

#lia-body .lia-content #vfde-nav ul {
    padding:0;
    margin:0;
    list-style: none;
    position: relative;
}

#lia-body .lia-content #vfde-nav ul:after {
	content: "";
	display:block;
	clear:both;
}	



#lia-body .lia-content #vfde-nav ul li {
    display:list-item;
    list-style: none;
	float:left;
    background-color:#2096ba;
}
  
#lia-body .lia-content #vfde-nav ul li i {
	display: block;
	width: 100%;
	height: 55px;
} 
  
#lia-body .lia-content #vfde-nav ul li a {
    display:block;
    padding:15px;
    font-size: 18px;	
    color: #FFF;
    text-decoration: none;
    text-align: center;
    outline: none;
}
  
#lia-body .lia-content #vfde-nav > ul li a:hover {
	background-color: #1a7e9c; 
}
	
#lia-body .lia-content #vfde-nav > ul > li.has-sub-menu > a:hover {	
	background: url("${asset.get("/html/assets/vfde-community-nav-arrow-icon.png")}") no-repeat 50% 152% #1a7e9c;
}

#lia-body .lia-content #vfde-nav .has-sub-menu.vfde-nav-active { 
	position: static;
	background: url("${asset.get("/html/assets/vfde-community-nav-arrow-icon.png")}") no-repeat 50% 152% #1a7e9c;
	z-index: 1000;
}

.vfde-nav-secondary {
	display: none;
        position: absolute;
	top: 110px;
	width: 100%;
	left: 0;
	background: #a2d2e1;
        z-index: 1000;
}

/* The Dropdown Styles */
/* Hide Dropdowns by Default */
#lia-body .lia-content #vfde-nav ul ul {
    display: none;
    position: absolute;
	top: 110px;
	width: 100%;
	left: 0;
	background: #a2d2e1;
}

/* Display Dropdowns on Hover */
#lia-body .lia-content #vfde-nav ul li:hover > ul {
    /*display:list-item;*/
}

/* Fisrt Tier Dropdown */
#lia-body .lia-content #vfde-nav ul ul li {
    width:200px;
    float:none;
    position: relative;
    border-bottom:none;
	background: #a2d2e1;
}

#lia-body .lia-content #vfde-nav ul ul li i {
	margin-right:10px;
}

#lia-body .lia-content #vfde-nav ul ul li a {
    padding:15px 20px;
	text-align:left;  
}
  
#lia-body .lia-content #vfde-nav li > a:only-child:after { content: ''; }  

#lia-body .lia-content #vfde-nav .vfde-nav-Community {
	background: transparent url("${asset.get("/html/assets/vfde-community-nav-Community-icon.png")}") no-repeat scroll 50% 50%;
        margin-bottom: 5px;
}
#lia-body .lia-content #vfde-nav .vfde-nav-Vertrag {
	background: transparent url("${asset.get("/html/assets/vfde-community-nav-Vertrag-icon.png")}") no-repeat scroll 50% 50%;
        margin-bottom: 5px;
}
#lia-body .lia-content #vfde-nav .vfde-nav-Endgeräte {
	background: transparent url("${asset.get("/html/assets/vfde-community-nav-Endgeräte-icon.png")}") no-repeat scroll 50% 50%;
        margin-bottom: 5px;
}
#lia-body .lia-content #vfde-nav .vfde-nav-Services {
	background: transparent url("${asset.get("/html/assets/vfde-community-nav-Services-icon.png")}") no-repeat scroll 50% 50%;
        margin-bottom: 5px;
}
#lia-body .lia-content #vfde-nav .vfde-nav-Private-Gruppen {
	background: transparent url("${asset.get("/html/assets/vfde-community-nav-Private-Gruppen-icon.png")}") no-repeat scroll 50% 50%;	
        margin-bottom: 5px;
}

#lia-body .lia-content #vfde-nav .vfde-nav-secondary-left > span {
	display: block;
        padding: 0 10px 10px;
}
#lia-body .lia-content #vfde-nav .vfde-nav-secondary-left {
	float: left;
	width: 54%;
	padding: 1%;
}
#lia-body .lia-content #vfde-nav .vfde-nav-secondary-right {
	width: 42%;
	padding: 1%;
	display: inline-block;
}
#lia-body .lia-content #vfde-nav ul li #vfde-community-nav-category-entries a {
    padding: 5px 10px;
    text-align: left;
    color: #333;
    font-size: 14px;
}

#lia-body .lia-content #vfde-nav ul li #vfde-community-nav-category-entries a:hover {
    background-color: #2096BA;
    color: #fff;
}

#lia-body .lia-content #vfde-nav ul li #vfde-community-nav-category-entries ul {
    width: 48%;
    display: inline-block;
    vertical-align: top;
    position: relative;
    top: 0;
}
</style>