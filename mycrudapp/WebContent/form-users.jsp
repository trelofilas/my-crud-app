<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
</head>
<style>
body {
  margin: 0;
  font-family: Verdana, Geneva, sans-serif;
  background-image: url('IMAGES/background.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
}

input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=date], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #333;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #D2691E;
}

div.container {
  opacity: 0.91;
  width: 1300px;
  border-radius: 10px;
  background-color: #f2f2f2;
  padding: 20px;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #FFF8DC;
  color: black;
}

.topnav a.active {
  background-color: #D2691E;
  color: white;
}
</style>
</head>
<body>

<div class="topnav">
  <a href="home">Home</a>
  <a class="active" href="new">Register new User</a>
  <a href="list">Display Users</a>
</div>

<div style="padding-left:16px">
  <h1>Register User</h1>
  
  <div class="container">
  
	<c:if test="${user != null}">
		<form action="update" method="post">
	</c:if>
	<c:if test="${user == null}">
		<form action="insert" method="post">
	</c:if>
		<caption>
            	<h2>
            		<c:if test="${user != null}">
            			Edit User
            		</c:if>
            		<c:if test="${user == null}">
            			Add New User
            		</c:if>
            	</h2>
        </caption>
        <c:if test="${user != null}">
        	<input type="hidden" name="id" value="<c:out value='${user.getId()}' />" />
        </c:if>
    	Firstname
    	<input type="text" name="firstname" value="<c:out value='${user.getFirstname()}' />" required>

    	Surname
    	<input type="text" name="surname" value="<c:out value='${user.getSurname()}' />" required>
		
    	Gender
    	<select name="gender" required>
      		<option value="Male" <c:if test="${user != null && user.getGender() == 'Male'}">selected</c:if>>Male</option>
      		<option value="Female" <c:if test="${user != null && user.getGender() == 'Female'}">selected</c:if>>Female</option>
      		<option value="Other" <c:if test="${user != null && user.getGender() == 'Other'}">selected</c:if>>Other</option>
    	</select>
    	<script>
    		$(function () {
        		$("#datepicker").datepicker({
        			dateFormat: 'dd-mm-yy',
        			showButtonPanel: true
        		});
    		});
		</script>
    	Birthdate
    	<input type="text" name="birthdate" id="datepicker" value="<c:out value='${user.getBirthdate()}' />" required>
    
    	Home Address
    	<input type="text" name="homeaddress" value="<c:out value='${user.getHomeAddress()}' />">

    	Work Address
    	<input type="text" name="workaddress" value="<c:out value='${user.getWorkAddress()}' />">

   		<input type="submit" value="Submit">
    
    	</form>
	</div>
	
</div>

</body>
</html>
