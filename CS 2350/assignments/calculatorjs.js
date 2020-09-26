window.addEventListener("load", function(){
	
	var display = document.getElementById("display");
	var buttons = document.getElementsByClassName("number");
	var size=buttons.length;
	for(var i=0; i<size; i++){
		buttons[i].addEventListener("click", function(){
			display.value += this.value;
		})
		buttons[i].addEventListener("click", changeColor);
		buttons[i].addEventListener("blur", changeBack);
		buttons[i].addEventListener("mouseover", changeBackground);
		buttons[i].addEventListener("mouseout", changeBackgroundBack);
		
	}
	
	function changeColor(){
		var ID = this.id;
		document.getElementById(ID).style.borderColor = 'white';
	}
	
	function changeBack(){
		var ID = this.id;
		document.getElementById(ID).style.borderColor = 'black';
	} 
	
	function changeBackground(){
		var ID = this.id;
		document.getElementById(ID).style.backgroundColor = '#003594';
		document.getElementById(ID).style.color = 'white';
	}
	
	function changeBackgroundBack(){
		var ID = this.id;
		document.getElementById(ID).style.backgroundColor = '#869397';
		document.getElementById(ID).style.color = 'black';
	}
	
	document.getElementById("display").readOnly=true;
	
	function squareNumber(){
		display.value=eval(display.value);
		display.value=display.value*display.value;
	}
	document.getElementById("x2").addEventListener("click", squareNumber);
	
	function halfNumber(){
		display.value=eval(display.value)
		display.value=display.value/2;
	}
	document.getElementById("1/2").addEventListener("click", halfNumber);
	
	function areaOfCircle(){
		display.value=eval(display.value)
		tempNum = Math.PI*Math.pow(display.value, 2);
		display.value=tempNum.toFixed(2);
		//document.getElementById("area").style.borderColor = 'white';
	}
	document.getElementById("area").addEventListener("click", areaOfCircle);
	
	function erase(){
		display.value="";
	}
	document.getElementById("C").addEventListener("click", erase);
	
	function equals(){
		display.value=eval(display.value);
			try{
			if(display.value==isNaN);
			}
			catch(err){
				document.getElementById("display").innerHTML = "ERROR";
			}
	}
	document.getElementById("equal").addEventListener("click", equals);
		
})