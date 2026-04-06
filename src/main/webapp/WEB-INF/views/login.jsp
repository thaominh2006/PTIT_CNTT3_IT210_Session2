<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/6/2026
  Time: 10:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Đăng nhập</title>
</head>
<body>

<h2>Đăng nhập hệ thống</h2>

<%-- Hiển thị lỗi từ Request Scope --%>
<c:if test="${not empty error}">
    <div style="color: red; border: 1px solid red; padding: 10px; margin-bottom: 10px;">
        <strong>Lỗi:</strong> ${error}
    </div>
</c:if>

<form action="${pageContext.request.contextPath}/login" method="post">
    <div>
        <label>Tên đăng nhập:</label>
        <input type="text" name="username" required/>
    </div>
    <div style="margin-top: 10px;">
        <label>Mật khẩu:</label>
        <input type="password" name="password" required/>
    </div>
    <div style="margin-top: 10px;">
        <button type="submit">Đăng nhập</button>
    </div>
</form>

<hr/>
<p><strong>Tài khoản demo:</strong></p>
<p>Admin: admin / admin123</p>
<p>Staff: staff / staff123</p>

</body>
</html>
