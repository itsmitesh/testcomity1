<#import "hierarchy-utils.ftl" as hierUtils />
<#import "board_dropdown_for_category.ftl" as disp/>
<#import "layout-utils.ftl" as layoutUtils />
<#assign rootCatID = hierUtils.getCategoryParent() />

<#if rootCatID?has_content>
<@layoutUtils.wrapComponent name="custom-openresponse-component">
	<div id="custom-openresponse-component-responses">
		<@component id="custom-openresponse-widget-boardinfo" nodeid="${rootCatID}" nodetype="category" />
	</div>
	<div id="custom-openresponse-component-filter">
		<@disp.boardDropdownForCategory cat=rootCatID displayed=true />
	</div>
</@layoutUtils.wrapComponent>
<@liaAddScript>
;(function($){ 
  LITHIUM.Loader.onLoad(function(){
	
	 var commid = '${community.id?js_string}';
	<#-- Enable filter dropdown -->
	//var filter = $('#custom-board-selector').detach();
	//$('.custom-openresponse-component .lia-panel-heading-bar-wrapper').append(filter);
	//$('#custom-board-selector').show();
	$('#custom-board-selector').attr('disabled',false);
	
	<#-- Initial selected value -->
	var lastVal = $('#custom-board-selector').val() || '';
	
	<#-- On change handler -->
	$('#custom-board-selector').on('change', function (e) { 
	
		var selectedBoard = $(this).val() || '';
		
		if ( $(this).attr('disabled') === 'disabled' || lastVal === selectedBoard) { return; }
		
		 $.ajax({
          type: "GET",
          url: "/responsive5/plugins/custom/lithium/responsive5/get-openresponses",
          data: ({
             'nodeid' : selectedBoard,
             'nodetype' :  'board'
            }),
		  beforeSend : function () { 
			<#-- Disable select -->
			$('#custom-board-selector').attr('disabled',true);
		  },
          success: function (data) {                
			var dataToInject = $(data).find('.lia-panel-content-wrapper');
			var viewAllToInject = $(data).find('.lia-view-all');

			if ($(dataToInject).size() < 1) { 
				dataToInject = data;
				$('.custom-openresponse-component .lia-view-all').hide();		
			}
			
			$('.custom-openresponse-component .lia-panel-content-wrapper').html($(dataToInject).html());

			if ( $(viewAllToInject).size() >= 1 ) {
				$('.custom-openresponse-component .lia-view-all').html($(viewAllToInject).html());
				$('.custom-openresponse-component .lia-view-all').show();
			} 
          },
          complete: function () {
			<#-- Enable select -->
			$('#custom-board-selector').attr('disabled',false);
          }
                
        });

	});
  });
})(LITHIUM.jQuery);
</@liaAddScript>
</#if>