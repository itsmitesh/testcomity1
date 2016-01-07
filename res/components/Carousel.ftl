<#--Text on Image-->
<#assign TextTitle1="Live:" />
<#assign TextDescription1="Join the Conversation" />
<#assign TextTitle2="Resources:" />
<#assign TextDescription2="Introducing the Hiring Hub" /> 
<#assign TextTitle3="Read:" />
<#assign TextDescription3="A Freelancer's Guide to Upwork" />
<#assign TextTitle4="Share:" />
<#assign TextDescription4="Upwork on Social" />

<#-- CSS configuration -->
<#assign TextTitleFontFamily = "GothamBook" />
<#assign TextDescriptionFontFamily = "GothamBook" />
<#assign TextTitleFontSize = "18px" />
<#assign TextDescriptionFontSize = "28px" />
<#assign TextBackgroundOpacity = "0.70" />
<#assign TestBackgroundColor = "#FFFFFF" />

<#-- Image URL-->
<#assign image1="https://www.elance.com/q/sites/default/files/Help_Center/Community/FBPromo.jpg" />
<#assign image2="" />
<#assign image3="https://www.elance.com/q/sites/default/files/Help_Center/Community/freelancerguideudpated.jpg" />
<#assign image4="https://www.elance.com/q/sites/default/files/Help_Center/Community/socialicons.jpg" />

<#-- Set these links for image redirection-->
<#assign href1="http://community.odesk.com/t5/Comms/Introducing-Upwork/m-p/77655#U77655" />
<#assign href2="https://www.upwork.com/hiring/" />
<#assign href3="https://d1u2uhea8ugy8e.cloudfront.net/upwork_freelancer_guide.pdf" />
<#assign href4="http://www.facebook.com/upwork" />

<#-- Video URL-->
<#assign video1="" />
<#assign video2="http://www.youtube.com/embed/IkxEOR9kVAE" />
<#assign video3="" />
<#assign video4="http://player.vimeo.com/video/32001208" />



<script src="/html/assets/jssor.slider.min.js"></script>
<script src="/html/assets/jssor.player.ytiframe.min.js"></script>

<@liaAddScript>
  jQuery(document).ready(function ($) {
    globalPlay=0;
    globalPlay2=0;
    $('iframe').each(function(){
        var url = $(this).attr("src");
        if(this.src.indexOf("youtube") !=- 1) {
          $(this).attr("src",url+"?rel=0&wmode=transparent");
      }
      });
    
    var _SlideshowTransitions = [
    { $Duration: 1200, $Opacity: 2 }
    ];
  
    var options = {
      $AutoPlay: true,                                
      $AutoPlaySteps: 1,                                
      $AutoPlayInterval: 3000,                           
      $PauseOnHover: 1,                    
      $ArrowKeyNavigation: true, 
      $SlideDuration: 100,       
      $MinDragOffsetToSlide: 20,   
      $SlideSpacing: 0,         
      $DisplayPieces: 1,            
      $ParkingPosition: 0,             
      $UISearchMode: 1,                  
      $PlayOrientation: 1, 
      $DragOrientation: 0, 
      $SlideshowOptions: {          
        $Class: $JssorSlideshowRunner$,
        $Transitions: _SlideshowTransitions, 
        $TransitionsOrder: 1,                
        $ShowLink: true 
      },
      $ArrowNavigatorOptions: {
        $Class: $JssorArrowNavigator$,
        $ChanceToShow: 2,             
        $Steps: 1
      }
    };
    var jssor_slider1 = new $JssorSlider$("slider1_container", options);
    var clickDivToggleShow = $.parseJSON('{"width": "100%","height": "100%"}');
    var clickDivToggleHide = $.parseJSON('{"width": "0px","height": "0px"}');
     /**Play-Pause toggle and adjust z-index*/
     $(".clickCheck").on('mouseenter',function(){       
        jssor_slider1.$Pause();
        console.log("mouseenter clickCheck: clickDivToggleHide");
        setTimeout(function(){
          globalPlay2=1;
          $(".clickCheck").css(clickDivToggleHide);
          console.log("in timeout");
        },1200);
     });
     $(".clickCheck").on('mouseover',function(){       
        jssor_slider1.$Pause();
        console.log("mouseover clickCheck: clickDivToggleHide");
        setTimeout(function(){
          globalPlay2=1;
          $(".clickCheck").css(clickDivToggleHide);
          console.log("in timeout");
        },1200);
     });
     $(".slides-container").on('mouseleave',function(){
        console.log("mouseleave slides-container: clickDivToggleShow");
        $(".clickCheck").css(clickDivToggleShow);
        if(globalPlay===0) {
          setTimeout(function(){
            jssor_slider1.$Play();
          },1500);          
        }
        globalPlay2=0;
     });
     $(window).on('changeState',function(){ 
      console.log("on changeState");      
      if(globalPlay===1 && globalPlay2 ===1){
        console.log("click on iframe");
        console.log("globalPlay: "+globalPlay+" "+globalPlay2);
        jssor_slider1.$Pause();                   
      }
     });
     window.onblur = function(){
              globalPlay=1; 
              console.log("window blur");               
              $(window).trigger("changeState");
            };

     $(".changeSlide").on('click',function(){
      jssor_slider1.$Play();
      console.log("changeSlide: clickDivToggleShow");
      $(".clickCheck").css(clickDivToggleShow);
      globalPlay=0;
    });
  });
</@liaAddScript>

<!-- Macros for video-->
<#macro display_video videoURL>
    <div class="player" style="height: 470px; width:710px;">
    
      <!--transparent div to play-pause videos -->
      <div class="clickCheck" style="position:absolute;opacity:0.3;-ms-filter:'alpha(opacity=30)';z-index:999;background:transparent;height: 470px; width:710px;"></div>
      <iframe height="470" width="710" src="${videoURL}" frameborder="0" allowfullscreen></iframe>

    </div>
</#macro>

<!-- Macros for image-->
<#macro display_image ImageSrc Link HeaderText DescriptionText>
  <div class="image-container-carousel" style="height: 470px; width:710px;">
    
      <img src="${ImageSrc}"/>
  <div>  
	  <div u="caption" t="0" class="Text-Background-Opacity" style="position: absolute; top: 76%;width: 100%;height: 24%;" >
		<div class="Image-header" style="padding-bottom: 18px;padding-top: 16px;padding-left: 26px;">
		  <span class="Image-header-text">
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
		</div>
		<div class="Image-description" style="padding-left: 26px;">
		  <span class="Image-description-text">
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
		  <span>
		</div>
	  </div>
	  <a u=image href="${Link}" target="_blank">View</a>  
	  <div class="welcome-text-subtitle">New here?
		</div>
		<#if user.anonymous>
		<div class="registration_button"><@component id="common.widget.user-navigation-modern"/>
		</div>
		<div class="Video_Introducation_modal"><@component id="Video_Intro_modal"/>
		</div>
	  </div>
  </div>
  <div>
   </div>
 
</#macro> 
<div id="carousel_container">
  <!-- Jssor Slider Begin -->
  <div id="slider1_container" style="position: relative; top: 0px; left: 0px; height: 470px; width:710px; overflow: hidden; ">
    <!-- Slides Container -->
    <div u="slides" class="slides-container" style=" position: absolute; left: 0px; top: 0px; width: 710px; height: 470px; overflow: hidden;">
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
      <!-- Arrow Left -->
    <span u="arrowleft" class="jssora12l changeSlide" style="width: 41px; height: 46px; top: 43%; left: 20px;">
    </span>
    <!-- Arrow Right -->
    <span u="arrowright" class="jssora12r changeSlide" style="width: 41px; height: 46px; top: 43%; right: 20px">
    </span> 
  </div>
</div>

<style>
  .Image-header-text{
    color:#494949;
    font-family: ${TextTitleFontFamily};
    font-size: ${TextTitleFontSize};
    font-weight: lighter;
  }
  
  .Image-description-text{
    color:#494949;
    font-family: ${TextDescriptionFontFamily};
    font-size: ${TextDescriptionFontSize};
    font-weight: normal;
  }
  
  .Text-Background-Opacity{
    background-color: ${TestBackgroundColor};
    opacity: ${TextBackgroundOpacity};
  }
</style>