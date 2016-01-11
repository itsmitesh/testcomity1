<#-- <#assign str = "this is-a test-string+*for testing + replce+function"?replace("^[ ]+", "", "r") /> -->



<#assign str = "this is-a test-string+*for testing + replce+function"?replace('[^\\w-]+','','r')?trim />

${str}