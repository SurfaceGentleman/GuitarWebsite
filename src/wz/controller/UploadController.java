package wz.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import wz.mapper.SongsMapper;
import wz.pojo.Songs;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Controller
public class UploadController {
    @Resource
    private SongsMapper songsMapper;

//    //上传歌曲资源
//    @RequestMapping("upload_song")
//    public String uploadSong(@RequestParam("file") MultipartFile[] files, int id, String name, int sid, int number, String format, HttpServletRequest req) throws IOException {
//        for (MultipartFile file : files) {
//            if (file.getOriginalFilename() == "") {
//                System.out.println("error!");
//                return "error.jsp";
//            }
//            String fileName = file.getOriginalFilename();
//            System.out.println(fileName);
//            //记得修改
//            //String path = req.getServletContext().getRealPath("images") + "/" + fileName;
//            System.out.println(path);
//            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path));
//        }
//
//        return "manager.jsp";
//    }

//    //上传歌手信息,
//    @RequestMapping("add_singer")
//    public String addSinger(MultipartFile file, HttpServletRequest request) {
//
//    }

}
