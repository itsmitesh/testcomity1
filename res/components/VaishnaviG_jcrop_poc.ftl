<link rel="stylesheet" href="http://jcrop-cdn.tapmodo.com/v0.9.12/css/jquery.Jcrop.min.css" type="text/css" />
<script src="http://edge1u.tapmodo.com/global/js/jquery.min.js"></script>
<script src="http://jcrop-cdn.tapmodo.com/v0.9.12/js/jquery.Jcrop.min.js"></script>

<script type="text/javascript">
$(function(){ 
	$('#jcrop_target').Jcrop({
	setSelected :[200,200,200,200]
	}); 
});

<@liaAddScript>
;(function($) {

$(document).one("LITHIUM:updateCoordinates",function() {
        var image = $("#jcrop_target");
        var img = new Image();
            function addAspectRatio() {
                image.data("Jcrop").setOptions({aspectRatio: 1, minSize: [200, 200]});
            }
            
            function addLater() {
                       if (!image.data("Jcrop")) {
                               window.setTimeout(addLater, 50);
                       } else {
                               addAspectRatio();
                       }
            }
            
            img.onload = addLater;
            img.src=image[0].src;
			console.log(img.src);
     });
	 
	 })(LITHIUM.jQuery);
</@liaAddScript>

</script>



<img src="http://jcrop-cdn.tapmodo.com/v0.9.10/demos/demo_files/pool.jpg" id="jcrop_target" />
