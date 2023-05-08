<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">

<script type="text/javascript" src="check.js"></script>
<title>선수등록</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section>
<h1>선수 등록</h1>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		String sql = "select max(pid) + 1 from giants_player";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
%>
<form method="post" action="action.jsp" name="frm">
	<table border="1">
		<tr>
			<td>선수이름</td>
			<td><input type="text" readonly name="pid" value="<%=rs.getInt(1)%>"></td>
		</tr>
		<%
	
} catch(Exception e) {
	e.printStackTrace();
}
		%>
		
		<tr>
			<td>선수이름</td>
			<td><input type="text" name="pname"></td>
		</tr>
		
		<tr>
			<td>선수포지션</td>
			<td>
				<select name="pposition">
					<option>=== 포지션 선택 ===</option>
					<option value="투수">투수</option>
					<option value="내야수">내야수</option>
					<option value="외야수">외야수</option>
					<option value="포수">포수</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>선수등록일</td>
			<td><input type="text" name="pdate"></td>
		</tr>
		
		<tr>
			<td>선수등급</td>
			<td>
				<input type="radio" value="S" name="pgrade">S
				<input type="radio" value="A" name="pgrade">A
				<input type="radio" value="B" name="pgrade">B
				<input type="radio" value="C" name="pgrade">C
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<input type="button" value="등록" onclick="checking()">
				<input type="reset" value="다시 써 임마" onclick="return alert('정보 지움 ㅅㄱ')">
			</td>
		</tr>
	</table>
</form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>