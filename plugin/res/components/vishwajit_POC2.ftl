<style>
/* - Board/Message list customization. Utilizes some js as well. Start */
  .js .thread-list .messageCountColumn, .js .BoardList .messageCountColumn, .js .thread-list .newMessageCountColumn, .js .BoardList .newMessageCountColumn, .js .thread-list .newMessagesCountColumn, .js .BoardList .newMessagesCountColumn, .js .thread-list .repliesCountColumn, .js .BoardList .repliesCountColumn, .js .thread-list .kudosCountColumn, .js .BoardList .kudosCountColumn, .js .thread-list .latestPostDateColumn, .js .BoardList .latestPostDateColumn, .js .thread-list .meTooCountColumn, .js .BoardList .meTooCountColumn, .js .thread-list .messageAuthorColumn, .js .BoardList .messageAuthorColumn, .js .MessageList .repliesCountColumn, .js .MessageList .newMessagesCountColumn, .js .MessageList .messageAuthorColumn, .js .MessageList .messageRatingColumn, .js .MessageList .meTooCountColumn, .js .MessageList .kudosCountColumn, .js .MessageList .latestPostDateColumn, .js .thread-list .viewsCountColumn, .js .BoardList .viewsCountColumn, .js .MessageList .viewsCountColumn {
    display: none;
  }
  
  .BoardBrowserListTaplet .lia-panel-heading-bar-wrapper,
  .lia-component-forums-widget-board-browser-list .lia-panel-heading-bar-wrapper,
  .BoardBrowserListTaplet .lia-browser-category-heading,
  .lia-component-forums-widget-board-browser-list .lia-browser-category-heading,
  .lia-component-forums-widget-message-list thead {
    display: none;
  }
  
  #lia-body .lia-content table.lia-list-wide tr .lia-row-odd td {
    padding: 18px 0;
      background-color: #ffffff
  }
  
  #lia-body .lia-content table.lia-list-wide tr td.boardIconColumn,
  #lia-body .lia-content table.lia-list-wide tr td.messageStatusIconColumn {
    padding: 14px 0px 0px 38px;
  }
  
  #lia-body .lia-content table.lia-list-wide tr td.messageStatusIconColumn {
    padding-right: 5px !important;
		padding-left: 0px;
  }
  
  .js #lia-body .lia-content .thread-list td.threadSubjectColumn, 
  .js #lia-body .lia-content .BoardList td.threadSubjectColumn, 
  .js #lia-body .lia-content .thread-list td.boardTitleColumn, 
  .js #lia-body .lia-content .BoardList td.boardTitleColumn {
    padding: 14px 18px 12px 0;
    }
  
  .js #lia-body .lia-content .thread-list td.threadSubjectColumn{
    padding-left: 14px;
   
  }
  
  .js #lia-body .lia-content td.js-thread-stats-col {
    width: 140px;
    padding: 16px 0 14px 18px;
  }
  
  .js #lia-body .lia-content td.js-thread-stats-col div {
    /*padding: 0 0 10px 0;*/
    font-size: 14px;
    color: #737373;
    font-weight: normal;
  }
  
  .js #lia-body .lia-content td.js-thread-stats-col div:last-child {
    padding: 0;
  }
  
  #lia-body .lia-content .BoardList table.lia-list-wide td,
  #lia-body .lia-content .thread-list table.lia-list-wide td {
    vertical-align: top;
  }
  
  #lia-body .lia-content table.lia-list-wide .board-list-latest,
  #lia-body .lia-content .BoardList .lia-list-wide th, #lia-body .lia-content .thread-list .lia-list-wide th {
    display: none;
  }
  
  #lia-body .lia-content .BoardList .lia-list-wide, #lia-body .lia-content .thread-list .lia-list-wide {
    border: none;
  }

  #lia-body .lia-content table.lia-list-wide tr.lia-row-even,
  #lia-body .lia-content table.lia-list-wide tr.lia-row-even td {
    background: #fff;
  }
  
  #lia-body .lia-content table.lia-list-wide td .js-latest-post-by-from #date,
  #lia-body .lia-content table.lia-list-wide td .js-latest-post-by-from .capsLock,
  #lia-body .lia-content table.lia-list-wide td .js-thread-stats-col .capsLock {
    font-size: 16px;
    color: #999;
  }
  
  #lia-body .lia-content table.lia-list-wide td.boardTitleColumn .board-title,
  #lia-body .lia-content table.lia-list-wide td.boardTitleColumn .board-title a,
  #lia-body .lia-content table.lia-list-wide td .MessageSubjectCell h2,
  #lia-body .lia-content table.lia-list-wide td .MessageSubjectCell a {
    font-size: 18px;
    line-height: 20px;
    font-weight: 400;
  }

  #lia-body .lia-content table.lia-list-wide td .js-latest-post-by-from a {
    font-size: 15px;
    font-weight: 400;
    color: #464646;
  }
  
  #lia-body .lia-content table.lia-list-wide td .js-latest-post-by-from a img {
    height: 16px;
    margin: 0 5px 0 0;
  }
  
  #lia-body .lia-content .BoardList .lia-list-wide tr {
    border-top: 2px solid #d9d9d9;
  }
  
  #lia-body .lia-content .BoardList .lia-list-wide tr td.boardTitleColumn h3.board-title {
    margin: 0;
    padding: 0 0 7px 0;
  }
  
  #lia-body .lia-content .BoardList .lia-list-wide tr td.boardTitleColumn .board-description {
    color: #333333;
    font-size: 18px;
    line-height: 24px;
    font-weight: normal;
  }
  
  #lia-body .lia-content .lia-menu-bar .lia-menu-bar-buttons .lia-button-wrapper,
  #lia-body .lia-content .lia-menu-bar .lia-menu-bar-buttons .lia-menu-action {
    margin: 0 19px 0 0;
  }
  
  #lia-body .lia-content .lia-menu-bar-buttons .lia-button-wrapper-primary a,
  #lia-body .lia-content .lia-menu-navigation .default-menu-option {
    font-size: 14px;
    padding: 0 17px 0 0;
  }
  
  #lia-body .lia-content .lia-message-heading .lia-component-message-header .lia-menu-bar-buttons .lia-button-wrapper-primary a,
  #lia-body .lia-content .lia-message-heading lia-component-message-header .lia-menu-navigation .default-menu-option {
    font-size: 12px;
  }
    
  #lia-body .lia-content .lia-menu-navigation .default-menu-option {
  }
  
  #lia-body .lia-content table.lia-list-wide td {
    border: none;
  }

  #lia-body .lia-content .js-kudos-count span,
  #lia-body .lia-content .js-replies-count span {
    display: inline-block;
    width: 55px;
  }

  #lia-body .lia-content .js-kudos-count span.kudosCount,
  #lia-body .lia-content .js-replies-count span.repliesCount {
    text-align: center;
    margin-right:10px
  }
  /* - Board/Message list customization. Utilizes some js as well. End */

  
</style>

<@liaAddScript>
;(function($) {
	common = {
		initBoardList: function(){
			/*customizing the board/message list interface
			without the need of building a new markup structure via a new component. Check to see if the page
			contains the board, thread, or message list types that we want to modify. Otherwise, don't run this
			JavaScript. */
			if($('.BoardList,.thread-list,.single-message-list').length){
				var thisBoard = $('.BoardList,.thread-list,.single-message-list');
				$.each($('tr',thisBoard),function(){					
					var thisSubjectRow = $('td.threadSubjectColumn,td.boardTitleColumn',$(this));
					
					if($('td.latestPostDateColumn',$(this)).length){
						thisSubjectRow.append('<div class="js-latest-post-by-from"><span class="capsLock">by&nbsp;</span></div>');
						/*if($('td.latestPostDateColumn #authors a',$(this)).length>=1){
							var el = $('td.latestPostDateColumn #authors a',$(this));
							var thisContainer = $('.js-latest-post-by-from',$(this));
							//$('.js-latest-post-by-from',$(this)).html(el.eq(1)[0]+el.eq(0)[0]);
							(el.eq(1)).appendTo(thisContainer);
							(el.eq(0)).appendTo(thisContainer);
						} else if($('td.latestPostDateColumn #authors',$(this)).length) {
							$('.js-latest-post-by-from',$(this)).append($('td.latestPostDateColumn #authors',$(this)).html());	
						} else if($('td.messageAuthorColumn .UserProfileSummary',$(this)).length){
							$('.js-latest-post-by-from',$(this)).append($('td.messageAuthorColumn .UserName',$(this)).html());	
						}*/

            <#-- previous code : disply author from lataest post column
						if($('td.latestPostDateColumn .lia-message-by .UserName a',$(this)).length>=1){
							var el = $('td.latestPostDateColumn .lia-message-by .UserName a',$(this));
							var thisContainer = $('.js-latest-post-by-from',$(this));
							//$('.js-latest-post-by-from',$(this)).html(el.eq(1)[0]+el.eq(0)[0]);
							(el.eq(1)).appendTo(thisContainer);
							(el.eq(0)).appendTo(thisContainer);
						} else if($('td.latestPostDateColumn .lia-message-by .UserName',$(this)).length) {
							$('.js-latest-post-by-from',$(this)).append($('td.latestPostDateColumn .lia-message-by .UserName',$(this)).html());	
						} else if($('td.messageAuthorColumn .UserProfileSummary',$(this)).length){
							$('.js-latest-post-by-from',$(this)).append($('td.messageAuthorColumn .UserName',$(this)).html());	
						}
            -->
            <#-- New code : display author from messageAuthorColumn -->
            if( $(".messageAuthorColumn .UserName a",$(this)).length >= 1 ) {
              $('.js-latest-post-by-from',$(this)).append( $(".messageAuthorColumn .UserName",$(this)).html() );
            }
            else{
              $('.js-latest-post-by-from',$(this)).append("<span class='login-bold lia-user-name-link'>Anonymous</span>");
            }

						
            if($('td.latestPostDateColumn .DateTime',$(this)).length){
							
								var LoginNameDiv = $('td.latestPostDateColumn a .DateTime span',$(this)).hasClass('local-date');
									if(LoginNameDiv){
										console.log("Inside If statement ");
										$('.js-latest-post-by-from',$(this)).prepend('<span id="date">'+$('td.latestPostDateColumn a .DateTime .local-date',$(this)).text()+'&nbsp;</span>');
									} else {
										console.log("Inside else statement");
										$('.js-latest-post-by-from',$(this)).prepend('<span id="date">'+$('td.latestPostDateColumn a .DateTime .local-friendly-date',$(this)).text()+'</span>');
									}
										

						} 
						$('.js-latest-post-by-from',$(this)).append($('td.latestPostDateColumn #date',$(this)));
					}
					$('<td class="js-thread-stats-col"></td>').insertAfter(thisSubjectRow);
					var thisSubjectRowStats = $('.js-thread-stats-col',$(this));
					
					/*var statsNewMsgCount = '';
					if($('td.newMessagesCountColumn,td.newMessageCountColumn',$(this)).length){
						statsNewMsgCount = '<div class="js-newMsg-count">'+$('td.newMessagesCountColumn,td.newMessageCountColumn',$(this)).text()+'&nbsp;<span class="capsLock">New</span></div>';	
					}*/
					/*var statsMsgCount = '';
					if($('td.messageCountColumn',$(this)).length){
						statsMsgCount = '<div class="js-newMsg-count">'+$('td.messageCountColumn',$(this)).text()+'&nbsp;<span class="capsLock">Threads</span></div>';	
					}*/
					var statsRepliesCount = '';
					if($('td.repliesCountColumn',$(this)).length){
						statsRepliesCount = '<div class="js-replies-count"><span class="capsLock">Replies</span><span class="repliesCount">'+$('td.repliesCountColumn',$(this)).text()+'</span></div>';
					}
					var statsKudosCount = '';
					if($('td.kudosCountColumn',$(this)).length){
						statsKudosCount = '<div class="js-kudos-count"><span class="capsLock">Kudos</span><span class="kudosCount">'+$('td.kudosCountColumn',$(this)).text()+'</span></div>';
					}
					/*var statsViewCount = '';
					if($('td.viewsCountColumn',$(this)).length){
						statsViewCount = '<div class="js-view-count">'+$('td.viewsCountColumn',$(this)).text()+'&nbsp;<span class="capsLock">Views</span></div>';
					}*/
					//thisSubjectRowStats.append(statsNewMsgCount+statsMsgCount+statsRepliesCount+statsKudosCount+statsViewCount);					
					thisSubjectRowStats.append(statsRepliesCount+statsKudosCount);
					
				});
			}
		}
	}
	window.common = common;
	$(document).ready(function() {
		common.initBoardList();
		var dateSpanParent = $("#lia-body.ForumPage #messageList table.lia-list-wide td.threadSubjectColumn");
		/*$(dateSpanParent).each(function(){
			var dateSpan = $(this).find(".js-latest-post-by-from #date").detach();
			var sibling = $(this).parent("tr.lia-list-row").find(".js-thread-stats-col .js-kudos-count");
			dateSpan.insertAfter(sibling);
		});*/
    $(".lia-menu-bar-top .lia-decoration-border-menu-bar-content>div").append("<div class='CustomRSSfeedButton'><a><span class='rss_text'>RSS</span></a></div>");

    var RSSLink = $(".lia-component-rss-action-board").attr("href");
    $(".CustomRSSfeedButton a").attr("href",RSSLink);
	});
})(LITHIUM.jQuery);
</@liaAddScript>