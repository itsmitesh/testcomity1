<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Carousal</title>
	<!--<link rel="stylesheet" href="css/style.css">-->
	<link rel="stylesheet" href="/html/assets/jquery.bxslider.css">
</head>
<body>

<div class="slider1">
        <#assign boardList = rest("/categories/id/Abhishek_duraphe").category.boards.board />

		<#list boardList as board >
		<a href=""><img src="/html/assets/${board.id}.jpg" /><span>${board.id}</span></a>
			
		</#list>

  
</div>

<script src="/html/assets/jquery-1.11.3.js" type="text/javascript"></script>	
<!--<script src="scripts/cycle.js" type="text/javascript"></script>-->
<script src="/html/assets/jquery.bxslider.js" type="text/javascript"></script>
<script src="/html/assets/jquery.easing.1.3.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	 $('.slider1').bxSlider({
    slideWidth: 200,
    minSlides: 3,
    maxSlides: 5,
    moveSlides: 1,
    slideMargin: 10
  });
});

</script>

</body>
</html>