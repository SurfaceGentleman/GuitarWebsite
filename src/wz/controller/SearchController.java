package wz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import wz.mapper.SingersMapper;
import wz.mapper.SongsMapper;
import wz.pojo.Singers;
import wz.pojo.Songs;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
public class SearchController {
    @Resource
    private SingersMapper singersMapper;
    @Resource
    private SongsMapper songsMapper;

    @RequestMapping("/search")
    @ResponseBody
    public Object serach(String str, HttpServletRequest request, HttpServletResponse response) {

        String searchStr = str;
        request.setAttribute("str", searchStr);
        System.out.println("search处的str：" + searchStr);

        List<Songs> songsList = songsMapper.selByName(searchStr);
        List<Singers> singersList = singersMapper.selByName(searchStr);
        System.out.println(songsList);
        System.out.println(singersList);

        Map<Object, Object> jsonObject = new HashMap<>();
        jsonObject.put("songs", songsList);
        jsonObject.put("singers", singersList);
        System.out.println(jsonObject);
        return jsonObject;

    }

    //将字符串传至前端，由前端使用Ajax请求访问后端
    @RequestMapping("/result")
    public String result(String str, HttpServletRequest request, HttpServletResponse response) {
        String searchStr = (String) request.getParameter("str");
        System.out.println(searchStr);
        if (null == searchStr) {
            searchStr = "";
        }
        System.out.println(searchStr);
        request.setAttribute("str", searchStr);
        return "result.jsp";
    }

    @RequestMapping("/hot")
    @ResponseBody
    public Object hot() {
        Map<String, Object> json = new HashMap<>();
        json.put("songs", songsMapper.selHot());
        json.put("singers", singersMapper.selHot());
        return json;
        //songsMapper.selHot();
    }

    //直接由后端生成并存入request中
    @RequestMapping("/singer_song")
    public String singer_song(@RequestParam(defaultValue = "0") int id, HttpServletRequest request, HttpServletResponse response) {
        if (request.getParameter("id") == null) {
            id = 0;
        } else {
            Integer.parseInt(request.getParameter("id"));
        }
        System.out.println("id是：" + id);
        List<Songs> songsList = songsMapper.selBySid(id);

        request.setAttribute("songs", songsList);
        return "result_singer.jsp";
    }


    //选择所有的信息
    @RequestMapping("/all")
    @ResponseBody
    public Object all(HttpServletRequest request, HttpServletResponse response) {
        List<Songs> songsList = songsMapper.selAll();
        List<Singers> singersList = singersMapper.selAll();
        Map<String, Object> map = new HashMap<>();
        map.put("songs", songsList);
        map.put("singers", singersList);
        System.out.println("发送了管理员页面请求");
        return map;
    }


}
