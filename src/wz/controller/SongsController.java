package wz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    //插入歌曲
    @RequestMapping("/insert_song")
    public String insSong(String name, int sid) {
        int result = songsService.insSong(name, sid);
        System.out.println("插入的结果:" + result);
        return "manager.jsp";
    }

    //修改歌曲信息
    @RequestMapping("/upd_song")
    public String updSong(String name, int sid, int id) {
        int result = songsService.updSong(name, sid, id);
        System.out.println("更新歌曲结果:" + result);

        return "manager.jsp";
    }

}
