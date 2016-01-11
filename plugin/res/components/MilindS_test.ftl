<#--Text on Image-->
<#assign TextTitle1="Live:" />
<#assign TextDescription1="Join the Conversation" />
<#assign TextTitle2="Resources:" />
<#assign TextDescription2="Introducing the Hiring Hub" /> 
<#assign TextTitle3="Read:" />
<#assign TextDescription3="A Freelancer's Guide to Upwork" />
<#assign TextTitle4="Share:" />
<#assign TextDescription4="Upwork on Social" />

<#-- Image URL-->
<#assign image1='${asset.get("/html/assets/purple.jpg")}' />
<#assign image2='' />
<#assign image3='${asset.get("/html/assets/red.jpg")}' />
<#assign image4='' />

<#-- Set these links for image redirection-->
<#assign href1="http://community.odesk.com/t5/Comms/Introducing-Upwork/m-p/77655#U77655" />
<#assign href2="https://www.upwork.com/hiring/" />
<#assign href3="https://d1u2uhea8ugy8e.cloudfront.net/upwork_freelancer_guide.pdf" />
<#assign href4="http://www.facebook.com/upwork" />

<#-- Video URL-->
<#assign video1="" />
<#assign video2="https://player.vimeo.com/video/32001208" />
<#assign video3="" />
<#assign video4="https://www.youtube.com/embed/0WWzgGyAH6Y" />


    <script type="text/javascript" src='${asset.get("/html/assets/jquery-1.11.3.js")}'></script>
    <script type="text/javascript" src='${asset.get("/html/assets/jssor.js")}'></script>
    <script type="text/javascript" src='${asset.get("/html/assets/jssor.slider.js")}'></script>
    <script type="text/javascript" src='${asset.get("/html/assets/jssor.player.ytiframe.js")}'></script>
    <script>
        jQuery(document).ready(function ($) {
            var options = {
				$AutoPlay: false, 
				$AutoPlayInterval: 4000,				
                $DragOrientation: 3,  
				$PauseOnHover: 1,
				$SlideDuration: 800,                                
                $MinDragOffsetToSlide: 20,                 
                $BulletNavigatorOptions: {
                    $Class: $JssorBulletNavigator$,                 
                    $ChanceToShow: 2                                
                },
                $ArrowNavigatorOptions: {
                    $Class: $JssorArrowNavigator$,              
                    $ChanceToShow: 2 ,                          
					$AutoCenter: 2,
					$Steps: 1  
                }
            };

            var jssor_slider1 = new $JssorSlider$("slider1_container", options);
            $JssorPlayer$.$FetchPlayers(document.body);
        });
    </script>
    
	<!-- Macros for image-->
<#macro display_image ImageSrc Link HeaderText DescriptionText>
 <!-- Slide -->
            <div class="slide_div" >
                <img src='${ImageSrc}' />
				<div class="slide_content_div">
					<span class="content_title">
						<#assign charLengthSub = 30 />
						<#assign msgsubject = HeaderText?trim?replace("</?[^>]+(>|$)", "", "r") />
						<#if ((msgsubject?length)  > charLengthSub)>
						<#assign lastspaceIndex= msgsubject?substring(0,charLengthSub-3)?last_index_of(" ") />
						<#if lastspaceIndex!=-1>
							${msgsubject?substring(0,lastspaceIndex)}...</br>
						<#else>
							${msgsubject?substring(0,charLengthSub-3)}...</br>
						</#if>
						<#else>
							${msgsubject}</br>
						</#if>
					</span>
					<br />
					<span class="content_summary">
						<#assign msgBody = DescriptionText?trim?replace("</?[^>]+(>|$)", "", "r") />
						<#assign charLengthBody = 50 />
						<#if ((msgBody?length) > charLengthBody)>
						<#assign lastspaceIndex= msgBody?substring(0,charLengthBody-3)?last_index_of(" ") />
						<#if lastspaceIndex!=-1>
							${msgBody?substring(0,lastspaceIndex)}...
						<#else>
							${msgBody?substring(0,charLengthBody-3)}...
						</#if>
						<#else>
							${msgBody}
						</#if>
					</span>
					<a href="${Link}" target="_blank">Join us</a>
				</div>
            </div>		
</#macro> 

<!-- Macros for video-->
<#macro display_video videoURL>
<!-- Slide -->
			<div>
                <div u="player" class="slide_video" style="position: relative; top: 0px; left: 0px; width: 1070px; height: 400px; overflow: hidden;">
                    <!-- iframe in ebay page is not allowed, youtube iframe video is not supported for ebay listing -->
                    <iframe pHandler="ytiframe" pHideControls="0" width="1700" height="400" style="z-index: 0;" url="${videoURL}?enablejsapi=1&version=3&playerapiid=ytplayer&fs=1&wmode=transparent" frameborder="0" scrolling="no"></iframe>
                    <!-- play cover begin (optional, can remove play cover) -->
                    <div u="cover" class="videoCover" style="position: absolute; top: 0px; left: 0px; background-color: #000; background-image: url(${asset.get("/html/assets/play.png")}); background-position: center center; background-repeat: no-repeat; filter: alpha(opacity=40); opacity: .4; cursor: pointer; display: none; z-index: 1;"></div>
                    <div u="close" class="closeButton" style="position: absolute; top: 0px; right: 1px;
                        width: 30px; height: 30px; background-color: #000; cursor: pointer; display: none; z-index: 2;">
                    </div>
                </div>
            </div>
</#macro>

    <div id="slider1_container" class='slider1'>
        <div id="bgback" u="loading">
            <div class='bg1' style=""></div>
            <div class='bg2' style=""></div>
        </div>

        <!-- Slides Container -->
        <div u="slides" title="Slides Container" class="slides">
           
        <#if image1!= "" && href1!="">
        <@display_image image1 href1 TextTitle1 TextDescription1/>
      <#elseif video1!= "">
        <@display_video video1/>
      <#else>
        call default
      </#if>
     <#if image2!= "" && href2!="">
        <@display_image image2 href2 TextTitle2 TextDescription2/>
      <#elseif video2!= "">
        <@display_video video2/>
      <#else>
        call default
      </#if>
       <#if image3!= "" && href3!="">
        <@display_image image3 href3 TextTitle3 TextDescription3/>
      <#elseif video3!= "">
        <@display_video video3/>
      <#else>
        call default
      </#if>
       <#if image4!= "" && href4!="">
        <@display_image image4 href4 TextTitle4 TextDescription4/>
      <#elseif video4!= "">
        <@display_video video4/>
      <#else>
        call default
      </#if>
           
            
        </div>
        <div u="navigator" class="jssorb21" style="bottom: 16px; right: 50%;left:50%">
            <div u="prototype"></div>
        </div>
		<span u="arrowleft" class="jssora19l" style=""></span>
        <span u="arrowright" class="jssora19r" style=""></span>
    </div>

	
		<style>
		.slider1{position: relative; width: 1070px !important; height: 400px !important; background-color: Gray;}
		#bgback{position: absolute; top: 0px; left: 0px;}
		.bg1{filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;background-color: #000000; top: 0px; left: 0px;width: 100%;height:100%;}
		.bg2{position: absolute; display: block; background: url(${asset.get("/html/assets/loading.gif")}) no-repeat center center;top: 0px; left: 0px;width: 100%;height:100%;}
		.slides{
			cursor: move; position: absolute;  width: 1070px;height: 400px; overflow: hidden;
		}
		.slide_div{
			position: absolute; overflow: hidden; background-color: Navy; line-height: 300px;
			font-size: 16px; font-weight: bold; line-height: 300px; text-align: center; color: White
		}
		.slide_content_div{
			position: absolute; width: 480px; height: 300px; top: 0px; left: 10px;text-align: left; line-height: 1.8em; font-size: 12px;
		}
		.content_title{
			display: block; line-height: 1em; text-transform: uppercase; font-size: 52px;color: #FFFFFF;
		}
		.content_summary{
			display: block; line-height: 1.1em; font-size: 2.5em; color: #FFFFFF;
		}
		.jssorb21 {
			position: absolute;
		}
		.jssorb21 div, .jssorb21 div:hover, .jssorb21 .av {
			position: absolute;
			width: 19px;
			height: 19px;
			text-align: center;
			line-height: 19px;
			color: white;
			font-size: 12px;
			background: url(${asset.get("/html/assets/b21.png")}) no-repeat;
			overflow: hidden;
			cursor: pointer;
		}
		.jssorb21 div { background-position: -5px -5px; }
		.jssorb21 div:hover, .jssorb21 .av:hover { background-position: -35px -5px; }
		.jssorb21 .av { background-position: -65px -5px; }
		.jssorb21 .dn, .jssorb21 .dn:hover { background-position: -95px -5px; }
		.jssora19l, .jssora19r {
			display: block;
			position: absolute;
			width: 50px;
			height: 50px;
			cursor: pointer;
			background: url(${asset.get("/html/assets/a19.png")}) no-repeat;
			overflow: hidden;
		}
        .jssora19l { background-position: -5px -35px; }
		.jssora19r { background-position: -65px -35px; }
		.jssora19l:hover { background-position: -125px -35px; }
		.jssora19r:hover { background-position: -185px -35px; }
		.jssora19l.jssora19ldn { background-position: -245px -35px; }
		.jssora19r.jssora19rdn { background-position: -305px -35px; }
		.jssora19l,.jssora19r{top:40%;}
		.jssora19l{left:8px;}
		.jssora19r{right:8px;}
		.closeButton { background-image: url(${asset.get("/html/assets/close.png")}); }
		.closeButton:hover { background-position: -30px 0px; }
		
	</style>
