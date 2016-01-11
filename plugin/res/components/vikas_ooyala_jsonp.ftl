<div class="lia-panel lia-panel-standard MessageListTaplet lia-component-forums-widget-recent-messages">
	<div class="lia-decoration-border">
		<div class="lia-decoration-border-top">
			<div>
			</div>
		</div>
		<div class="lia-decoration-border-content">
			<div>
				<div class="lia-panel-heading-bar-wrapper">
					<div class="lia-panel-heading-bar">
						<span class="lia-panel-heading-bar-title">Ooyala Calls</span>
					</div>
				</div>
				<div class="lia-panel-content-wrapper">
					<div class="lia-panel-content">
						<div class="SimpleMessageList">
							<div class="MessageList lia-component-forums-widget-message-list" id="messageList">
								<a shape="rect" name="message-list"></a>
								<div class="t-data-grid single-message-list">
									<div id="test">
										<a href="javascript:getData('')">Response by JsonP</a><br/>
										<div id="tagResult">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="lia-decoration-border-bottom">
			<div>
			</div>
		</div>
	</div>
</div>
<@liaAddScript>
(function($) {
(window.getData = function() {
					alert("in function");
					var url = 'https://api.ooyala.com/v2/labels?callback=get_my_labels';
					 
					$.ajax({
					   type: 'GET',
						url: url,
						async: false,
						jsonpCallback: 'jsonCallback',
						contentType: "application/json",
						dataType: 'jsonp',
						success: function(json) {
						alert("in success");
						   console.dir(json.items);
						},
						error: function(e) {
						   console.log(e.message);
						}
					});
         })  
	})(LITHIUM.jQuery);
</@liaAddScript>
