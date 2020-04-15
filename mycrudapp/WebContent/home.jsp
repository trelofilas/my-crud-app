<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  background-image: url('IMAGES/background.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
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
  <a class="active" href="">Home</a>
  <a href="new">Register new User</a>
  <a href="list">Display Users</a>
</div>

<div style="padding-left:16px">
  <h1>Welcome to my Web App</h1>
  <p>You can make basic CRUD operations</p>
</div>

</body>
</html>