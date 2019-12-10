package wz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import wz.pojo.PageInfo;
import wz.service.SongsService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class SongsController {
    @Resource
    private SongsService songsService;

    //数据应该没什么问题
    @RequestMapping("/songs")
    public Object songs(@RequestParam(defaultValue = "12") int pageSize, @RequestParam(defaultValue = "1") int pageNumber, HttpServletRequest req) {
        Map<String, Object> map = new HashMap<>();
        PageInfo pi = songsService.showPage(pageSize, pageNumber);
        req.setAttribute("PageInfo", pi);
        return "songs_manager.jsp";
    }

    //删除歌曲
    @RequestMapping("/del_song")
    public String delSong(@RequestParam(defaultValue = "0") int id) {
        int result = songsService.delSong(id);
        return "/songs";
    }

}
