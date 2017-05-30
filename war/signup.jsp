<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#error_username_msg").hide();
	$("#error_email_msg").hide();
	$("#error_password_msg").hide();
	$("#error_conformpassword_msg").hide();
	
	var username= false;
	var email=false;
	var password=false;
	var conformpassword=false;
	
	
	$("#form_username").focusout(function(){
		check_username();
		
	});

	$("#form_email").focusout(function(){
		check_email();
		
	});

	$("#form_password").focusout(function(){
		check_password();
		
	});

	$("#form_conformpassword").focusout(function(){
		check_conformpassword();
		
	});
	
	
	function check_username()
	{
		
		var username_length = $("#form_username").val().length;
		if(username_length < 5 || username_length > 20)
		  {
		$("#error_username_msg").html("should enter the values greater than 5 and less than 20");
		$("#error_username_msg").show();
		$("#error_username_msg").css("color","red");
		$("#form_username").css("border","2px solid red");
		
		username = true;	
		   }
		else
			{
			$("#error_username_msg").hide();
			$("#form_username").css("border","2px solid #f9f9f9");
			
			}
	}
	
	
	function isEmailAddress(str) {
		   var pattern = /^(([\w]+:)?\/\/)?(([\d\w]|%[a-fA-f\d]{2,2})+(:([\d\w]|%[a-fA-f\d]{2,2})+)?@)?([\d\w][-\d\w]{0,253}[\d\w]\.)+[\w]{2,4}(:[\d]+)?(\/([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)*(\?(&?([-+_~.\d\w]|%[a-fA-f\d]{2,2})=?)*)?(#([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)?$/;
		   return pattern.test(str);  // returns a boolean 
	}

	
	 function check_email()
	 {
		 
		 var enteredEmailAddress = $("#form_email").val();
		 alert(isEmailAddress(enteredEmailAddress));
		 
		
		if(isEmailAddress(enteredEmailAddress))
		     {
		
			$("#error_email_msg").hide();
			$("#form_email").css("border","2px solid #f9f9f9");
			
		     }else
		     {
			$("#error_email_msg").html("Invalid Email address");
			$("#error_email_msg").show();
			$("#error_email_msg").css("color","red");
			$("#form_email").css("border","2px solid red");
			email=true;
	
		} 
		
	}
	
	function check_password()
	{
		
		var password_length = $("#form_password").val().length;
		if(password_length <8) 
		{
			$("#error_password_msg").html("At least 8 characters");
			$("#error_password_msg").show();
			$("#error_password_msg").css("color","red");
			$("#form_password").css("border","2px solid red");
			password= true;
		}
		else
		   {
			$("#form_password").css("border","2px solid #f9f9f9");
			
			$("#error_password_msg").hide();
		    }
        $("#showpassword").click(function()
        	{
        	var test =  $("#form_password").val();
        	console.log(test);
        	if(!test == ""){
        		$("#form_password").attr('type', $(this).is(':checked')? 'text' : 'password');	
        	}
        	else{
        		console.log("inside");
        		$('#form_password').attr('checked', false);
        	}
			
			
			});
	}
	
	function check_conformpassword()
	{
		var password = $("#form_password").val();
		var conformpassword = $("#form_conformpassword").val();
		
	
		if(password === conformpassword)
		{
			$("#error_conformpassword_msg").hide();
		}
		else
		{
			$("#error_conformpassword_msg").html("password don't match");
			$("#error_conformpassword_msg").show();
			$("#error_conformpassword_msg").css("color", "red");
			$("#form_conformpassword").css("border","2px solid red");
			conformpassword= true;
		}
		
	}
	
		   	
$('form.signup_form').on ('submit', function()
		{
	
	//alert("Insert all the values correctly");
		 username = false;
		 email= false;
		 password = false;
		 conformpassword = false;
		 
		 check_username();
		 check_email();
		 check_password();
		 check_conformpassword();
		 
		 if(username == false && email == false && password == false && conformpassword == false)
			 {
			alert("inserted");
			 return true;
			 }
		 else{
			 alert("Insert all the values correctly");
			 return false;
		 }
		
		
	});
});

</script>
<style>
body{
background:#27c3bb;
position:relative;
}
h1{
background:#DAECE9;
font-size:25px;
height:50px;
line-height:45px;
}
.container{
margin:25px auto;
position:relative;

}
#content{
position: relative;
margin:90px auto;
width:600px;
height:500px;
padding:25px;
background:#f9f9f9;
text-align:center;
border:1px solid #c4c6ca;
box-shadow: 10px 10px 10px #888888;
}
.wrapper{
width:300px;
height:45px;

margin:45px auto;
margin-bottom: 10px;
border:1px solid gainsboro;
border-radius: 5px;
background:white;
box-shadow:inset 0 0 8px #000000;
}

.wrapper input{
width:300px;
height:45px;
background:transparent;
border:gray;
outline:none;
font-size:16px;
font-family:Arial;
color: #333;
}

input[type="submit"]
{
width:150px;
height:40px;
border-radius:40px;
border:0px;
outline:none;
background:#27c3bb;
font-size:16px;
margin:25px;
}
.errortext
{
	display: inline-block;
}
#showpassword{
	display: inline-block;
}
</style>
</head>

<body>
<h1><center>SignIn Page</center></h1>
<div class="container">
  <section id="content">
   <form id="signupform" action="/SignupServlet" method="post" class="signup_form">
<div class="wrapper">
    <input type="text" placeholder= "Username" name= "username" class="formtext" id="form_username"/><span class="errortext"  id="error_username_msg"></span>
</div>
<div class="wrapper">
	<input type="text" placeholder= "Email" name="email" class="formtext" id="form_email"/> <span class="errortext"  id="error_email_msg"> </span>
</div>
<div class="wrapper">
	<input type="password" placeholder= "password" name="password" class="formtext" id="form_password"/> 
	<input type="checkbox" id="showpassword"/> <span class="errortext" id="error_password_msg"> </span>
</div><br>
	<div class="wrapper">
			<input type="password" placeholder= "conform password" class="formtext" id="form_conformpassword"/> 
			<span class="errortext" id="error_conformpassword_msg"></span>
	</div>
<input type="submit" value="Sign Up" id="registrationform"/>
</form>
</section>
</div>
</body>