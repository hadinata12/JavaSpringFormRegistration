<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Form ${message}</title>
        <script> 
            function cekno(no){
               var xmlHttp = new XMLHttpRequest();
               xmlHttp.open( "GET", 'http://localhost:8084/RegistrationForm/getmobileno/'+no, false ); // false for synchronous request
               xmlHttp.send( null );
                  
               if(xmlHttp.responseText === 'false'){
                 return false;
               }else{
                   return true;
               }
            }
            
            function cekemail(email){
               var xmlHttp = new XMLHttpRequest();
               xmlHttp.open( "GET", 'http://localhost:8084/RegistrationForm/getemail/'+email, false ); // false for synchronous request
               xmlHttp.send( null );
                  
               if(xmlHttp.responseText === 'false'){
                 return false;
               }else{
                   return true;
               }
            }
            
            function validateForm() {
              var mno = document.forms["commentForm"]["mobileno"].value;
              var fname = document.forms["commentForm"]["firstname"].value;
              var lname = document.forms["commentForm"]["lastname"].value;
              var email = document.forms["commentForm"]["email"].value;
              
              var date = document.forms["commentForm"]["dateofbirth"].value;
              var date_regex = /^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
              
              if (mno == "") {
                document.getElementById('errmnumber').innerHTML = "Please fill value";
                return false;
              }else if(fname == ""){
                document.getElementById('errfname').innerHTML = "Please fill value";
                return false;
              }else if(lname == ""){
                document.getElementById('errlname').innerHTML = "Please fill value";
                return false;
              }else if(email == ""){
                document.getElementById('erremail').innerHTML = "Please fill value";
                return false;
              }else if(cekno(mno)== false){
                document.getElementById('errmnumber').innerHTML = "This number already in use";
                return false;
              }else if(cekemail(email)== false){
                document.getElementById('erremail').innerHTML = "This email already in use";
                return false;
              }if(date != ""){
                if (!(date_regex.test(date))) {
                    document.getElementById('errdate').innerHTML = "Inputvalid date";
                    return false;
                }
              }
              
            } 
            
            
       </script>
        <style>
            .error{
                color:red;
            }
            #main{
                width: 40%;margin: 0 auto;font-family: arial;font-size: 13px;
                
            }
            #main legend{
                font-weight: bold;
            }
            #main fieldset{
                border: 1px solid #cccccc;
            }
            
        </style>
   </head>

    <body>
        <h1>Home page: ${pageContext.request.contextPath}</h1>
        <div id="main">
	<form class="cmxform" name="commentForm" method="post" onsubmit="return validateForm()" action="addUser">
		<fieldset>
			<legend>Registration User</legend>
			<p>
				<label for="mnumber">Mobile Number (required)</label>
				<input id="mnumber" name="mobileno" type="number" />
                                <div id="errmnumber" class="error"> </div>
			</p>
		
			<p>
				<label for="fname">First Name (required)</label>
				<input id="fname" name="firstname" type="text" />
                                <div id="errfname" class="error"> </div>
			</p>
			<p>
				<label for="lname">Last Name (required)</label>
				<input id="lname" type="text" name="lastname">
                                <div id="errlname" class="error"> </div>
			</p>
			<p>
				<label for="datebirth">Date of birth (optional)</label>
				<input id="datebirth" name="dateofbirth" />
                                <div id="errdate" class="error"> </div>
			</p>
			<p>
				<label for="gender">Gender(optional)</label>
				<input type="radio" id="gender" name="gender" value="male"> Male
				<input type="radio" id="gender" name="gender" value="female"> Female
			</p>
		
			<p>
				<label for="email">Email (required)</label>
				<input id="email" type="email" name="email">
                                <div id="erremail" class="error"> </div>
			</p>
			<p>
				<input class="submit" id="submit" type="submit" name="submit" value="Register">
                              	<input style="width:100px;visibility:hidden;" 
					id="login" type="button" value="LOGIN" />
                	
                        </p>
                      	
			

			
		</fieldset>
	</form>
	
</div>
      
   <c:set var="nm" value="${message}"/>
<c:if test="${(nm == '1')}">
<script> 
    
    document.getElementById('login').style.visibility = 'visible'; 
    document.getElementById("mnumber").disabled = true;
    document.getElementById("fname").disabled = true;
    document.getElementById("lname").disabled = true;
    document.getElementById("datebirth").disabled = true;
    document.getElementById("gender").disabled = true;
    document.getElementById("email").disabled = true;
    document.getElementById("submit").disabled = true;
    
</script>
</c:if>
      
    </body>
</html>
