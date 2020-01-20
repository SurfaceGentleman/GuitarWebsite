package wz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import wz.pojo.Bookmark;
import wz.pojo.PageInfo;
import wz.pojo.Users;
import wz.service.BookService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BookController {
    @Resource
    private BookService bookService;


    @RequestMapping("bookShow")
    public String showBookByPage(@RequestParam(defaultValue = "12") int pageSize, @RequestParam(defaultValue = "1") int pageNumber, HttpServletRequest req) {
        //判断是否用户为空
        if (req.getSession().getAttribute("user") == null) {
            req.setAttribute("error", "请先登录!");
            return "error.jsp";
        }
        Users user = (Users) req.getSession().getAttribute("user");
        PageInfo pi = bookService.selByUid(user.getId(), pageSize, pageNumber);
        System.out.println(pi);
        req.setAttribute("PageInfo", pi);
        return "book.jsp";
    }

    @RequestMapping("bookdel")
    public String delBookmark(HttpServletRequest request, int id) {
        //判断是否用户为空
        if (request.getSession().getAttribute("user") == null) {
            request.setAttribute("error", "请先登录!");
            return "error.jsp";
        }
        Users user = (Users) request.getSession().getAttribute("user");

        int result = bookService.delBookMark(id);
        return "bookShow";
    }



    @RequestMapping("bookins")
    public String insBook(HttpServletRequest request, int sid) {
        //判断是否用户为空
        if (request.getSession().getAttribute("user") == null) {
            request.setAttribute("error", "请先登录!");
            return "error.jsp";
        }
        //判断是否已收藏
        Users user = (Users) request.getSession().getAttribute("user");
        if (bookService.selByUnameAndSid(user.getId(), sid) == 0) {

            bookService.insBookmark(sid, new Date(), user.getId());
            request.setAttribute("book", "true");
            return "main.jsp";

        } else {
            request.setAttribute("error", "您已收藏!");
            return "error.jsp";
        }


    }


}
