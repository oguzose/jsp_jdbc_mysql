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

	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/firmavt" user="root" password="" />

	<sql:query dataSource="${snapshot}" sql="Select * from personel"
		var="sorgu" />
	<h2>İLK KAYİT</h2>
	<table border="1" width="100">
		<tr>
			<th>ID</th>
			<th>Adı</th>
			<th>Soyadı</th>
			<th>Eposta</th>
			<th>Görevi</th>
			<th>Maaşı</th>
		</tr>

		<c:forEach var="satir" items="${sorgu.rows}">
			<!-- 	üstteki cümle satir satir kayitlari getiriyor -->

			<tr>
				<td><c:out value="${satir.idpersonel}"></c:out></td>
				<td><c:out value="${satir.personeladi}"></c:out></td>
				<td><c:out value="${satir.personelsoyadi}"></c:out></td>
				<td><c:out value="${satir.personeleposta}"></c:out></td>
				<td><c:out value="${satir.personelgorev}"></c:out></td>
				<td><c:out value="${satir.personelmaasi}"></c:out></td>
			</tr>
		</c:forEach>
	</table>

	<c:set var="parametre1" value="14" />

	<sql:update dataSource="${snapshot}" var="silme_guncelleme">
		DELETE FROM `firmavt`.`personel` WHERE idpersonel = ?;
		<sql:param value="${parametre1}"></sql:param>
	</sql:update>

	<sql:query dataSource="${snapshot}" var="sorgu2">
		SELECT *FROM personel;
	</sql:query>

	<table border="1" width="100">
		<tr>
			<th>ID</th>
			<th>Adı</th>
			<th>Soyadı</th>
			<th>Eposta</th>
			<th>Görevi</th>
			<th>Maaşı</th>
		</tr>

		<c:forEach var="satir" items="${sorgu2.rows}">
			<!-- 	üstteki cümle satir satir kayitlari getiriyor -->

			<tr>
				<td><c:out value="${satir.idpersonel}"></c:out></td>
				<td><c:out value="${satir.personeladi}"></c:out></td>
				<td><c:out value="${satir.personelsoyadi}"></c:out></td>
				<td><c:out value="${satir.personeleposta}"></c:out></td>
				<td><c:out value="${satir.personelgorev}"></c:out></td>
				<td><c:out value="${satir.personelmaasi}"></c:out></td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>