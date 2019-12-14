package wz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import wz.pojo.Admin;
import wz.service.AdminService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class AdminController {
    @Resource
    private AdminService adminService;

    @RequestMapping("admin_login")
    public String adminLogin(@RequestParam(defaultValue = "") String name, @RequestParam(defaultValue = "") String password, HttpServletRequest req, HttpServletResponse resp) {
        Admin admin = new Admin();
        admin.setName(name);
        admin.setPassword(password);

        Admin resultAdmin = adminService.login(admin);

        if (resultAdmin == null) {
            req.setAttribute("status", "用户名或密码不存在");
            return "adminLogin.jsp";
        }else {
            req.getSession().setAttribute("admin", "true");
            return "manager.jsp";
        }
    }
}
