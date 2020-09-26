window.addEventListener("load", function(){
			
		document.getElementById("submit").addEventListener("click", function(event){
			var error = false;
			var file;
			var pattern;
			var textEntered;
			
			//when signing is checked
				window.addEventListener("load", function(){
			
		document.getElementById("submit").addEventListener("click", function(event){
			var error = false;
			var file;
			var pattern;
			var textEntered;
			
			//when signing is checked
					
					file = document.getElementById("audio").value;
					pattern = /.+\.(mp3|wav)$/i;
					
					if(file == ""){
						error = true;
						document.getElementById("audioMsg").innerHTML = "Must upload a file";
					}
					
					else if(pattern.test(file)){
						document.getElementById("audioMsg").innerHTML = "";
					}
					
					else{
						error = true;
						document.getElementById("audioMsg").innerHTML = "Must be an .mp3 or .wav";
					}
			//when cutest is checked
				
				file = document.getElementById("picture1").value;
				pattern = /.+\.(jpg|png|gif)$/i;
				if(file == ""){
					error = true;
					document.getElementById("cuteMsg").innerHTML = "Must upload a file";
				}
				
				else if(pattern.test(file)){
					document.getElementById("cuteMsg").innerHTML = "";
				}
				
				else{
					error = true;
					document.getElementById("cuteMsg").innerHTML = "Must be a .jpg, .png, or .gif";
				}
			//when trick is checked
			
			//check the birthdate box
			pattern = /[0-9][0-9]\/[0-9][0-9]\/[0-9][0-9]/
			textEntered = document.getElementById("petBirthDate").value;
			
			if(textEntered == ""){
				error = true;
				document.getElementById("birthMsg").innerHTML = "You must enter your birthdate";
			}
			else if(pattern.test(textEntered)){
				document.getElementById("birthMsg").innerHTML = "";
			}
			else{
				error = true;
				document.getElementById("birthMsg").innerHTML = "Invalid birthdate";
			}
			
			//check if the phone number is correct
			pattern = /[2-9][0-9][0-9]\-[2-9][0-9][0-9]\-[0-9][0-9][0-9][0-9]$/;
			textEntered=document.getElementById("phoneNumber").value;
			
			if(textEntered == ""){
				error = true;
				document.getElementById("phoneMsg").innerHTML = "You must enter your phonenumber";
			}
			else if(pattern.test(textEntered)){
				document.getElementById("phoneMsg").innerHTML = "";
			}
			else{
				error = true;
				document.getElementById("phoneMsg").innerHTML = "Invalid phonenumber";
			}
			
			//check username
			pattern = /[a-zA-Z]{5,8}/;
			textEntered = document.getElementById("username").value;
			
			if(textEntered == ""){
				error = true;
				document.getElementById("userMsg").innerHTML = "You must enter your username";
			}
			else if(pattern.test(textEntered)){
				document.getElementById("userMsg").innerHTML = "";
			}
			else{
				error = true;
				document.getElementById("userMsg").innerHTML = "Invalid username";
			}
			
			//check password
			pattern = /.{8,}/;
			textEntered = document.getElementById("secret").value;
			var pattern2 = /[a-zA-z]/;
			var pattern3 = /\d/;
			var pattern4 = /[#$%^&*`~]/;
			var matchCount = 0;
			
			if(pattern.test(textEntered)){
				if(pattern2.test(textEntered)){
					matchCount++;
				}
				if(pattern3.test(textEntered)){
					matchCount++;
				}
				if(pattern4.test(textEntered)){
					matchCount++;
				}
				if(matchCount<2){
					error = true;
					document.getElementById("secretMsg").innerHTML = "Password is not secure enough";
				}
			}
			else{
				error = true;
				document.getElementById("secretMsg").innerHTML = "Password not long enough";
			}
			
			
			
			
			if(error){
				event.preventDefault();
			}
		})
})
					file = document.getElementById("audio").value;
					pattern = /.+\.(mp3|wav)$/i;
					
					if(file == ""){
						error = true;
						document.getElementById("audioMsg").innerHTML = "Must upload a file";
					}
					
					else if(pattern.test(file)){
						document.getElementById("audioMsg").innerHTML = "";
					}
					
					else{
						error = true;
						document.getElementById("audioMsg").innerHTML = "Must be an .mp3 or .wav";
					}
					
			//when cutest is checked
				
				file = document.getElementById("picture1").value;
				pattern = /.+\.(jpg|png|gif)$/i;
				if(file == ""){
					error = true;
					document.getElementById("cuteMsg").innerHTML = "Must upload a file";
				}
				
				else if(pattern.test(file)){
					document.getElementById("cuteMsg").innerHTML = "";
				}
				
				else{
					error = true;
					document.getElementById("cuteMsg").innerHTML = "Must be a .jpg, .png, or .gif";
				}
			//when trick is checked
			
			//check the birthdate box
			pattern = /[0-9][0-9]\/[0-9][0-9]\/[0-9][0-9]/
			textEntered = document.getElementById("petBirthDate").value;
			
			if(textEntered == ""){
				error = true;
				document.getElementById("birthMsg").innerHTML = "You must enter your birthdate";
			}
			else if(pattern.test(textEntered)){
				document.getElementById("birthMsg").innerHTML = "";
			}
			else{
				error = true;
				document.getElementById("birthMsg").innerHTML = "Invalid birthdate";
			}
			
			//check if the phone number is correct
			pattern = /[2-9][0-9][0-9]\-[2-9][0-9][0-9]\-[0-9][0-9][0-9][0-9]$/;
			textEntered=document.getElementById("phoneNumber").value;
			
			if(textEntered == ""){
				error = true;
				document.getElementById("phoneMsg").innerHTML = "You must enter your phonenumber";
			}
			else if(pattern.test(textEntered)){
				document.getElementById("phoneMsg").innerHTML = "";
			}
			else{
				error = true;
				document.getElementById("phoneMsg").innerHTML = "Invalid phonenumber";
			}
			
			//check username
			pattern = /[a-zA-Z]{5,8}/;
			textEntered = document.getElementById("username").value;
			
			if(textEntered == ""){
				error = true;
				document.getElementById("userMsg").innerHTML = "You must enter your username";
			}
			else if(pattern.test(textEntered)){
				document.getElementById("userMsg").innerHTML = "";
			}
			else{
				error = true;
				document.getElementById("userMsg").innerHTML = "Invalid username";
			}
			
			//check password
			pattern = /.{8,}/;
			textEntered = document.getElementById("secret").value;
			var pattern2 = /[a-zA-z]/;
			var pattern3 = /\d/;
			var pattern4 = /[#$%^&*`~]/;
			var matchCount = 0;
			
			if(pattern.test(textEntered)){
				if(pattern2.test(textEntered)){
					matchCount++;
				}
				if(pattern3.test(textEntered)){
					matchCount++;
				}
				if(pattern4.test(textEntered)){
					matchCount++;
				}
				if(matchCount<2){
					error = true;
					document.getElementById("secretMsg").innerHTML = "Password is not secure enough";
				}
			}
			else{
				error = true;
				document.getElementById("secretMsg").innerHTML = "Password not long enough";
			}
			
			
			if(error){
				event.preventDefault();
			}
		})
})