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

	<%@ page import="java.util.Date, java.text.*"%>

	<%
		Date tarih = new Date("1453/05/29");
		Date zaman = new Date();
		int secilenPersonelid = 3;

		System.out.println("Konsolda zaman" + zaman);
	%>

	Web sayfasında zaman 1:
	<%=zaman%>
	<br> Web sayfasında zaman 2:
	<%
		out.println(String.valueOf(zaman));
	%>

	<c:set var="parametrePersonelid" value="<%=secilenPersonelid%>" />

	<sql:update dataSource="${snapshot}" var="silme_guncelleme">
		UPDATE personel 
		SET personelkayittarihi = ? 
		WHERE idpersonel = ?;
		
		<sql:dateParam value="<%=tarih%>" type="DATE" />
		<sql:param value="${parametrePersonelid}" />
	</sql:update>
	
	<!-- yukardaki ? li yerler parametre bekliyor demektir.
	Yine yukardaki paramatreler ise soru işaretleri olan yere sırası ile gelir -->

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