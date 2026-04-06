<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/6/2026
  Time: 10:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <title>Danh sách đơn hàng</title>
</head>
<body>

<h2>Xin chào, ${sessionScope.loggedUser}!</h2>
<p>Vai trò: ${sessionScope.role}</p>

<hr/>

<h3>Danh sách đơn hàng của bạn</h3>

<table border="1">
    <thead>
    <tr>
        <th>STT</th>
        <th>Mã đơn</th>
        <th>Tên sản phẩm</th>
        <th>Tổng tiền</th>
        <th>Ngày đặt</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="order" items="${orders}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${order.orderId}</td>
            <td>${order.productName}</td>
            <td><fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="₫"/></td>
            <td><fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy"/></td>
        </tr>
    </c:forEach>

    <c:if test="${empty orders}">
        <tr>
            <td colspan="5" align="center">Không có đơn hàng nào</td>
        </tr>
    </c:if>
    </tbody>
</table>

<hr/>

<h3>Tổng lượt xem đơn hàng toàn hệ thống: <strong>${applicationScope.totalViewCount}</strong></h3>

<br/>
<a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>

</body>
</html>
