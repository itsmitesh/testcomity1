<#assign page_number = webuisupport.path.parameters.name.get ("page", 1) />
<#assign pageable_item = webuisupport.paging.pageableItem.setCurrentPageNumber(page_number)
.setItemsPerPage(1).setTotalItems(3).
setPagingMode("enumerated").build />

<@component id="common.widget.pager" 
pageableItem=pageable_item />