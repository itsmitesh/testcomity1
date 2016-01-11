<div class="community-node-menu">
	<div class="community-node-menu-btn"></div>
	
	<#assign level1 = rest("/categories").categories />

	<div id='cssmenu'>
		<ul>
			<#list level1.category as cat>
				<#assign level2 = rest("${cat.@href}").category />
				
				<#assign subNodeCount = level2.categories.category?size + level2.boards.board?size + level2.blogs.blog?size />
				<#--
				${subNodeCount}<br/>
				category : ${level2.categories.category?size}
				board : ${level2.boards.board?size}
				blog : ${level2.blogs.blog?size}
				-->
				
				<li <#if subNodeCount gt 0>class='has-sub'</#if>><a href='#'><span>${cat.title}</span></a>
					<#if subNodeCount gt 0>
						<ul>
							<#list level2.categories.category as subcat>
								<li><a href='#'><span>${subcat.title}</span></a></li>
							</#list>
							<#list level2.boards.board as subboard>
								<li><a href='#'><span>${subboard.title}</span></a></li>
							</#list>
							<#-- <#list level2.blogs.blog as subblog>
								<li><a href='#'><span>${subblog.title}</span></a></li>
							</#list> -->
						</ul>
					</#if>
				</li>
			</#list>
			
			<#--
			<li class='active'><a href='index.html'><span>Home</span></a></li>
			<li class='has-sub'><a href='#'><span>Products</span></a>
				<ul>
					 <li><a href='#'><span>Widgets</span></a></li>
					 <li><a href='#'><span>Menus</span></a></li>
					 <li class='last'><a href='#'><span>Products</span></a></li>
				</ul>
			</li>
			<li class='has-sub'><a href='#'><span>Company</span></a>
				<ul>
					 <li><a href='#'><span>About</span></a></li>
					 <li class='last'><a href='#'><span>Location</span></a></li>
				</ul>
			</li>
			<li class='last'><a href='#'><span>Contact</span></a></li>
			-->
			
		</ul>
	</div>
</div>

<div>
<p>Lorem ipsum dolor sit amet, ac pede ultricies quis, fusce in parturient condimentum urna, vivamus et magnam luctus, tristique nunc sit rhoncus. Ipsum duis id adipiscing pellentesque, egestas vestibulum ut sed. Ullamcorper et ut proin, ligula pulvinar magna per pellentesque, ridiculus enim lectus ac. Massa amet ligula aliquam, per eu adipiscing condimentum commodo, ante dignissim fermentum faucibus pellentesque, nam dui vivamus lorem. Vestibulum dolor ante donec est, erat ut in ut, fermentum placerat mauris eu.</p>
<p>Non sociosqu nullam molestie phasellus, saepe diam ac elementum lacus. Nec orci egestas aliquam, urna a velit mauris quam. Pulvinar ut per sagittis, integer sed eget a. Scelerisque curabitur vel et est, consequat morbi imperdiet libero, sed mauris maecenas donec. Platea lorem quam vehicula ornare, sed arcu rutrum eu, euismod explicabo orci vestibulum, vitae posuere in urna.</p>
<p>Sapien varius pede in, accumsan pede enim turpis, eu ultrices maecenas in aliquet. Aliquam enim nunc sapien, dignissim enim montes et praesent. Volutpat lobortis vel ut vehicula, nulla habitasse non vivamus, nec dolor nam sociosqu. Lorem cursus a fermentum, eu neque amet malesuada iste. Ut ante augue fusce cras, condimentum erat tellus vel felis. Ut morbi urna vel, dolor eget nunc litora, felis iaculis ultricies posuere, neque risus ultrices a.</p>
<p>Mauris neque bibendum praesent suspendisse, venenatis et ac adipiscing dui, arcu leo id massa mauris. Praesent turpis pellentesque cras sodales, pretium pellentesque laoreet adipiscing cursus. Imperdiet non in nunc ac, gravida posuere elementum ultricies eu, praesent imperdiet arcu occaecat, vestibulum posuere vitae tempor mi. Sapien aliquam turpis odio lectus, lacinia nam aliquam nisl. Nunc facilisis montes faucibus tristique, per faucibus nec arcu nam. Rutrum vitae vulputate et tempor, class et vitae dolor, et egestas atque ipsum.</p>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#cssmenu li.active').children('ul').show();
	$('#cssmenu li.has-sub>a').on('click', function(){
		$(this).removeAttr('href');
		var element = $(this).parent('li');
		if (element.hasClass('active')) {
			element.removeClass('active');
			element.find('li').removeClass('active');
			element.find('ul').slideUp();
		}
		else {
			element.addClass('active');
			element.children('ul').slideDown();
			element.siblings('li').children('ul').slideUp();
			element.siblings('li').removeClass('active');
			element.siblings('li').find('li').removeClass('active');
			element.siblings('li').find('ul').slideUp();
		}
	});
	
	
	$('.community-node-menu-btn').on('click', function(){
		$(this).toggleClass('active');
		$('#cssmenu').toggleClass('cssmenu-open');
	});
})

</script>

<style>
@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,600,300);
@charset "UTF-8";

.community-node-menu {
	position: relative;
}
.community-node-menu-btn {
	display: block;
	width: 65px;
	height: 55px;
	background-color: #000;
	background: url(/html/assets/chat.png) no-repeat center #000;
	background-size: 30px;
}
.community-node-menu-btn.active {
	background: url(/html/assets/close.png) no-repeat center #e60000;
	background-size: 20px;
}



/* Base Styles */
#cssmenu,
#cssmenu ul,
#cssmenu li,
#cssmenu a {
  margin: 0;
  padding: 0;
  border: 0;
  list-style: none;
  font-weight: normal;
  text-decoration: none;
  line-height: 1;
  font-family: 'Open Sans', sans-serif;
  font-size: 14px;
  position: relative;
}
#cssmenu a {
  line-height: 1.3;
}
#cssmenu.cssmenu-open {
	display: block;
}
#cssmenu {
	display: none;
  width: 250px;
  background: #fff;
	position: absolute;
	top: 55px;
		
  /*-webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;
  padding: 3px;
  -moz-box-shadow: 0 0 5px rgba(0, 0, 0, 0.6);
  -webkit-box-shadow: 0 0 5px rgba(0, 0, 0, 0.6);
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.6);*/
}
#cssmenu > ul > li {
  /*margin: 0 0 2px 0;*/
	border-top: 2px solid #000;
}
#cssmenu > ul > li:last-child {
  margin: 0;
}
#cssmenu > ul > li > a {
  font-size: 15px;
  display: block;
  color: #fff;
  background: #565656;
  /*background: -moz-linear-gradient(#565656 0%, #323232 100%);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #565656), color-stop(100%, #323232));
  background: -webkit-linear-gradient(#565656 0%, #323232 100%);
  background: linear-gradient(#565656 0%, #323232 100%);
  border: 1px solid #000;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;*/
}
#cssmenu > ul > li > a > span {
  display: block;
	padding: 10px;
  /*border: 1px solid #666666;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;
  font-weight: bold;*/
}
#cssmenu > ul > li > a:hover {
  text-decoration: none;
}
#cssmenu > ul > li.active {
  border-bottom: none;
}
#cssmenu > ul > li.active > a {
  background: #fff;
  /*background: -moz-linear-gradient(#474747 0%, #333333 100%);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #474747), color-stop(100%, #333333));
  background: -webkit-linear-gradient(#474747 0%, #333333 100%);
  background: linear-gradient(#474747 0%, #333333 100%);*/
  color: #333;
  /*border: 1px solid #333333;*/
}
#cssmenu > ul > li.active > a span {
  /*border: 1px solid #ffffff;*/
}
#cssmenu > ul > li.has-sub > a span {
	background: url(/html/assets/chevron-down.png) 96% center no-repeat ;
	background-size: 15px;
}
#cssmenu > ul > li.has-sub.active > a span {
  background: url(/html/assets/chevron-up.png) 96% center no-repeat;
	background-size: 15px;
}


/* Sub menu */
#cssmenu ul ul {
  /*padding: 5px 12px;*/
  display: none;
}
#cssmenu ul ul li {
  /*padding: 3px 0;*/
}
#cssmenu ul ul a {
	display: block;
	color: #ccc;
	font-size: 15px;
	padding: 10px;
	background: #565656;
}
#cssmenu ul ul a:hover {
  color: #ccc;
}
#cssmenu > ul > li > a {
  cursor: pointer;
}
</style>

<ul>
		<li><@component id="users.action.login" /></li>
		<li><@component id="users.action.registration" /></li>
		<li><@component id="common.widget.user-avatar" user="conv:${user.id}" /><@component id="users.action.view-user-profile" /></li>
		<li><@component id="users.action.my-profile-settings" /></li>
		<li><a href="/t5/user/myprofilepage/tab/user-subscriptions:bookmark-subscriptions">Subscriptions</a></li>
		<li><a href="/t5/user/myprofilepage/tab/user-subscriptions:email-subscriptions">Bookmarks</a></li>
		<li><@component id="notificationfeed.widget.indicator" /></li>
		<li><@component id="notes.widget.summary-modern" /></li>
		<li><@component id="help.action.faq" /></li>
		<li><@component id="users.action.logout" /></li>
	</ul>
