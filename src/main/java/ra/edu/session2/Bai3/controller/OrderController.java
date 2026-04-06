package ra.edu.session2.Bai3.controller;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import ra.edu.session2.Bai3.model.Order;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {
    @GetMapping("/orders")
    public String showOrders(HttpSession session, Model model, ServletContext application) {

        // kiểm tra đăng nhập
        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/login";
        }
        List<Order> orders = new ArrayList<>();
        orders.add(new Order("ORD001", "Laptop Dell XPS", 25000000, new Date(2024, 0, 15)));
        orders.add(new Order("ORD002", "IPhone 15 Pro", 28990000, new Date(2024, 1, 20)));
        orders.add(new Order("ORD003", "Tai nghe Sony", 3500000, new Date(2024, 2, 5)));
        orders.add(new Order("ORD004", "Bàn phím cơ", 1250000, new Date(2024, 2, 10)));
        orders.add(new Order("ORD005", "Chuột", 890000, new Date(2024, 2, 12)));

        model.addAttribute("orders", orders);

        synchronized (application) {
            Integer totalViewCount = (Integer) application.getAttribute("totalViewCount");
            if (totalViewCount == null) {
                totalViewCount = 0;
            }
            totalViewCount++;
            application.setAttribute("totalViewCount", totalViewCount);
        }

        return "orders";
    }
}
