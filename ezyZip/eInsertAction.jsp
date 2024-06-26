<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String eid = request.getParameter("eid");
String ename = request.getParameter("ename");
String deptcode = request.getParameter("deptcode");
String grade = request.getParameter("grade");
String salary = request.getParameter("salary");

// DB 저장
try {
	String sql = "INSERT INTO TBL_EMPLOYEE_202406 VALUES (?, ?, ?, ?, ?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, eid);
	pstmt.setString(2, ename);
	pstmt.setString(3, deptcode);
	pstmt.setString(4, grade);
	pstmt.setString(5, salary);
	
	pstmt.execute();
} catch(Exception e) {
	e.printStackTrace();
}

%>
<jsp:forward page="./eInsert.jsp"></jsp:forward>