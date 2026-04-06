package ra.edu.session2.Bai3.controller;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AuthController {
    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }
    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, HttpSession session, RedirectAttributes redirectAttributes) {

        // kiểm tra đăng nhập
        if ("admin".equals(username) && "admin123".equals(password)) {
            session.setAttribute("loggedUser", username);
            session.setAttribute("role", "Administrator");
            return "redirect:/orders";
        } else if ("staff".equals(username) && "staff123".equals(password)) {
            session.setAttribute("loggedUser", username);
            session.setAttribute("role", "Staff");
            return "redirect:/orders";
        } else {
            redirectAttributes.addFlashAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!");
            return "redirect:/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
