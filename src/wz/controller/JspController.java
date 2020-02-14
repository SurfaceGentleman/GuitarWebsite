package wz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class JspController {
    @RequestMapping("main")
    public String main() {
        return "main.jsp";
    }

    @RequestMapping("error")
    public String error() {
        return "error.jsp";
    }

    @RequestMapping("admin")
    public String admin(HttpServletRequest req) {
        if (req.getSession().getAttribute("admin") == null) {
            return "adminLogin.jsp";
        }
        String value = (String) req.getSession().getAttribute("admin");
        if ("true" == value) {
            return "manager.jsp";
        } else {
            return "adminLogin.jsp";
        }

    }

    //跳转页面
    @RequestMapping("go_reg")
    public String goReg() {
        return "reg.jsp";
    }

    @RequestMapping("go_modify")
    public String goModify(HttpServletRequest request) {
        if (request.getSession().getAttribute("user") == null) {
            request.setAttribute("error", "请先登录！");
            return "error.jsp";
        }
        return "modify.jsp";
    }

}
