<#if user.login="MilindS" && page.name="CategoryPage">
	<div id="heros">
		<div class="hero">
		   <div class="item">
				<div class="hero" style="background-color: #2C2A35;">
					<a href="#">     
						<img src="${asset.get("/html/assets/community_hero1440x300_v2.png")}" class="visible large">   
					</a>
				</div>
			</div>
		</div>
	</div>	
	<style>
		#heros {
		  background: #1678bd;
		  max-height: 450px;
		  overflow-y: hidden;
		  width: 100%;
		}
		.#heros .item {
		  float: left;
		  width: 100%;
		}
		#heros .item>div {
		  width: 100%;
		  text-align: center;
		}
		a{
		  color: #1678bd;
		  text-decoration: none;
		  overflow: hidden;
		}
		#heros .hero img.large {
    display: block;
    height: auto;
    margin: 0 auto;
    max-height: 450px;
    max-width: 1350px;
    width: 100%;
}
		img {
		  border: 0;
		}
	</style>
</#if>
<@liaBody />