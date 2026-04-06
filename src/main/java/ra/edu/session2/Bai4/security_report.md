## 1. XSS là gì? Tại sao `<c:out value="${keyword}"/>` an toàn hơn `${keyword}`?

### XSS (Cross-Site Scripting):
XSS là lỗ hổng bảo mật cho phép kẻ tấn công chèn mã độc (JavaScript, HTML) vào trang web, khiến trình duyệt nạn nhân thực thi mã độc đó.

### So sánh `<c:out>` và `${}`:

| Cách viết | HTML output khi input `<script>alert(1)</script>` | Kết quả |
|-----------|---------------------------------------------------|---------|
| `${keyword}` | `<script>alert(1)</script>` | Trình duyệt thực thi script → popup |
| `<c:out value="${keyword}"/>` | `&lt;script&gt;alert(1)&lt;/script&gt;` | Hiển thị text thuần, không thực thi |

### Tại sao an toàn hơn?
- `<c:out>` tự động escape các ký tự đặc biệt HTML: `<` → `&lt;`, `>` → `&gt;`, `"` → `&quot;`
- Ngăn chặn việc render mã độc thành HTML thực thi được


## 2. Sự khác nhau giữa `<c:if>` và `<c:choose>/<c:when>/<c:otherwise>`


| Đặc điểm | `<c:if>` | `<c:choose>/<c:when>/<c:otherwise>` |
|----------|----------|-------------------------------------|
| Số điều kiện | Chỉ 1 điều kiện | Nhiều điều kiện (if-else if-else) |
| Có else không | Không (chỉ if) | Có (otherwise) |
| Use case | Kiểm tra đơn giản yes/no | Nhiều nhánh rẽ nhánh |

### Trong bài này

**Phần "Vé còn lại"** có 3 trường hợp:
- HẾT VÉ (remainingTickets == 0)
- Sắp hết (remainingTickets < 10)
- Bình thường (remainingTickets >= 10)

**Dùng `<c:choose>`** vì có nhiều hơn 2 điều kiện.

**Phần "Giá vé"** có 2 trường hợp:
- MIỄN PHÍ (price == 0)
- Có giá (price > 0)

Có thể dùng `<c:if>` hoặc `<c:choose>`. Nên dùng `<c:choose>` để đồng nhất code.


## 3. `<c:url>` giải quyết vấn đề gì?

### Vấn đề:
Khi deploy ứng dụng với context path khác nhau:
- Deploy với context path `/` → URL: `/events/1/book`
- Deploy với context path `/ticketing` → URL: `/ticketing/events/1/book`

Nếu hardcode `href="/events/1/book"` sẽ bị lỗi 404 khi context path không phải `/`.

### Giải pháp `<c:url>`
```jsp
<a href="<c:url value='/events/${event.id}/book'/>">Đặt vé</a>