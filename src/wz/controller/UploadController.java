package wz.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import wz.mapper.SongsMapper;
import wz.pojo.Songs;
import wz.service.SongsService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Controller
public class UploadController {
    @Resource
    private SongsService songsService;

    //上传歌曲资源
    @RequestMapping("upload_song")
    public String uploadSong(@RequestParam("file") MultipartFile[] files, int number, String format, int id, HttpServletRequest req) throws IOException {
        int i = 0;
        //上传文件
        for (MultipartFile file : files) {
            i++;
            if (file.getOriginalFilename() == "") {
                System.out.println("文件错误!");
                return "error.jsp";
            }
            String fileName = file.getOriginalFilename();
            System.out.println(fileName);
            //记得修改
            String path = req.getServletContext().getRealPath("songs") + "/" + id + "/music/" + id + "_" + i + "."+ format;
            System.out.println(path);
            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path));
        }

        int result = songsService.updGuitar(number, format, id);
        System.out.println("上传吉他谱结果：" + result);
        return "manager.jsp";
    }

}
