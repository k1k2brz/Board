<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<form action="Users" method="post">
	<P> 아아디: <input type="text" name="id" /> </P>
	<P> 비번: <input type="text" name="password" /> </P>
	<input type="submit" value="로그인" />
</form>
</body>
</html>
