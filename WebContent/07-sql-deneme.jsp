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

	<h2>JSTL sql :dateParam</h2>


	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/firmavt" user="root" password="" />

	<sql:query dataSource="${snapshot}" sql="SELECT * FROM personel"
		var="sorgu" />

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

	<%
		int secilenPersonelid = 3;
	%>

	<c:set var="parPersonelid" value="<%=secilenPersonelid%>" />
	<c:set var="parPersonelad" value="Muhammet" />
	<c:set var="parPersonelsoyad" value="mosayad" />
	<c:set var="parPersoneleposta" value="Mockeposta" />
	<c:set var="parPersonelegorev" value="Mockgorev" />
	<c:set var="parPersonelemaasi" value="20" />

	<sql:update dataSource="${snapshot}" var="silme_guncelleme">
		UPDATE personel 
		SET 
		personeladi = ?,
		personelsoyadi = ?,
		personeleposta = ?,
		personelgorev = ?,
		personelmaasi = ?
		WHERE idpersonel = ?
		
		<sql:param value="${parPersonelad}" />
		<sql:param value="${parPersonelsoyad}" />
		<sql:param value="${parPersoneleposta}" />
		<sql:param value="${parPersonelegorev}" />
		<sql:param value="${parPersonelemaasi}" />
		<sql:param value="${parPersonelid}" />
	</sql:update>

	<sql:query dataSource="${snapshot}" sql="SELECT * FROM personel"
		var="sorgu2" />

	<table border="1" width="100">
		<tr>
			<th>ID</th>
			<th>Adı</th>
			<th>Soyadı</th>
			<th>Eposta</th>
			<th>Görevi</th>
			<th>Maaşı</th>
			<th>Kayit Tarihi</th>
		</tr>

		<c:forEach var="satir2" items="${sorgu2.rows}">
			<!-- 	üstteki cümle satir satir kayitlari getiriyor -->

			<tr>
				<td><c:out value="${satir2.idpersonel}"></c:out></td>
				<td><c:out value="${satir2.personeladi}"></c:out></td>
				<td><c:out value="${satir2.personelsoyadi}"></c:out></td>
				<td><c:out value="${satir2.personeleposta}"></c:out></td>
				<td><c:out value="${satir2.personelgorev}"></c:out></td>
				<td><c:out value="${satir2.personelmaasi}"></c:out></td>
				<td><c:out value="${satir2.personelkayittarihi}"></c:out></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>