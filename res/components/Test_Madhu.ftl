<#assign screencastBaseURL = "screencast.autodesk.com" />
<#assign screencastBaseURLnew = "knowledge.autodesk.com/community/screencast" />


<@liaAddScript>
var screencastBaseURL = "${screencastBaseURL}";
  inputString = "https://knowledge.autodesk.com/community/screencast/8a4fc390-2cc7-4b76-ad1c-16fef27bc5ad";
var toMatch = new RegExp("(^( (https|http)://("+screencastBaseURL+"|"+screencastBaseURLnew+")/ ){1})");
  if(toMatch.test(inputString)){
              console.log("matched");
            }
  else{
  	console.log("not matched");
  }
</@liaAddScript>