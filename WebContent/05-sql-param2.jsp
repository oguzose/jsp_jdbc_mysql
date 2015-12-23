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

	<%-- 	<sql:query dataSource="${snapshot}" sql="SELECT * FROM personel" --%>
	<%-- 		var="sorgu" /> --%>

	<sql:query var="sorgu" dataSource="${snapshot}">
	
		SELECT personel.idpersonel,
	    personel.personeladi,
	    personel.personelsoyadi,
	    personel.personeleposta,
	    personel.personelgorev,
	    personel.personelmaasi
		FROM firmavt.personel;
		
	</sql:query>

	<table border="1" align="center" cellpadding="3">
		<tr>
			<td>Bu sayfadan diğer sayfaya göndereceğiz</td>
		</tr>
		<tr>
			<td>
				<form action="05-sql-param2Cevap.jsp">
					Personel adi soyadi: <select name="personelidPar">
						<c:forEach var="adiSoyadiDegerleri" items="${sorgu.rows}">
							<option value="${adiSoyadiDegerleri.idpersonel}">
								${adiSoyadiDegerleri.personeladi}
								${adiSoyadiDegerleri.personelsoyadi}</option>
						</c:forEach>
					</select>
					<input type="submit" value="gonder">
				</form>
			</td>
		</tr>
	</table>

</body>
</html>