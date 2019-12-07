package wz.controller;

import org.json.JSONObject;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
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

    @RequestMapping("hot")
    @ResponseBody
    public Object hot(){
        Map<String, Object> json = new HashMap<>();
        json.put("songs", songsMapper.selHot());
        return json;
        //songsMapper.selHot();
    }

}
