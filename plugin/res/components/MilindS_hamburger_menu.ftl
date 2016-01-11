<style>
.mobile-menu {
  position: fixed;
  top: 0;
  right: 0;
  opacity: 0;
  display: block;
  width: 240px;
  height: 100%;
  color: #fff;
  background-color: #34bc9d;
  z-index: -100;
  overflow-y: scroll;
  -webkit-overflow-scrolling: touch
}

.mobile-menu .mobile-menu-inner {
  width: 200px;
  padding: 20px 20px 60px
}

.mobile-menu ul {
  margin: 0 0 25px;
  padding: 0
}

.mobile-menu ul li {
  list-style: none;
  padding: 10px 0;
    text-align: left;

}

.hamburger {
  position: fixed;
  top: 0;
  right: 0;
  float: right;
  margin: 10px;
  padding: 10px 10px 9px;
  cursor: pointer;
  z-index: 99999;
  display: block
}

.hamburger .hamburger-inner {
  position: relative;
  height: 21px;
  width: 25px;
  display: block;
  overflow: hidden;
  margin: 0;
  padding: 0
}

.hamburger .bar {
  width: 25px;
  height: 3px;
  background: #000;
  position: absolute;
  top: 0
}

.hamburger .bar.bar2,
.hamburger .bar.bar3 { top: 9px }

.hamburger .bar.bar4 { top: 18px }

.hamburger.open .bar1,
.hamburger.open .bar4 { display: none }

.hamburger.open .bar2,
.hamburger.open .bar3 { height: 4px }
</style>
<div class="hamburger">
  	<div class="hamburger-inner">
  		<div class="bar bar1 hide"></div>
  		<div class="bar bar2 cross"></div>
  		<div class="bar bar3 cross hidden"></div>
  		<div class="bar bar4 hide"></div>
  	</div>
  </div>
  <div class="mobile-menu">
  <div class="mobile-menu-inner">
    <ul>
      <li>Home</li>
      <li>Services</li>
      <li>Works</li>
      <li>Showcase</li>
      <li>About</li>
    </ul>
  </div>
</div>

  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.15.0/TweenMax.min.js"></script>
<script src='${asset.get("/html/assets/jv-jquery-mobile-menu-min.js")}'></script>
<script src='${asset.get("/html/assets/script.js")}'></script>