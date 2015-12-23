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

	<sql:query var="sorgu" dataSource="${snapshot}">
			SELECT *FROM personel WHERE idpersonel = ?
			<sql:param value="${param.personelidPar}"></sql:param>
	</sql:query>

	<table border="2">
		<tr>
			<c:forEach var="kolonBasligi" items="${sorgu.columnNames}">
				<td><c:out value="${kolonBasligi}"></c:out></td>
			</c:forEach>
		</tr>
		<!-- yukarıdaki satır sütün başlıklarını getirir -->

		<c:forEach var="satir" items="${sorgu.rowsByIndex}">
			<tr>
				<c:forEach var="kolon" items="${satir}">
					<td><c:out value="${kolon}"></c:out></td>
				</c:forEach>
			</tr>
		</c:forEach>

	</table>

	<hr>

	<c:set var="row2" scope="request" value="${sorgu.rows[0]}"></c:set>

	<table border="1" width="500" align="left">

		<thead>
			<tr>
				<th>Personel Bilgileri</th>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td>ID</td>
				<td>${row2.idpersonel}</td>
			</tr>

			<tr>
				<td>Adı Soyadı:</td>
				<td>${row2.personeladi} ${row2.personelsoyadi}</td>
			</tr>

			<tr>
				<td>Görevi</td>
				<td>${row2.personelgorev}</td>
			</tr>
			<tr>
				<td>E posta </td>
				<td>${row2.personeleposta}</td>
			</tr>
			<tr>
				<td>Maas</td>
				<td>${row2.personelmaasi}</td>
			</tr>
		</tbody>
	</table>

</body>
</html>