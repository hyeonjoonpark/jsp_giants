<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>롯데자이언츠 코치별 선수 관리 목록</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>롯데자이언츠 코치별 선수 관리 목록</h1>
	<form>
		<table border="1">
			<tr>
				<td>코치번호</td>
				<td>코치이름</td>
				<td>코치포지션</td>
				<td>관리선수</td>
				<td>관리선수연봉합계</td>
				<td>관리선수평균연봉</td>
				<td>관리선수최대연봉</td>
				<td>관리선수최소연봉</td>
			</tr>
			<%
			request.getParameter("cid");
			request.getParameter("cname");
			request.getParameter("cposition");
			request.getParameter("pname");
			request.getParameter("pcost");
				try {
					Class.forName("oracle.jdbc.OracleDriver");
					Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
					String sql = "select gc.cid, gc.cname, gc.cposition, count(gp.pname), sum(gm.pcost), avg(gm.pcost), max(gm.pcost), min(gm.pcost) " +
								"from giants_player gp, giants_coach gc, giants_money gm " + 
								"where gp.pid = gm.pid and gc.cid = gm.cid " + 
								"group by gc.cid, gc.cname, gc.cposition";
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					while(rs.next()){
				%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %>명</td>
					<td><%=rs.getInt(5) %></td>
					<td><%=rs.getInt(6) %></td>
					<td><%=rs.getInt(7) %></td>
					<td><%=rs.getInt(8) %></td>
				</tr>
				<% 
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
			
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>