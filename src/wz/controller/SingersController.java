package wz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import wz.pojo.PageInfo;
import wz.service.SingersService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class SingersController {

    @Resource
    private SingersService singersService;

    //数据应该没什么问题
    @RequestMapping("/singers")
    public String singers(@RequestParam(defaultValue = "12") int pageSize, @RequestParam(defaultValue = "1") int pageNumber, HttpServletRequest req) {
        Map<String, Object> map = new HashMap<>();
        PageInfo pi = singersService.showPage(pageSize, pageNumber);
        req.setAttribute("PageInfo", pi);
        return "singers_manager.jsp";
    }

    //删除歌手
    @RequestMapping("/del_singer")
    public String delSinger(@RequestParam(defaultValue = "0") int id) {
        int result = singersService.delSinger(id);
        System.out.println(result);
        return "/singers";
    }

}
