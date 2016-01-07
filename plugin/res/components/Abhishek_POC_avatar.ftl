<@liaAddScript>
;(function($) {
$(document).ready(function(){

	var allUserNames = "";

	var commentsLength = $( ".BlogArticlePage .lia-component-comments .CommentList .lia-message-view" ).length;

	$( ".BlogArticlePage .lia-component-comments .CommentList .lia-message-view" ).each(function(index) {
  		var userName = $(this).find(".lia-component-forums-widget-comment-message-view .lia-message-heading .lia-message-author a").text().trim();
  		if(index == commentsLength -1)
  		{
  			allUserNames = allUserNames + userName ;
  		}
  		else
  		{
  			allUserNames = allUserNames + userName+",";
  		}

  	});
  	console.log(allUserNames);

  		var urlPath = "http://comity.stage.lithium.com/comity/plugins/custom/comity/comity/abhishek_getuseravatar?name="+allUserNames;
  		$.ajax({
			type: "GET",
			url: urlPath,
			async : false,
			success: function(data){
				console.log(data);

				// $(this).find(".lia-component-forums-widget-comment-message-view .lia-message-heading .lia-message-author a").prepend(data);

				//$(data).prependTo('.lia-component-forums-widget-comment-message-view .lia-message-heading .lia-message-author a');

				// $(this).find(".lia-component-forums-widget-comment-message-view .lia-message-heading .lia-message-author a");
				var avtars = data.content.split(",");
				$( ".BlogArticlePage .lia-component-comments .CommentList .lia-message-view" ).each(function(index) {
			  		$(this).find(".lia-component-forums-widget-comment-message-view .lia-message-heading .lia-message-author a").prepend(avtars[index]);
			  	});

				
			},
			error: function(e) {
			$("#myEndpointDemo").append("<p>").text("error");
			}

		});
	
});
})(LITHIUM.jQuery);
</@liaAddScript>
