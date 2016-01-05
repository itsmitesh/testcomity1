<@liaAddScript>
var container = document.querySelector('.blog-articles');
var msnry;

imagesLoaded(container, function(){
msnry = new Masonry( container, {
// options
columnWidth: 340,
gutter: 15,
itemSelector: '.lia-message-view',
isFitWidth: true
});
});
</@liaAddScript>