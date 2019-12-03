package wz.controller;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

    @RequestMapping("serach")
    @ResponseBody
    public Object serach(String str, HttpServletRequest request, HttpServletResponse response) {

        String searchStr = (String) request.getAttribute("str");
        System.out.println(searchStr);
        if (null == searchStr){
            searchStr = "";
        }
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
}
