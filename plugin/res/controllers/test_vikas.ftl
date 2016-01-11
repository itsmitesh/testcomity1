		<#assign baseURL = "https://api.ooyala.com/v2/assets?api_key=prN246o5_Os0DbHd6SO7AXbUJNDY.LvRiP&signature=Gak5CCY2GkSoaaGsUqh45nSDT5r3Vq0Yo2%2BbnLk1q28&expires=1435752276" />
		
		<#assign http_response = http.client.request("https://api.ooyala.com/v2/assets").parameter('expires','1435752276').parameter('signature','Gak5CCY2GkSoaaGsUqh45nSDT5r3Vq0Yo2%2BbnLk1q28').parameter('api_key','prN246o5_Os0DbHd6SO7AXbUJNDY.LvRiP').json() />
		
		<#if http_response.hasError>
			error
			${http_response.error.message}
		<#else>
			success
			${http_response.content}
			<#assign json_response = http_response.content?eval />

		</#if>