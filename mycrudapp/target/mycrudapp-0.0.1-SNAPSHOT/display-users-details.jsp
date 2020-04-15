<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  margin: 0;
  font-family: Verdana, Geneva, sans-serif;
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
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 80%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>

<div class="topnav">
  <a href="">Home</a>
  <a href="new">Register new User</a>
  <a class="active" href="list">Display Users</a>
</div>

<div style="padding-left:16px">
	<h1>User Details</h1>
	<table>
            <caption></caption>
            <tr>
                <th>Firstname</th>
                <th>Surname</th>
                <th>Gender</th>
                <th>Birthdate</th>
                <th>Home Address</th>
                <th>Work Address</th>
                <th>Actions</th>
            </tr>
            <tr>
            	<td><c:out value="${user.getFirstname()}" /></td>
                <td><c:out value="${user.getSurname()}" /></td>
                <td><c:out value="${user.getGender()}" /></td>
                <td><c:out value="${user.getBirthdate()}" /></td>
                <td><c:out value="${user.getHomeAddress()}" /></td>
                <td><c:out value="${user.getWorkAddress()}" /></td>            
                <td>
                	<a href="edit?id=<c:out value='${user.getId()}' />">Edit</a>
                   	&nbsp;&nbsp;&nbsp;&nbsp;
                   	<a href="delete?id=<c:out value='${user.getId()}' />">Delete</a>                    	
                </td>
             </tr>
     </table>
</div>
</body>
</html>