<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page import="java.io.*, java.util.*, java.sql.*"%>
<%@page import="javax.servlet.http.*, javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>JSTL sql : setDataSource Tag</h2>

	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/firmavt" user="root" password="" />

	<sql:query dataSource="${snapshot}" sql="Select * from personel"
		var="result" />

<%-- 	<sql:query dataSource="${snapshot}" var="result"> --%>
<%-- 	</sql:query> --%>

</body>
</html>