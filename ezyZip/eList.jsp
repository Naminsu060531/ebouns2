<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="db.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원확인</title>
</head>
<body>
	<jsp:include page="./header.jsp"></jsp:include>
	<section
		style="position: fixed; top: 70px; left: 0px; width: 100%; height: 100%; background-color: lightgray;">
		<h2 style="text-align: center;">학생정보현황</h2>
		<table border="1"
			style="margin-left: auto; margin-right: auto; text-align: center;">
			<thead>
				<tr>
					<th>직원아이디</th>
					<th>직원이름</th>
					<th>부서아이디</th>
					<th>직급</th>
					<th>급여</th>
				</tr>
			</thead>
			<tbody>
				<%
				try {
					String sql = "SELECT eid, ename, deptcode, grade, salary FROM TBL_EMPLOYEE_202406";
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while (rs.next()) {
						String salary = rs.getString(5);
						String salaryFormat = salary.substring(0,1)+","+salary.substring(1,4)+"만원";
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=salaryFormat%></td>
				</tr>
				<%
					}
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</tbody>
		</table>

	</section>
	<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>