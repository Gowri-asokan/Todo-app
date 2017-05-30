<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login page</title>
 <link rel="stylesheet" type="text/css" href="login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#error_email").hide();
	$("#error_password").hide();
	
	var email=false;
	var password=false;
	
	$("#form_email_id").focusout(function(){
		check_email();
		
	});

	$("#form_password_id").focusout(function(){
		check_password();
		
	});
	function isEmailAddress(str) {
		   var pattern = /^(([\w]+:)?\/\/)?(([\d\w]|%[a-fA-f\d]{2,2})+(:([\d\w]|%[a-fA-f\d]{2,2})+)?@)?([\d\w][-\d\w]{0,253}[\d\w]\.)+[\w]{2,4}(:[\d]+)?(\/([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)*(\?(&?([-+_~.\d\w]|%[a-fA-f\d]{2,2})=?)*)?(#([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)?$/;
		   return pattern.test(str);  // returns a boolean 
	}

	
	 function check_email()
	 {
		 
		 var enteredEmailAddress = $("#form_email_id").val();
		 alert(isEmailAddress(enteredEmailAddress));
		 
		
		if(isEmailAddress(enteredEmailAddress))
		     {
		
			$("#error_email").hide();
			$("#form_email_id").css("border","2px solid #f9f9f9");
			
		     }else
		     {
			$("#error_email").html("Invalid Email address");
			$("#error_email").show();
			$("#error_email").css("color","red");
			$("#form_email_id").css("border","2px solid red");
			email=true;
	
		} 
		
	}
	
	function check_password()
	{
		
		var password_length = $("#form_password_id").val().length;
		if(password_length <8) 
		{
			$("#error_password").html("At least 8 characters");
			$("#error_password").show();
			$("#error_password").css("color","red");
			$("#form_password_id").css("border","2px solid red");
			password= true;
		}
		else
		   {
			$("#form_password_id").css("border","2px solid #f9f9f9");
			
			$("#error_password").hide();
		    }
    
	}
	$('form.login_form').on ('submit', function()
			{
		    email= false;
			 password = false;
			
			 check_email();
			 check_password();
			
			 
			 if(email == false && password == false)
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
<!--  <style>
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
margin:130px auto;
width:400px;
height:350px;
padding:25px;
background:#f9f9f9;
text-align:center;
border:1px solid #c4c6ca;
box-shadow: 5px 5px 5px #888888;
}
#content:before,
#content:after{
      
position:absolute;
content:"";
width:100%;
height:100%;
background:#f9f9f9;
border:1px solid #c4c6ca;
box-shadow: 10px 10px 10px #888888;
left:-1px;
top:0;
}
#content:before{
transform:rotate(2deg);
z-index:-1;
}
#content:after{
transform:rotate(-3deg);
z-index:-2;
}
.wrapper{
width:300px;
height:45px;

margin: 30px auto;
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
margin:35px;
}
inout[type="submit"]:hover
{
color:white;
}
.errortext
{
	display: inline-block;
}

</style> -->
</head>

<body>
<h1><center>Login Page</center></h1>
<div class="container">
<section id="content">
<form id="login_form" action="/LoginpageServlet" method="post" class="login_form">
 <p><%=request.getAttribute("name") %></p> 
<div class="wrapper">
<input type="text" placeholder= "Email" name="emailaddress" class="formtext" id="form_email_id"/><span class="errortext"  id="error_email"> </span>
</div>
<div class="wrapper">
<i class="fa-envelope"></i>
<input type="password" placeholder= "password" name="loginpassword" class="formtext" id="form_password_id"/> <span class="errortext" id="error_password"></span>
</div>
<div>
<input type="submit" value="Log In"/>
</div>
<div>
<a href="signup.html">New User SIGNUP</a>
</div>
</form>
</section>
</div>
</body>
</html>