<div class="Uplaod_comp">
<#assign upload=restadmin("/users/id/15/uploads/images").images/>
<h1>My Profile Page</h1>
<#list upload.image as img1>

<#list img1 as im>
<img src=${im.url} alt="Krishna Pokalwar" style="width:60px;height:60px;">
</#list>

</#list>
</div>
<style>
.Uplaod_comp{margin-top:10px;}
</style>