<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">

<title>선수수정</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>

<section>
<h1>선수 수정</h1>
<%
request.setCharacterEncoding("UTF-8");
String pid = request.getParameter("pid");
String pname = request.getParameter("pname");
String pposition = request.getParameter("pposition");
String pdate = request.getParameter("pdate");
String pgrade = request.getParameter("pgrade");
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		String sql = "select * from giants_player where pid = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pid);
		pstmt.executeUpdate();
%>
<form method="post" action="m-action.jsp" name="frm">
	<table border="1">
		<tr>
			<td>선수번호</td>
			<td><input type="text" readonly name="pid" value=<%=pid %>></td>
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
				<input type="button" value="수정" onclick="modifing()">
				<input type="reset" value="취소" onclick="return alert('취소함 ㅅㄱ')">
			</td>
		</tr>
	</table>
</form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>