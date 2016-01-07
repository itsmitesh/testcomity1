<link rel="stylesheet" href="/html/assets/ctctUiwidget.css">
<link rel="stylesheet" href="/html/assets/jquery-ui.css">
<script type="text/javascript" src="/html/assets/jquery-1.9.1.js"></script>
<script type="text/javascript" src="/html/assets/jquery-ui.js"></script>

<#assign feedbackBoardID = http.request.parameters.name.feedbackboardid>
<#assign issueBoardID = http.request.parameters.name.issueboardid>
<#assign supportNumber = http.request.parameters.name.suppNo>

<#assign headingtxt = "Give us Feedback">
<#if http.request.parameters.name.widText??>
   <#assign headingtxt = http.request.parameters.name.widText>
</#if>

<#assign helpLabel = "How can we help?">
<#if http.request.parameters.name.taxonomytxt??>
   <#assign helpLabel = http.request.parameters.name.taxonomytxt>
</#if>

<#assign subLabel = "Briefly describe your feedback">
<#if http.request.parameters.name.subjecttxt??>
   <#assign subLabel = http.request.parameters.name.subjecttxt>
</#if>

<#assign commentLabel = "Additional details or comments">
<#if http.request.parameters.name.commenttxt??>
   <#assign commentLabel = http.request.parameters.name.commenttxt>
</#if>

<#assign postbtnLabel = "Post to our public forum">
<#if http.request.parameters.name.postbuttontxt??>
   <#assign postbtnLabel = http.request.parameters.name.postbuttontxt>
</#if>

<#assign thankLabel = "Thanks for Your Feedback">
<#if http.request.parameters.name.thanktxt??>
   <#assign thankLabel = http.request.parameters.name.thanktxt>
</#if>

<#assign feedsubmitLabel = "You have successfully posted your feedback to the Constant Contact Community.">
<#if http.request.parameters.name.successfeedbacktxt??>
   <#assign feedsubmitLabel = http.request.parameters.name.successfeedbacktxt>
</#if>

<#assign feedbackimproveLabel = "We are always trying to improve our product experience and welcome your thoughts.">
<#if http.request.parameters.name.feedbacksubmittxt??>
   <#assign feedbackimproveLabel = http.request.parameters.name.feedbacksubmittxt>
</#if>

<#assign postlinkLabel = "See your post here.">
<#if http.request.parameters.name.postlinktxt??>
   <#assign postlinkLabel = http.request.parameters.name.postlinktxt>
</#if>

<#assign notificationLabel = "You will receive updates on this post via your community activity notifications.">
<#if http.request.parameters.name.postnotificationtxt??>
   <#assign notificationLabel = http.request.parameters.name.postnotificationtxt>
</#if>

<#assign issueThankLabel = "We are here to help!">
<#if http.request.parameters.name.issueThankyoutxt??>
   <#assign issueThankLabel = http.request.parameters.name.issueThankyoutxt>
</#if>

<#assign issuePostlinkLabel = "See your post here.">
<#if http.request.parameters.name.issuePostLinktxt??>
   <#assign issuePostlinkLabel = http.request.parameters.name.issuePostLinktxt>
</#if>

<#assign autoSearch = "true">
<#if http.request.parameters.name.autosearch??>
   <#assign autoSearch = http.request.parameters.name.autosearch>
</#if>



<#assign feedbackLabels = rest("/boards/id/${feedbackBoardID}/labels/predefined")>

<#assign forumTitle = rest("/boards/id/${issueBoardID}").board.title>

<style>
.ctct_feedback_error{
border: 1px solid rgb(255, 0, 0);
}

</style>

<script type="text/javascript">
 $.noConflict();

var subURL =  "";
var mesgTopicURL = "";
var mesgReplyURL = "";
var isTopic = "true";
var replyMesgID ="";
var boardTypeSelected="";
var noLogin = "false";

var limitnum =${settings.name.get("config.max_length_message_subject")};
var limitBody =${settings.name.get("config.max_length_message_body")};
var autoSearch = "${autoSearch}";

jQuery(document).ready(function(){
	jQuery("#styled").attr('maxlength',limitnum+1);
	jQuery("#styled_text").attr('maxlength',limitBody);
});

jQuery(document).ready(function(){

jQuery("#ctct_dropdown_select").click(
    function(){
        jQuery("#styled,#styled_text").val('');
    });

var selectedLabel="";
var feedbackMenu = [<#list feedbackLabels.labels.label as lb>"${lb.text}",</#list>];
var reportMenu =  ["I am having trouble using the site"];
 
var mySelect = jQuery("#feedMenu");
jQuery.each(feedbackMenu, function(val, text) {
    mySelect.append(
        jQuery('<option></option>').val(val).html(text)
    );
});
var mysel = jQuery('#reportMenu');
jQuery.each(reportMenu, function(val, text) {
    mysel.append(
        jQuery('<option></option>').val(val).html(text)
    );
});

jQuery("#ctct_dropdown_select").change(function(){

    selectedLabel = jQuery("option:selected", this);
    if(selectedLabel.parent()[0].id == "feedMenu"){
	    subURL = "/restapi/vc/boards/id/${feedbackBoardID}/search/messages?xslt=json.xsl";
		mesgTopicURL = "/restapi/vc/boards/id/${feedbackBoardID}/messages/post?xslt=json.xsl";
		boardTypeSelected="feedback";
		
		if(autoSearch == "true"){
			jQuery( "#styled" ).autocomplete( "enable" );
		}else{
			jQuery( "#styled" ).autocomplete( "disable" );
		}
	
	} else if(selectedLabel.parent()[0].id == "reportMenu"){
		isTopic = "true";
		subURL = "/restapi/vc/boards/id/${issueBoardID}/search/messages?xslt=json.xsl";
		mesgTopicURL = "/restapi/vc/boards/id/${issueBoardID}/messages/post?xslt=json.xsl";
		boardTypeSelected="issue";
		jQuery( "#styled" ).autocomplete( "disable" );
	}
});

 jQuery("#buttonLabel").click(function(){
	var checkStatus = "notEmpty";
	
	if(jQuery("#ctct_dropdown_select").val() == null || jQuery("#ctct_dropdown_select").val() == "Please Select..."){
			 jQuery("#ctct_dropdown_select").addClass("ctct_feedback_error");
				checkStatus = "isEmpty";
	}
	else
	{
		jQuery("#ctct_dropdown_select").removeClass("ctct_feedback_error");
	}
	
	if(jQuery("#styled").val() == "" ){
		 jQuery("#styled").addClass("ctct_feedback_error");
			
				checkStatus = "isEmpty";	 
	}
	else
	{
		jQuery("#styled").removeClass("ctct_feedback_error");
	}
	if(jQuery("#styled_text").val() == ""){
		jQuery("#styled_text").addClass("ctct_feedback_error");
			
				checkStatus = "isEmpty";		
	}
	else
	{
		jQuery("#styled_text").removeClass("ctct_feedback_error");
	}
	if(checkStatus == "isEmpty")
	{
		jQuery("#errMsg").css("color", "red");
			jQuery("#errMsg").html("All the fields are required.");
		return false;
	}


	var mesgPostURL = mesgTopicURL;
	var postData="";
	if(boardTypeSelected == "feedback"){
		postData = {"label.labels":selectedLabel.text(),"message.subject":jQuery("#styled").val(),"message.body":jQuery("#styled_text").val()};
	}else{
		postData = {"message.subject":jQuery("#styled").val(),"message.body":jQuery("#styled_text").val()};
	}
	

	if(isTopic == "false"){
		var replyText = "${settings.name.get("message.reply_with_re")}";
		var changedSubText=jQuery("#styled").val();
		if(replyText == "true"){
			changedSubText = "Re: " + jQuery("#styled").val();
		}
		mesgPostURL = "/restapi/vc/messages/id/"+replyMesgID+"/reply?xslt=json.xsl";
		postData={"message.subject":changedSubText,"message.body":jQuery("#styled_text").val()};
	}
	
		
	function setMesgLinkURL(webURL){
	
		var mesgPostWebURLAPI = "/restapi/vc/messages/id/"+webURL+"/web_page_url?xslt=json.xsl";
			
		jQuery.getJSON(mesgPostWebURLAPI, function(data) {
			
			var mesgPostWebURL = data.response.string.$;
			if(boardTypeSelected == "feedback"){
				jQuery("#feedWebLink").attr('href', mesgPostWebURL);
			}else{
				jQuery("#issueWebLink").attr('href', mesgPostWebURL);
			}
						
        });
		
		displayAcknowledge();
	}
	
	function setErrorInPost(errorCode){
		
		displayErrorPage(errorCode);
		
	}
	
	function displayErrorPage(errorCode)
	{
	
		jQuery("#feedback_issue_page").fadeOut(function(){
			jQuery('body').css("background-color","");
			jQuery("#displayError").fadeIn();
		});
		
		if(errorCode=="100"){
			jQuery("#errorLabel").html("You must be logged in to post a message!");
		}else if(errorCode=="303"){
			jQuery("#errorLabel").html("You do not have the permission(s) to post a message!");
		}
		
	}
	
	function displayAcknowledge()
	{
	
		if(boardTypeSelected == "feedback"){
				jQuery("#feedback_issue_page").fadeOut(function(){
				jQuery('body').css("background-color","");
				jQuery("#feedback_thankyou").fadeIn();
			});
		} 
		else if(boardTypeSelected == "issue"){
				jQuery("#feedback_issue_page").fadeOut(function(){
				jQuery('body').css("background-color","");
				jQuery("#issue_thankyou_page").fadeIn();
 
			});
		}
	
	}	
	
  jQuery.ajax({ 
   type: "POST",
   data : postData,
   dataType: "json",
   url: mesgPostURL,
   success: function(data){
		
		if(data.response.status=="error"){
			
			var errorCode = data.response.error.code;
			
			setErrorInPost(errorCode);
			
		}else if(data.response.status=="success"){
			
			var postResponseMesgID = data.response.message.id.$;
			setMesgLinkURL(postResponseMesgID);
		}
		
	},
		error:function(data){
			console.log(data);
		}
	});
		
		
})

});
		
jQuery(function() {
		var maxSub = ${settings.name.get("config.search_before_post_number_of_results")};
		var rootIdeaQuery = " AND is_root:true";
		jQuery( "#styled" ).autocomplete({
	      source: function(req, add){
		   
			jQuery.getJSON(subURL, { q:req.term+rootIdeaQuery, page_size:maxSub },
			function(data) {  
	    	isTopic = "true"; 
	    	var suggestions = [];  
	     
	    	jQuery.each(data, function(i, val){  
			
	    		if(val.messages != null){
				
					if(typeof val.messages.message[0] == "undefined")
					{
						var mesgTxt = val.messages.message.subject.$;
					
						if(mesgTxt.length > limitnum){
						
							var trimLen = limitnum - 3;
							mesgTxt = mesgTxt.substring(0,trimLen);
							mesgTxt = mesgTxt + "...";
						}
					
						suggestions.push({'label':mesgTxt, 'value':val.messages.message.id.$});
					
					}else{
				
						for(var j =0;j<val.messages.message.length;j++)
						{
							var mesgTxt = val.messages.message[j].subject.$;
																		
							if(mesgTxt.length > limitnum){
						
								var trimLen = limitnum - 3;
								mesgTxt = mesgTxt.substring(0,trimLen);
								mesgTxt = mesgTxt + "...";
							}
							suggestions.push({'label':mesgTxt, 'value':val.messages.message[j].id.$});
												
						}
										
					}
	    			
	    		}
	        });  
	      add(suggestions);  
	   });  
	},
	  select: function( event, ui ) {
		isTopic = "false";
			event.preventDefault();
                      var mesgLabel = ui.item.label;
			 replyMesgID = ui.item.value;
            
			jQuery("#styled").val(mesgLabel);
                     },
      focus: function( event, ui ) {
			jQuery( "#styled" ).val( ui.item.label );
			return false; 
		}
	    
		});
		
});
	

jQuery(document).ready(function(){
  
  function limiting(obj, limit) {
		var cnt = jQuery("#counter > span");
		var txt = jQuery(obj).val(); 
		var len = txt.length;
    
		if(len > limit){
			jQuery(obj).val(txt.substr(0,limit));
			jQuery(cnt).html(len-1);
			jQuery('#char_limit_exceed').html("You have exceeded the max number of characters").fadeIn(100);
			jQuery('#counter').css("margin-top", "20px");
			jQuery('#counter').css("color", "red");
		} 
		else { 
			jQuery(cnt).html(len);
			jQuery('#char_limit_exceed').html("You have exceeded the max number of characters").fadeOut(100);
			jQuery('#counter').css("margin-top", "0px");
			jQuery('#counter').css("color", "black");
		}
	}
 jQuery('#styled').keyup(function(){
    limiting(jQuery(this), limitnum);
  });
});


</script>
<html>
<body>

	<div id="feedback_issue_page" class="ctct_mainstyle">

		<div id="send_fed" class="ctct_div"><label class="ctct_heading">${headingtxt} - ${forumTitle}</label> 
			
			<br>
		</div>
		<center>
			<div id="errMsg" style="height: 15px;width: 200px;">
		</div>
		</center>
		<form id="ctct_mesg_post" action="" method="POST">
			<label class="ctct_heading_sub">${helpLabel}</label><br> 
			<SELECT ID="ctct_dropdown_select" class="ctct_dd_s" name="label.labels">
				<option style="font-family: sans-serif;font-size: 0.875em;color: #606060;font-style: normal;" disabled selected>Please Select...</option>
				<OPTGROUP LABEL="Give Feedback:" id="feedMenu" style="font-family: sans-serif;font-size: 0.875em;color: #606060;font-weight: bold;font-style: normal;">
				</OPTGROUP>

				<OPTGROUP LABEL="Report Issue:" id="reportMenu" style="font-family: sans-serif;font-size: 0.875em;color: #606060;font-weight: bold;font-style: normal;">

				</OPTGROUP>

			</SELECT>

			<div id="feedback_textarea" class="ui-widget">
				<br><label class="ctct_heading_sub">${subLabel}</label>
				<label id="counter" style="float:right;margin-right: 10px;">
			    <span>0</span>/${settings.name.get("config.max_length_message_subject")}
				</label>
				<br>
				<label id="char_limit_exceed" style="color:red;position:relative;left:20px;"></label>
				<input type="text" name="message.subject" id="styled" class="ctct_styled" style="position:relative;left:19px;"/>                      
				
			
			</div>

			<div id="feedback_lower"><br>
				<label class="ctct_heading_sub">${commentLabel}</label><label id="char_limit_textarea" style="margin-left:150px; color:red;"></label><br>
				<textarea id="styled_text" name="message.body" class="ctct_styled_text" style="position:relative;left:19px;resize: none;"></textarea>
					
				<br>
				<p id="counter1" style="float:right;margin-right: 10px;">
				    
				</p>
			</div>
			</form>

		<div id="feedback_buttons" class="ctct_footDiv">
		
			<button id="buttonLabel" class="ctct_button">${postbtnLabel}</button> 
						
		</div>
	
	</div>
	
	
	<div id="feedback_thankyou" class="ctct_mainstyle" style="display:none;">

		<div id="thankyou_fed" class="ctct_div">
			<label class="ctct_heading_sub" style="color: #606060;font-size: 1.625em;font-weight: bold;">${thankLabel}</label>
			
		</div>
		<br> <br>
		<div>
			<label class="ctct_heading_sub" style="color:#606060;font-size:10pt;font-weight:bold;font-family:sans-serif;">${feedsubmitLabel}</label>
		</div>

		<br>
		<div id="feedback_thankyou_matt" class="matter">
			<label style="color: #606060;font-size: 10pt;font-family: sans-serif;">${feedbackimproveLabel}</label><br>
		</div>
		<div id="feedback_post_link" style="margin-left:19px;">
			<a id="feedWebLink" class="font_matter" target="_blank" style="font-family: sans-serif;font-size: 10pt;color: #428dcb;
font-weight: bold;">${postlinkLabel}</a>
				
		</div>
		<br>
		
		<div id="feedback_thank_cancel" class="ctct_thankDiv">
			

		</div>

	</div>
	
	
	<div id="issue_thankyou_page" class="ctct_mainstyle" style="display:none;">

		<div id="issue_send_fed" class="ctct_div">
			<label class="ctct_heading" style="font-family: sans-serif;font-weight: bold;color: #606060;">${issueThankLabel}</label>
			
		</div>
		<br> <br>
		<div>
			<label class="ctct_heading_sub" style="color: #606060;font-size: 10pt;font-family: sans-serif;font-weight: bold;">You’ve successfully posted your question to the Constant Contact Community.</label>
		</div>

		<br>
		<div id="issue_matter" class="matter">
			<label style="color: #606060;font-family: sans-serif;font-size: 10pt;">Our staff and community members look forward to addressing your concerns.</label>
			<br>
			<a class="font_matter" id="issueWebLink"  target="_blank" style="font-family: sans-serif;font-size: 10pt;color: #428dcb;
font-weight: bold;">${issuePostlinkLabel}</a>
		</div>
		<br>

		<div id="isuue_footer_link"><label class="ctct_heading_sub" style="color: #606060;font-size: 10pt;font-family: sans-serif;font-weight: bold;">If you need immediate assistance, just give us a call at ${supportNumber}</label><br>
		<label class="matter" style="color: #606060;font-family: sans-serif;font-size: 10pt;">Please have your post information handy for a customer representative.</label>
		</div>
		<div id="issue_footer" class="ctct_thankDiv">
			

		</div>

	</div>
	
	<div id="displayError" class="ctct_mainstyle" style="display:none;">
		<div id="thankyou_fed" class="ctct_div">
		
		</div>
		
		<div style="margin-top:190px">
			<label id="errorLabel" style="color:red;margin-left:140px;" class="ctct_heading_sub"></label>
		</div>
		
		<div id="errorPage_footer" class="ctct_thankDiv">
			
		</div>
	</div>
	
</body>
</html>