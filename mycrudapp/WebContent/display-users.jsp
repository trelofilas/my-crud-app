<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<h1>Display Users</h1>
	<table>
    	<tr>
        	<th>Firstname</th>
            <th>Surname</th>
            <th>Action</th>
    	</tr>
        <c:forEach items="${listUser}" var="user" >
        	<tr>
            	<td><c:out value="${user.getFirstname()}" /></td>
                <td><c:out value="${user.getSurname()}" /></td>
                <td> 
                	<a href="details?id=<c:out value='${user.getId()}' />">Details</a>
                </td>
            </tr>
        </c:forEach>
	</table>
</div>
</body>
</html>