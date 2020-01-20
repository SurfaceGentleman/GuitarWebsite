package wz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import wz.service.BoardService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
public class BoardController {
    @Resource
    private BoardService boardService;

    @RequestMapping("board_show")
    @ResponseBody
    public Object show(){
        Map<String, Object> json = new HashMap<>();
        json.put("boards", boardService.show());
        return json;
    }
}
