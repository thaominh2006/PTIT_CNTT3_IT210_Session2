<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/6/2026
  Time: 10:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<html>
<head>
    <title>Tìm kiếm sự kiện</title>
</head>
<body>

<h1>Tìm kiếm sự kiện</h1>

<form action="${pageContext.request.contextPath}/events/search" method="get">
    <input type="text" name="keyword" value="<c:out value='${keyword}'/>" placeholder="Nhập từ khóa..."/>
    <button type="submit">Tìm kiếm</button>
</form>

<hr/>

<h2>Kết quả tìm kiếm cho: <strong><c:out value="${keyword}"/></strong></h2>
<p>Tìm thấy ${totalFound} sự kiện</p>

<c:if test="${empty events}">
    <p>Không tìm thấy sự kiện nào phù hợp.</p>
</c:if>

<c:if test="${not empty events}">
    <table border="1">
        <thead>
        <tr>
            <th>STT</th>
            <th>Tên sự kiện</th>
            <th>Ngày tổ chức</th>
            <th>Giá vé</th>
            <th>Vé còn lại</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="event" items="${events}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td><c:out value="${event.name}"/></td>
                <td>${event.eventDate}</td>
                <td>
                    <c:choose>
                        <c:when test="${event.price == 0}">
                            MIỄN PHÍ
                        </c:when>
                        <c:otherwise>
                            <fmt:formatNumber value="${event.price}" type="currency" currencySymbol="₫"/>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${event.remainingTickets == 0}">
                            HẾT VÉ
                        </c:when>
                        <c:when test="${event.remainingTickets < 10}">
                            Sắp hết (còn ${event.remainingTickets} vé)
                        </c:when>
                        <c:otherwise>
                            ${event.remainingTickets}
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${event.remainingTickets == 0}">
                            HẾT VÉ
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/events/${event.id}/book'/>">Đặt vé</a>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

<hr/>

<h3>Thông tin thêm:</h3>
<c:if test="${not empty events}">
    <p>Tên sự kiện đầu tiên: ${fn:toUpperCase(events[0].name)}</p>
</c:if>
<p>Số ký tự của từ khóa tìm kiếm: ${fn:length(keyword)} ký tự</p>

</body>
</html>
