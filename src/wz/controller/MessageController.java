package wz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import wz.pojo.PageInfo;
import wz.pojo.Users;
import wz.service.MessageService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MessageController {
    @Resource
    private MessageService messageService;

    @RequestMapping("mess/ins")
    public String insMessage(HttpServletRequest request, @RequestParam(defaultValue = "") String message, int bid) {
        //判断长度
        if (message.length() > 500) {
            request.setAttribute("error", "您的输入过长！(500字以内)");
            return "/error.jsp";
        }
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            request.setAttribute("error", "请先登录！");
            return "/error.jsp";
        }
        Users user = (Users) session.getAttribute("user");
        Date date = new Date();
        System.out.println(date);
        messageService.insMessage(user.getId(), message, date, bid);
        return "/mess/show";
    }

    //test
//    @RequestMapping("mess/show")
//    public String showMessage(HttpServletRequest request) {
//        List<Message> list = messageService.show();
//        request.setAttribute("message", list);
//        return "message.jsp";
//    }

    //分页浏览
    @RequestMapping("mess/show")
    public String showMessageByPage(@RequestParam(defaultValue = "18") int pageSize, @RequestParam(defaultValue = "1") int pageNumber, HttpServletRequest req){
        Map<String, Object> map = new HashMap<>();
        PageInfo pi = messageService.pageShow(pageSize, pageNumber);
        req.setAttribute("PageInfo", pi);
        return "/message.jsp";
    }

}
