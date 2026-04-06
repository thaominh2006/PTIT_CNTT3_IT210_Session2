package ra.edu.session2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping({"/","/test"})
public class HelloController {

    @GetMapping
    public String hello() {
        return "demo_jsp";
    }
}