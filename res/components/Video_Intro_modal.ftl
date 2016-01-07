<#assign componentParameters = modalsupport.component.parameters.add("listSize", 10).build />
<#assign modalOptions = modalsupport.options.setButtonType("secondary").setTitle("New Market Item").setSmall(false).setResizable(false).setTitle("Hi").setWidth(612).setMaxHeight(1000).build />
<@modal id="Video_Intro" label="Video.modal.title"  parameters=componentParameters options=modalOptions />