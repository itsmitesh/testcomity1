

<!-- AGL DESKTOP HOMEPAGE TABS component-->
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
    $(function () {
        $("#lia-component-custom-tabs-CommunityPage").tabs();

$('tr').click( function() {
    window.location = $(this).find('.MessageSubject').find('a').attr('href');
}).hover( function() {
    $(this).toggleClass('hover');
});

   });

</script>
<div class="lia-component-tabs lia-component-custom-tabs ui-tabs ui-widget ui-widget-content ui-corner-all" id="lia-component-custom-tabs-CommunityPage" style="display: block;">
    <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all lia-tabs-standard" role="tablist">
        <li class="ui-tabs-first ui-state-default ui-corner-top ui-tabs-active ui-state-active lia-tabs" role="tab" tabindex="0" aria-controls="lia-CommunityPage-tab-1" aria-labelledby="ui-id-1" aria-selected="true">
            <a href="#lia-CommunityPage-tab-1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">Latest Posts
            </a>
        </li>
        <li class="ui-state-default ui-corner-top lia-tabs" role="tab" tabindex="-1" aria-controls="lia-CommunityPage-tab-2" aria-labelledby="ui-id-2" aria-selected="false">
            <a href="#lia-CommunityPage-tab-2" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-2">Latest Solutions
            </a>
        </li>
        <li class="ui-tabs-last ui-state-default ui-corner-top lia-tabs" role="tab" tabindex="-1" aria-controls="lia-CommunityPage-tab-3" aria-labelledby="ui-id-3" aria-selected="false">
            <a href="#lia-CommunityPage-tab-3" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-3">Featured Posts
            </a>
        </li>
        <li class="ui-tabs-last ui-state-default ui-corner-top lia-tabs" role="tab" tabindex="-1" aria-controls="lia-CommunityPage-tab-4" aria-labelledby="ui-id-4" aria-selected="false">
            <a href="#lia-CommunityPage-tab-4" class="ui-tabs-anchor .tab_content_border" role="presentation" tabindex="-1" id="ui-id-4">Knowledge Base
            </a>
        </li>        
    </ul>
    <@component id="forums.widget.recent-threads"/>
    <@component id="solutions.widget.recently-solved-threads"/>
    <@component id="subscriptions.widget.subscriptions"/>
    <@component id="tkb.widget.recent-tkb-articles-taplet"/>
</div>