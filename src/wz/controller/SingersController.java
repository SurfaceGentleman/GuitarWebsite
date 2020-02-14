package wz.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import wz.pojo.PageInfo;
import wz.service.SingersService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class SingersController {

    @Resource
    private SingersService singersService;

    //数据应该没什么问题
    @RequestMapping("singers")
    public String singers(@RequestParam(defaultValue = "12") int pageSize, @RequestParam(defaultValue = "1") int pageNumber, HttpServletRequest req) {
        Map<String, Object> map = new HashMap<>();
        PageInfo pi = singersService.showPage(pageSize, pageNumber);
        req.setAttribute("PageInfo", pi);
        return "singers_manager.jsp";
    }

    //删除歌手
    @RequestMapping("del_singer")
    public String delSinger(@RequestParam(defaultValue = "0") int id) {
        int result = singersService.delSinger(id);
        System.out.println(result);
        return "redirect:singers";
    }

    //添加歌手
    @RequestMapping("ins_singer")
    public String insSinger(MultipartFile photo, String name, @RequestParam(defaultValue = "") String introduce, HttpServletRequest req) throws IOException {
        //处理文件
        if (photo.getOriginalFilename() == "") {
            System.out.println("图片错误!");
            return "error.jsp";
        }

        String fileName = UUID.randomUUID().toString() + photo.getOriginalFilename().substring(photo.getOriginalFilename().lastIndexOf("."));
        String path = req.getServletContext().getRealPath("images") + "/singers/" + fileName;
        System.out.println(path);
//        String fileName = photo.getOriginalFilename();
//        System.out.println(fileName);
//        String path = req.getServletContext().getRealPath("images") + "/singers/" + fileName;
//        System.out.println(path);
        FileUtils.copyInputStreamToFile(photo.getInputStream(), new File(path));
        //文件已处理完毕
        int result = singersService.insSinger(name, introduce, fileName);

        return "redirect:manager.jsp";
    }

    //修改歌手信息
    @RequestMapping("upd_singer")
    public String updSinger(int id, MultipartFile photo, String name, @RequestParam(defaultValue = "") String introduce, HttpServletRequest req) throws IOException {
        //处理文件
        if (photo.getOriginalFilename() == "") {
            System.out.println("图片错误!");
            return "error.jsp";
        }
        String fileName = UUID.randomUUID().toString() + photo.getOriginalFilename().substring(photo.getOriginalFilename().lastIndexOf("."));
        String path = req.getServletContext().getRealPath("images") + "/singers/" + fileName;
        System.out.println(path);
        FileUtils.copyInputStreamToFile(photo.getInputStream(), new File(path));
        //文件已处理完毕
        singersService.updSinger(id, name, introduce, fileName);

        return "redirect:manager.jsp";
    }


}
