<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/6/2026
  Time: 9:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- JSP Comment: Trang báo cáo điểm sinh viên --%>

<!DOCTYPE html>
<html>
<head>
    <title>Báo cáo điểm</title>
</head>
<body>

<h1>${reportTitle}</h1>

<table border="1">
    <thead>
    <tr>
        <th>STT</th>
        <th>Họ tên</th>
        <th>Điểm</th>
        <th>Xếp loại</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="student" items="${studentList}" varStatus="status">
        <c:choose>
            <c:when test="${student.score >= 90}">
                <c:set var="rank" value="Xuất sắc"/>
            </c:when>
            <c:when test="${student.score >= 80}">
                <c:set var="rank" value="Giỏi"/>
            </c:when>
            <c:when test="${student.score >= 70}">
                <c:set var="rank" value="Khá"/>
            </c:when>
            <c:when test="${student.score >= 60}">
                <c:set var="rank" value="Trung bình khá"/>
            </c:when>
            <c:when test="${student.score >= 50}">
                <c:set var="rank" value="Trung bình"/>
            </c:when>
            <c:otherwise>
                <c:set var="rank" value="Yếu"/>
            </c:otherwise>
        </c:choose>
        <tr>
            <td>${status.count}</td>
            <td><c:out value="${student.fullName}"/></td>
            <td>${student.score}</td>
            <td>${rank}</td>
        </tr>
    </c:forEach>

    <c:if test="${empty studentList}">
        <tr>
            <td colspan="4" align="center">Không có dữ liệu sinh viên</td>
        </tr>
    </c:if>
    </tbody>
</table>

</body>
</html>
