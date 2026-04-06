## 1. Tại sao thông báo lỗi đăng nhập phải lưu vào Request Scope mà không phải Session Scope?

**Request Scope** chỉ tồn tại trong một request duy nhất. Sau khi response được gửi về client, dữ liệu sẽ biến mất.

**Session Scope** tồn tại xuyên suốt phiên làm việc của người dùng, từ khi đăng nhập đến khi đăng xuất hoặc session hết hạn.

### Hậu quả nếu lưu nhầm vào Session Scope

| Tình huống | Kết quả |
|------------|---------|
| Người dùng nhập sai mật khẩu | Thông báo lỗi hiển thị |
| Người dùng nhập đúng mật khẩu lần sau | Vẫn thấy thông báo lỗi cũ |
| Đăng xuất rồi đăng nhập lại | Thông báo lỗi vẫn còn (nếu session chưa hết hạn) |
| Nhiều người dùng chung máy | Thông báo lỗi của người này có thể xuất hiện với người khác |

### Kết luận
Thông báo lỗi chỉ cần hiển thị **một lần duy nhất** sau khi submit form sai. Do đó phải lưu vào **Request Scope** (dùng `RedirectAttributes.addFlashAttribute()`).


## 2. Tại sao totalViewCount phải lưu vào Application Scope?

**Application Scope** chia sẻ dữ liệu cho **tất cả người dùng** và tất cả session. Dữ liệu tồn tại trong suốt vòng đời của ứng dụng.

### Nếu lưu vào Session Scope

| Nhân viên | Số lần xem | Session Scope | Kết quả hiển thị |
|-----------|------------|---------------|------------------|
| Nhân viên A | 3 lần | 3 | Thấy 3 (đúng với lượt xem của A) |
| Nhân viên B | 2 lần | 2 | Thấy 2 (sai vì tổng là 5) |
| Nhân viên C | 1 lần | 1 | Thấy 1 (sai vì tổng là 6) |

### Kết luận
- **Session Scope** → mỗi nhân viên thấy số lần xem của riêng họ
- **Application Scope** → tất cả nhân viên thấy cùng một số (tổng lượt xem toàn hệ thống)

Yêu cầu bài toán là đếm **tổng số lượt xem trên toàn hệ thống**, chia sẻ cho tất cả nhân viên → phải dùng **Application Scope**.

## 3. Race Condition là gì? Cách phòng tránh


**Race Condition** là hiện tượng nhiều thread cùng truy cập và thay đổi dữ liệu chia sẻ tại cùng một thời điểm, dẫn đến kết quả không đúng hoặc mất dữ liệu.

### Đoạn code có vấn đề

```java
Integer count = (Integer) application.getAttribute("totalViewCount");
if (count == null) count = 0;
count++;
application.setAttribute("totalViewCount", count);