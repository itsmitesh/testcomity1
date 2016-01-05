component : Vaishnavi_call_ep
<@liaAddScript>
	;(function($) {
		$(document).ready(function() {
			var your_endpoint_url = "/plugins/custom/comity/comity/vishwajeeth_endpoint";
           $.get(your_endpoint_url).done(function( data ) {
                //your code goes here
				console.log(data);
            }).fail(function() {
                //something
           }) 

		});
	})(LITHIUM.jQuery);
</@liaAddScript>