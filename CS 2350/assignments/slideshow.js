window.addEventListener("load", addListeners);
var images = new Array("images/prescott.jpg", "images/elliot.jpg", "images/bryant.jpg", "images/irving.jpg", "images/beasley.jpg", "images/witten.jpg", "images/lee.jpg");
var captions = new Array("Dak Prescott QB 4", "Ezekiel Elliot RB 21", "Dez Bryant WR 88", "David Irving DE 95", "Cole Beasley WR 11", "Jason Witten TE 82", "Sean Lee LB 50");
var index = 0;
var timer;

function pauseSlideShow(){
	clearInterval(timer);
}

function addListeners(){
	document.getElementById("previous").addEventListener("click", function(){
		--index;
		if(index==-1){
			index=6;}
	document.getElementById("picture").src = images[index];
	document.getElementById("caption").innerHTML = captions[index]});
	
	document.getElementById("next").addEventListener("click", changeImage);
	document.getElementById("play").addEventListener("click", function(){timer = setInterval("changeImage()", 1000);});
	document.getElementById("pause").addEventListener("click", pauseSlideShow);
}

function changeImage(){
	index++;
	if(index==images.length)
		index=0;
	document.getElementById("picture").src = images[index];
	document.getElementById("caption").innerHTML = captions[index];
}