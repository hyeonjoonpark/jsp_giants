<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String pid = request.getParameter("pid");
try {
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
String sql = "delete from giants_player where pid = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, pid);
pstmt.executeUpdate();
} catch (Exception e) {
	e.printStackTrace();
}
%>
<jsp:forward page="p-list.jsp"></jsp:forward>
</body>
</html>