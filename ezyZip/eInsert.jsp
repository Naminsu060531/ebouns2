<%@ include file="db.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
    function check() {
        var eid = document.getElementsByName("eid")[0].value;
        var ename = document.getElementsByName("ename")[0].value;
        var deptcode = document.getElementsByName("deptcode")[0].value;
        var grade = document.getElementsByName("grade")[0].value;
        var salary = document.getElementsByName("salary")[0].value;

        var checkValue = true;

        if(eid == "") {
            alert("사번이 비어있습니다.");
            checkValue = false;
        }
        if(ename == "") {
            alert("이름이 비어있습니다.");
            checkValue = false;
        }
        if(deptcode == "") {
            alert("부서코드가 비어있습니다.");
            checkValue = false;
        }
        if(grade == "") {
            alert("직급이 비어있습니다.");
            checkValue = false;
        }
        if(salary == "") {
            alert("계약연봉이 비어있습니다.");
            checkValue = false;
        }

        if(checkValue) {
            alert("등록완료");
            document.forms["insertForm"].submit();
        }
    }
</script>
</head>
<body>
    <jsp:include page="header.jsp" />

    <section
        style="position: fixed; top: 70px; left: 0px; width: 100%; height: 100%; background-color: lightgray;">
        <h2 style="text-align: center;">직원입력</h2>

        <form name="insertForm" action="./eInsertAction.jsp" method="post"
            style="display: flex; align-items: center; justify-content: center; text-align: center;">
            <table border="1">
                <tr>
                    <td>사번</td>
                    <td><input name="eid" type="text"></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input name="ename" type="text"></td>
                </tr>
                <tr>
                    <td>부서코드</td>
                    <td><select name="deptcode">
                            <%
                            try {
                                String sql = "SELECT deptcode, deptname FROM TBL_DEPART_202406 ORDER BY deptcode";
                                PreparedStatement pstmt = con.prepareStatement(sql);
                                ResultSet rs = pstmt.executeQuery();
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("deptcode")%>">
                                <%=rs.getString("deptcode")%>-<%=rs.getString("deptname")%>
                            </option>
                            <%
                                }
                                rs.close();
                                pstmt.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                            %>
                    </select></td>
                </tr>
                <tr>
                    <td>직급</td>
                    <td><input name="grade" type="text"></td>
                </tr>
                <tr>
                    <td>계약연봉</td>
                    <td><input name="salary" type="number"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="button" value="등록" onclick="check()" /> 
                    <input type="reset" value="다시쓰기" /></td>
                </tr>
            </table>
        </form>

    </section>

    <jsp:include page="footer.jsp" />
</body>
</html>
