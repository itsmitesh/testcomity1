${settings.name.get("hostname")}
<div class="lia-panel lia-panel-standard AskAnExpertTaplet Chrome lia-component-qanda-widget-ask-an-expert">
    <div class="lia-decoration-border">
            <div class="lia-decoration-border-top">
                <div></div>
            </div>

            <div class="lia-decoration-border-content">
                <div>
                    <div class="lia-panel-heading-bar-wrapper">
                        <div class="lia-panel-heading-bar">
                            <span class="lia-panel-heading-bar-title">Ask a Question</span>
                        </div>
                    </div>

                    <div class="lia-panel-content-wrapper">
                        <div class="lia-panel-content">
                            <div class="AskAnExpertTaplet lia-cm-ask-an-expert-wrapper" id="cm-qandaAskExpertTaplet">
                                <div class="AskAnExpertWrapper lia-ask-an-expert-wrapper"id="qandaAskExpertForm">
                                    
                                        
                                        <div class="lia-quilt-row lia-quilt-row-standard lia-input-edit-form-row lia-quilt-row-first lia-quilt-row-last">
                                        <div class="lia-quilt-column lia-quilt-column-24 lia-quilt-column-single lia-input-edit-form-column">
                                            <div class="lia-quilt-column-alley lia-quilt-column-alley-single">

                                                    <div class="lia-form-row lia-form-question-field-entry">
                                                        <div class="lia-quilt-row lia-quilt-row-standard">
                                                            <div class="lia-quilt-column lia-quilt-column-24 lia-quilt-column-single">
                                                                <div class="lia-quilt-column-alley lia-quilt-column-alley-single">
                                                                    <div class="lia-form-input-wrapper">
                                                                        <input class="lia-form-question-field-input lia-form-type-text lia-form-input-vertical lia-field-blur" id="lia-questionField" name="questionField" title="Type your question here" placeholder="Type your question here..." style="width: 97%; padding: 1% 1%;">
                                                                            
                                                                        </input>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="lia-form-footer">
                                            <div class="lia-quilt-row lia-quilt-row-standard lia-form-buttons-empty-left-column">
												<div class="lia-quilt-column lia-quilt-column-08 lia-quilt-column-left">
													<div class="lia-quilt-column-alley lia-quilt-column-alley-left">
														<div class="lia-form-submit lia-button-group">
															<span class="lia-button-wrapper lia-button-wrapper-primary lia-button-wrapper-Continue-action lia-link-disabled">
																<a id="cm-ask-question" class="lia-button lia-button-primary lia-button-Continue-action lia-link-disabled"
																disabled="disabled" href="/t5/forums/postpage/choose-node/true/interaction-style/forum/override-styles/true">Ask a Question</a>
															</span>
														</div>
													</div>
												</div>

                                                <div class="lia-quilt-column lia-quilt-column-16 lia-quilt-column-right">
													<div class="lia-quilt-column-alley lia-quilt-column-alley-right">
														<div class="lia-form-submit lia-button-group">															
															<span class="lia-button-wrapper lia-button-wrapper-primary lia-button-wrapper-search-action">
																<a id="cm-search-btn" class="lia-button lia-button-primary lia-button-search-action" href="/t5/forums/searchpage/tab/message?location=Category%3Atop&mobilefilter=none&q=">Search</a>
															</span>
														</div>
													</div>
                                                </div>
                                            </div>
                                        </div>
                                    

                                    <div class="lia-ask-search-results"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="lia-decoration-border-bottom">
                <div></div>
            </div>
        </div>
    </div>


<@liaAddScript>
;(function($){
    $(document).ready(function(){
	
		//on keyup, start the countdown
		$('#lia-questionField').keyup(function(){
			if( $("#lia-questionField").val().length >= 3 ) {
				searchMessages();
			}
			else {
				jQuery(".lia-button-wrapper-Continue-action").addClass("lia-link-disabled");
				jQuery(".lia-button-Continue-action").addClass("lia-link-disabled").prop('disabled', true);
				
				$( ".lia-ask-search-results" ).html( "" );
			}
		});
	
		$('#cm-search-btn').click(function(){
			$(this).attr("href","/t5/forums/searchpage/tab/message?location=Category%3Atop&mobilefilter=none&q=" + $("#lia-questionField").val());
		});
		
		$('#cm-ask-question').click(function(){
			$(this).attr("href","/t5/forums/postpage/choose-node/true/interaction-style/forum/override-styles/true?message-subject=" + $("#lia-questionField").val() + "&autoComplete=false");
		});

		function searchMessages () {
			$.ajax({
				method: "GET",
				url: "/plugins/custom/comity/comity/sunnym_custom_msg_search"
				//data: { name: "John", location: "Boston" }
			})
			.done(function(data) {
				console.log( "success" );
				$( ".lia-ask-search-results" ).html( data );
			})
			.fail(function() {
				console.log( "error" );
			})
			.always(function() {
				console.log( "complete" );
			});
			
			if( $("#lia-questionField").val().length !== 0 ) {
                jQuery(".lia-button-wrapper-Continue-action").removeClass("lia-link-disabled");
                jQuery(".lia-button-Continue-action").removeClass("lia-link-disabled").prop('disabled', false);
            }
		}
    });
})(LITHIUM.jQuery);
</@liaAddScript>

<style>
<#if clientDevice.mobile>
#lia-body .lia-content #lia-questionField {
	width: 98% !important;
	padding: 1%;
	border: 1px solid #ccc !important;
	height: 22px;
	margin-bottom: 10px;
}
<#else>
#lia-body .lia-content #lia-questionField {
	width: 100% !important;
}
</#if>
#lia-body .lia-content .lia-form-footer .lia-quilt-column-alley-left .lia-button-group .lia-button-wrapper {
	float: left;
	margin: 0;
}
</style>