package wz.controller;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class GuitarPageController {
    @RequestMapping("page")
    public String page(String id, int pages, String format,HttpServletRequest request){
        System.out.println(id);
        System.out.println(pages);
        System.out.println(format);

        request.setAttribute("id", id);
        request.setAttribute("pages", pages);
        request.setAttribute("format", format);

        return "guitarShow.jsp";
    }
}
