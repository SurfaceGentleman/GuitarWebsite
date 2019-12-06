package wz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import wz.service.SingersService;

import javax.annotation.Resource;

@Controller
public class SingersController {
    @Resource
    private SingersService singersService;

    @RequestMapping("singers")
    @ResponseBody
    public void search() {
        System.out.println(singersService.show());
    }



}
